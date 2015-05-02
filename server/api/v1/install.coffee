Request      = require 'superagent'
Twilio       = require('twilio')(process.env.TWILIO_API_KEY, process.env.TWILIO_API_KEY_SECRET)
Mongoose     = require 'mongoose'
Installation = Mongoose.model 'Installation'

module.exports = (app) ->
  app.post '/api/v1/install', (req, res) ->
    onSent = (err, responseData) ->
      if err
        console.log "Twilio response: err:#{JSON.stringify(err)} response:#{JSON.stringify(responseData)}"
      res.send responseData

    messageBody =
      to:req.session.user.phone_number
      from: '4233435737'
      body: "You asked me to send a link #{req.param('link')}"

    if req.param('link') is undefined
      res.send 'No link!'
    else
      installation = new Installation req.session.user

      installation.save (err, _installation)->
        if err
          console.log "Error saving #{_installation} to mongo #{err}"
        Twilio.sendMessage messageBody, onSent