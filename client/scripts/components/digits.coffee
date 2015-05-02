if typeof window is "undefined"
  Digits = require '../../../bower_components/sdk/index.js'
  Digits.init(consumerKey:"9rGXb3mmlyfOrY8sTBl7uG61n")
  module.exports.Digits   = Digits

else
  module.exports.Digits  =
    getLoginStatus: ->
      fail: (fun)->
      done: (fun)->
    login: ->
      fail: (fun)->
      done: (fun)->
