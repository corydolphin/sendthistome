React    = require 'react'
Request  = require 'superagent'

try
  Digits   = require 'sdk'
  Digits.init(consumerKey:"aUfE35qvlcllN3ryRpxAoSi3v")

catch
  # Hack!!!! If we are rendering server side, mock out digits.
  Digits  =
    getLoginStatus: ->
      fail: (fun)->
      done: (fun)->
    login: ->
      fail: (fun)->
      done: (fun)->

LoginPage = React.createClass
  propTypes:
    userUpdated: React.PropTypes.func.isRequired

  componentDidMount: ()->
    Digits.getLoginStatus()
      .done @getLoginStatusSuccess
      .fail @onLoginFailure

  getLoginStatusSuccess: (resp)->
    console.log resp
    if resp.status is 'authorized'
      @onLoginSuccess resp
    else
      @onLoginClicked()

  onLoginSuccess: (resp)->
    console.log "Digits login success: #{JSON.stringify(resp)}"

    verify_headers =
      'X-Verify-Credentials-Authorization' : resp.oauth_echo_headers['X-Verify-Credentials-Authorization'] ? resp.oauth_echo_headers.oauth_echo_header
      'X-Auth-Service-Provider' : resp.oauth_echo_headers['X-Auth-Service-Provider'] ? resp.oauth_echo_headers.oauth_echo_service

    digits_oauth_header = resp.oauth_echo_headers.oauth_echo_header ? resp.oauth_echo_headers['X-Verify-Credentials-Authorization']

    Request
     .post '/api/v1/login'
     .set verify_headers
     .end (err, res) =>
       console.log "POST /api/v1/login response: err:#{JSON.stringify(err)} response:#{JSON.stringify(res)}"
       @props.userUpdated res.body


  onLoginFailure: (response)->
    console.log "Digits login failure: #{JSON.stringify(response)}"

  onLoginClicked: (e)->
    Digits.logIn()
      .done @onLoginSuccess
      .fail @onLoginFailure

  render: () ->
    React.createElement "div", null,
      React.createElement "div", {className: "row center"},
        React.createElement "a", {
          className: "btn-large waves-effect waves-light blue wobble"
          onClick:@onLoginClicked
        }, "Install to mobile"

module.exports = LoginPage
