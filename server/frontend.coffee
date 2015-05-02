React       = require 'react'
url         = require 'url'
Router      = React.createFactory(require '../client/scripts/router.coffee')

module.exports = (app) ->
  app.get '*', (req, res) ->
    console.log "GET Request with session:#{JSON.stringify(req.session.user)} for link #{req.param('link')}"

    props =
      user:req.session.user,
      installLink:req.param('link')
      path: url.parse(req.url).pathname

    res.send(
      React.renderToString(
        Router(props)
      )
    )