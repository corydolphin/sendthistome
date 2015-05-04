React    = require 'react'
Request  = require 'superagent'

InstallButton = React.createClass
  propTypes:
    installLink: React.PropTypes.string.isRequired
    user: React.PropTypes.object.isRequired

  getInitialState: ->
    completed: false

  componentDidMount: ->
    Request
     .post '/api/v1/install'
     .query({ link: @props.installLink })
     .end (err, res) =>
       console.log "POST /api/v1/install response: err:#{JSON.stringify(err)} response:#{JSON.stringify(res)}"
       @setState completed:true
       unless @props.noCloseWhenFinished
        setTimeout window.close, 1000


  render: () ->
    console.log "Render install called. props:#{JSON.stringify(@props)} state:#{JSON.stringify(@state)}"
    if @state.completed
      React.createElement "div", {className: "icon-block"},
        React.createElement "h2", {className: "center light-blue-text"},
          React.createElement "i", {className: "mdi-navigation-check"}
    else
      React.createElement 'div', {className:'progress'},
        React.createElement 'div', {className:'indeterminate'}

module.exports = InstallButton
