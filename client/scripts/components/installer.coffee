React            = require 'react'
Login            = React.createFactory require './login.coffee'
InstallButton    = React.createFactory require './install_button.coffee'
Header           = React.createFactory require './header.coffee'
Footer           = React.createFactory require './footer.coffee'
Marketing        = React.createFactory require './marketing.coffee'
Badge            = React.createFactory require './badge.coffee'


InstallFlow = React.createClass
  propTypes:
    installLink: React.PropTypes.string.isRequired
    user: React.PropTypes.object

  getInitialState: -> user: @props.user
  setUser: (user) -> @setState user:user

  render: () ->
    console.log "InstallFlow props: #{JSON.stringify(@props)}"
    React.createElement 'div', {className:"container"},
      React.createElement 'div', {className:"row"},
        React.createElement 'div', {className:"col l4 offset-l4 m4 offset-m4 s8 offset-s2"},
          React.createElement 'div', {className:"card-panel grey lighten-5 z-depth-1 col"},
            Badge installLink:@props.installLink
            if @state.user
              InstallButton
                user: @state.user,
                installLink: @props.installLink
            else
              Login
                userUpdated: @setUser

module.exports = InstallFlow
