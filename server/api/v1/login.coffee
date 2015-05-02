Request   = require 'superagent'
Mongoose  = require 'mongoose'
User      = Mongoose.model 'User'

module.exports = (app) ->
  app.post '/api/v1/login', (req, res) ->
    Request
      .get 'https://www.digits.com/sdk/user'
      .set 'Authorization', req.header 'X-Verify-Credentials-Authorization'
      .end (err, result) ->
        if err
          console.log "Digits response: err:#{JSON.stringify(err)} response:#{JSON.stringify(result)}"

        req.session.user = result.body
        user = new User req.session.user
        user.save (err, _user) ->
          if err
            console.log "Error saving #{_installation} to mongo #{err}"
          res.json result.body