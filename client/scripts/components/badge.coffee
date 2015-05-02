React    = require 'react'
Request  = require 'superagent'

Badge = React.createClass
  propTypes:
    installLink: React.PropTypes.string.isRequired

  getInitialState: ->
    completed: false
    image: "http://placehold.it/512x512"
    name: "Unknown App -- Looks like a plain old link!"

  componentDidMount: ->
    console.log "Badge componentDidMount"
    Request
     .get '/api/v1/app'
     .query link: @props.installLink
     .end (err, res) =>
       console.log "GET /api/v1/app response: err:#{JSON.stringify(err)} response:#{JSON.stringify(res)}"
       @setState
        completed:true
        image:res.body.image
        name:res.body.name

  render: () ->
    console.log "Badge Render install called. props:#{JSON.stringify(@props)} state:#{JSON.stringify(@state)}"
    React.createElement 'div', {className:'row'},
      React.createElement 'image', {src:@state.image, className:"responsive-img"}
      if @state.completed
        React.createElement 'p', {className:'center-align'},
          React.createElement 'a', {href:@props.installLink}, @state.name
      else
        React.createElement 'div', {className:'progress'},
          React.createElement 'div', {className:'indeterminate'}

module.exports = Badge
