React            = require 'react'
Html             = React.createFactory require './html.coffee'
Installer        = React.createFactory require './components/installer.coffee'
Marketing        = React.createFactory require './components/marketing.coffee'

Router = React.createClass
  propTypes:
    user:        React.PropTypes.object
    path:        React.PropTypes.string.isRequired
    installLink: React.PropTypes.string


  getComponent: (path) ->
    if path is '/install'
      console.log 'install'
      Installer @props
    else
      console.log 'not install'
      Marketing @props

  render:()->
    Html
      component: @getComponent(@props.path)
      bootstrapData: @props

# Render the app only if we are INSIDE the browser.
if typeof window != 'undefined'
  React.render(
    React.createElement Router, BOOTSTRAP_DATA
    document
  )

module.exports = Router