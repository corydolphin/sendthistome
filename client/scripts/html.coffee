React       = require 'react'

Html = React.createClass
  propTypes:
    component: React.PropTypes.node.isRequired
    bootstrapData: React.PropTypes.object.isRequired

  render: ()->
    React.DOM.html {},
      React.DOM.head {},
        React.DOM.meta {charSet: "utf-8"}
        React.DOM.meta {httpEquiv: "X-UA-Compatible", content: "IE=edge,chrome=1"}
        React.DOM.title {}, "SendTo"
        React.DOM.meta {name: "title", content: true}
        React.DOM.meta {name: "description", content: true}
        React.DOM.meta {name: "author", content: true}
        React.DOM.meta {name: "format-detection", content: "telephone=no"}
        React.DOM.meta {name: "msapplication-tap-highlight", content: "no"}
        React.DOM.meta {name: "viewport", content: "width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui"}
        React.DOM.meta {name: "apple-mobile-web-app-capable", content: "yes"}
        React.DOM.meta {name: "apple-mobile-web-app-status-bar-style", content: "black"}
        React.DOM.link {rel: "stylesheet", href: "assets/main.css"}
        React.DOM.script {type: "text/javascript", dangerouslySetInnerHTML:__html: "var BOOTSTRAP_DATA=#{JSON.stringify(@props.bootstrapData)}"}
      React.DOM.body {},
        @props.component
        React.DOM.script { type: "text/javascript", src: "assets/main.js" }

module.exports = Html