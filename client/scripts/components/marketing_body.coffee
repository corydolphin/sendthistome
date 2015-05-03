React   = require 'react'

MarketingBody = React.createClass
  render: ()->
    React.createElement "div", null,
      React.createElement "div", {className: "section no-pad-bot", id: "index-banner"},
        React.createElement "div", {className: "container"},
          React.createElement "br", null,
            React.createElement "br", null
          React.createElement "h1", {className: "header center orange-text"}, "SendThisToMe"
          React.createElement "div", {className: "row center"},
            React.createElement "h5", {className: "header col s12 light"}, "Send App install links to your phone, where you can install them."
          React.createElement "div", {className: "row center"},
            React.createElement "a", {href: "./install?link=https://itunes.apple.com/app/id972909677", id: "download-button", className: "btn-large waves-effect waves-light orange"}, "Try it out!"
          React.createElement "div", {className: "row center"},
            React.createElement "a", {href: "https://chrome.google.com/webstore/detail/laidaifjifgepaalodacjpijalnkmdhm", id: "download-button", className: "btn-large waves-effect waves-light blue"}, "Download the Chrome Extension"
          React.createElement "br", null, React.createElement "br", null
      React.createElement "div", {className: "container"},
        React.createElement "div", {className: "section"},
          React.createElement "div", {className: "row"},
            React.createElement "div", {className: "col s12 m4"},
              React.createElement "div", {className: "icon-block"},
                React.createElement "h2", {className: "center light-blue-text"},
                  React.createElement "i", {className: "mdi-action-extension"}
                React.createElement "h5", {className: "center"}, "1. Install the extension"
                React.createElement "p", {className: "light"}, "We have built a Chrome extension, Safari and Firefox and Opera flavors are in the works!"
            React.createElement "div", {className: "col s12 m4"},
              React.createElement "div", {className: "icon-block"},
                React.createElement "h2", {className: "center light-blue-text"},
                  React.createElement "i", {className: "mdi-action-open-in-new"}
                React.createElement "h5", {className: "center"}, "2. Open any iTunes link"
                React.createElement "p", {className: "light"}, "We automatically intercept iTunes and AppStore links in oder to send them direct to your mobile device."
            React.createElement "div", {className: "col s12 m4"},
              React.createElement "div", {className: "icon-block"},
                React.createElement "h2", {className: "center light-blue-text"},
                  React.createElement "i", {className: "mdi-content-send"}
                React.createElement "h5", {className: "center"}, "3. Open on mobile"
                React.createElement "p", {className: "light"}, "We send the link to mobile, where you can easily install it."

module.exports = MarketingBody