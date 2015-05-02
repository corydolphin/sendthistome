React            = require 'react'
Header           = React.createFactory require './header.coffee'
Footer           = React.createFactory require './footer.coffee'
MarketingBody    = React.createFactory require './marketing_body.coffee'

Marketing = React.createClass
  render: ()->
    React.createElement 'div', {},
      Header()
      MarketingBody()
      Footer()

module.exports = Marketing