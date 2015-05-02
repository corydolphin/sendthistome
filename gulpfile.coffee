path          = require 'path'
gulp          = require 'gulp'
express       = require 'express'
plugins       = require('gulp-load-plugins')()
gutil         = require 'gulp-util'
tiny_lr       = require 'tiny-lr'
webpack       = require "webpack"
{ argv }      = require 'yargs'
webpackConfig = require "./webpack.config.coffee"

PRODUCTION = argv.production

if PRODUCTION
  webpackConfig.plugins = webpackConfig.plugins.concat(new webpack.optimize.UglifyJsPlugin())
  webpackConfig.output.filename = "main.js"
  webpackConfig.devtool = null

sassConfig =
  includePaths : [
    'client/styles'
    'bower_components/'
    'bower_components/bourbon/'
  ]

gulp.task 'clean', ->
  gulp.src('dist', {read: false})
  .pipe(plugins.clean())

gulp.task 'sass', ->
  gulp.src('client/styles/main.scss')
  .pipe(plugins.sass(sassConfig).on('error', gutil.log))
  .pipe(plugins.concat('main.css'))
  .pipe(if PRODUCTION then plugins.minifyCss() else gutil.noop())
  .pipe(gulp.dest('dist/assets'))

gulp.task 'fonts', ->
  gulp.src([
    './bower_components/materialize/font/material-design-icons/*'
  ]).pipe(gulp.dest('dist/font/material-design-icons'))

  gulp.src([
    './bower_components/materialize/font/roboto/*'
  ]).pipe(gulp.dest('dist/font/roboto'))

gulp.task 'copy', ->
  gulp.src([
    'client/**/*'
    '!client/scripts'
    '!client/scripts/**/*'
    '!client/styles'
    '!client/styles/**/*'
  ]).pipe(gulp.dest('dist'))

gulp.task 'webpack', (callback) ->
  execWebpack(webpackConfig)
  callback()

gulp.task 'dev', ['build', 'server'], ->
  pathsToWatch = ['./client/**/*', '*.coffee', 'bower.json']

  # When /src changes, fire off a rebuild
  gulp.watch pathsToWatch, (evt) ->
    gutil.log "Detected change #{evt.path}"
    gulp.run 'build'


gulp.task 'build', ['webpack', 'sass', 'copy', 'fonts'], ->

gulp.task 'default', ['dev'], ->


gulp.task 'server', ->
  plugins.nodemon
    script: './server/server.coffee'
    ext: 'coffee'

execWebpack = (config) ->
  webpack config, (err, stats) ->
    if (err) then throw new gutil.PluginError("execWebpack", err)
    gutil.log("[execWebpack]", stats.toString({colors: true}))
