express     = require 'express'
compression = require 'compression'
path        = require 'path'
Request     = require 'superagent'
session     = require 'express-session'
RedisStore  = require('connect-redis')(session);
Mongoose    = require 'mongoose'


connect = ->
  Mongoose.connect(
    process.env.MONGOLAB_URI or 'mongodb://localhost/test',
    server: socketOptions: keepAlive: 1
  )

connect()
Mongoose.connection.on 'error', console.log
Mongoose.connection.on 'disconnected', connect

require './models/installation.coffee'
require './models/user.coffee'

app = express()

app.use compression()
app.use(express.static(path.resolve("./dist")))
app.use session
  secret: process.env.SECRET_KEY or 'CHANGE_THIS'
  saveUninitialized: true
  resave: true
  maxAge: 365*24*60*60*1000
  rolling: true
  store: new RedisStore
    disableTTL: true
    client: require('redis-url').connect(process.env.REDISCLOUD_URL or "redis://localhost:6379");


# APIs to support the frontend
require('./api/v1/app.coffee')(app)
require('./api/v1/install.coffee')(app)
require('./api/v1/login.coffee')(app)

# Frontend app gets rendered server-side initially.
require('./frontend.coffee')(app)


PORT = process.env.PORT or 4000

app.listen PORT, ->
  console.log "Listening on http://localhost:#{PORT}"
