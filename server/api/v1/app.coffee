Request   = require 'superagent'

# Get an ID and optionally a country code from an iTunes link
# if it is possible.
# Example: https://itunes.apple.com/us/app/id972909677 => country:us, id:972909677
# Example: https://itunes.apple.com/us/app/mthrow/id958381471 => country:us, id:958381471
getItunesRequestData = (link) ->
  matches = /.*itunes\.apple.com\/(.*)\/app.*id(\d+)/.exec link
  if matches
    country: matches[1]
    id: matches[2]
  else
    matches = /.*itunes\.apple.com\/app\/id(\d+)/.exec link unless matches
    if matches
      id: matches[1]

sendBadge = (badgeData, resultStream) ->
  resultStream.setHeader 'cache-control', 'public,max-age=3600'
  resultStream.json
    image: badgeData.image or "http://placehold.it/512x512"
    name: badgeData.name or "Unknown"

sendBadgeFromAppData = (requestData, resultStream) ->
  Request
   .get 'https://itunes.apple.com/lookup'
   .query requestData
   .set 'Accept', 'application/json'
   .end (err, result) ->
      console.log "iTunes response: err:#{JSON.stringify(err)} response:#{JSON.stringify(result)}"
      resultBody = JSON.parse result.text

      resultData =
        image : resultBody?.results[0].artworkUrl512
        name  : resultBody?.results[0].trackName

      sendBadge resultData, resultStream


sendBadgeFromItunesLink = (link, resultStream) ->
  appData = getItunesRequestData link
  if appData
    sendBadgeFromAppData appData, resultStream

sendBadgeByFollowingRedirects = (link, resultStream) ->
  Request
  .get link
  .end (err, result) ->
    redirectedLink = result?.redirects.pop()
    if sendBadgeFromItunesLink redirectedLink, resultStream
    else
      resultStream.setHeader 'cache-control', 'public,max-age=3600'
      resultStream.json
        image: "http://placehold.it/512x512"
        name: "Unknown"

getBadgeDataFromItunes = (data, callback) ->
  Request
   .get 'https://itunes.apple.com/lookup'
   .query data
   .set 'Accept', 'application/json'
   .end (err, res) ->
      console.log "iTunes response: err:#{JSON.stringify(err)} response:#{JSON.stringify(result)}"

      resultBody = JSON.parse result.text

      _image = resultBody?.results[0].artworkUrl512
      _name  = resultBody?.results[0].trackName

      callback
        image: _image ? "/images/PlaceHolder.png"
        name: _name ? "Unknown"


module.exports = (app) ->
  app.get '/api/v1/app', (req, resultStream) ->
    link = req.param 'link'
    console.log "Request for badge #{link}"

    if sendBadgeFromItunesLink link, resultStream
    else
      sendBadgeByFollowingRedirects link, resultStream