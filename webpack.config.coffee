path               = require('path')
webpack            = require('webpack')
BowerWebpackPlugin = require('bower-webpack-plugin')

module.exports =
  entry: './client/scripts/router.coffee'
  target: 'web'
  debug: true
  'display-error-details': true
  watch: false
  output:
    path: path.join(__dirname, 'dist', 'assets')
    publicPath: '/assets/'
    filename: 'main.js'
    chunkFilename: '[chunkhash].js'
  devtool: '#inline-source-map'
  resolve: modulesDirectories: [
    'bower_components'
    'node_modules'
    'client/scripts'
  ]
  module:
    loaders: [
      test: /\.coffee$/
      loader: 'coffee-loader'
    ]
    noParse: /\.min\.js/
  plugins: [ new BowerWebpackPlugin ]
