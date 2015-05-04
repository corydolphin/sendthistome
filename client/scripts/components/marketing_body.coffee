React     = require 'react'
Installer = React.createFactory require './installer.coffee'


MarketingBody = React.createClass

  installChromeExtension: () ->
    if chrome?
      # chrome://extension-icon/edibhbekfdoaoggpimgmpgnimafldnlh/48/1
      if chrome.app.isInstalled
        console.log "Already installed"
      else
      chrome.webstore.install(
        'https://chrome.google.com/webstore/detail/edibhbekfdoaoggpimgmpgnimafldnlh',
        console.log,
        console.log
      )
  render: ()->
    React.createElement "div", {className: "section no-pad-bot", id: "index-banner"},
      React.createElement "h1", {className: "header center orange-text"}, "SendThisToMe"
      React.createElement "div", {className: "row center"},
        React.createElement "h5", {className: "header col s12 light"}, "Send App install links to your phone, where you can install them."
      React.createElement "div", {className: "container"},
        React.createElement "div", {className: "row"},
          React.createElement "div", {className: "col s12 m4 offset-m2"},
            React.createElement "div", {className: "icon-block"},
              React.createElement "h2", {className: "center light-blue-text"},
                React.createElement "i", {className: "mdi-action-extension"}
              React.createElement "h5", {className: "center"}, "1. Install the extension"
              React.createElement "div", {className: "row center"},
                React.createElement "a",
                  {
                    # href: "https://chrome.google.com/webstore/detail/laidaifjifgepaalodacjpijalnkmdhm"
                    id: "download-button"
                    className: "btn-large waves-effect waves-light blue"
                    onClick: @installChromeExtension
                  },
                  "Download the extension"
              React.createElement "p", {className: "light"}, "We have built a Chrome extension, Safari and Firefox and Opera flavors are in the works!"
          React.createElement "div", {className: "col s12 m4"},
            React.createElement "div", {className: "icon-block"},
              React.createElement "h2", {className: "center light-blue-text"},
                React.createElement "i", {className: "mdi-action-open-in-new"}
              React.createElement "h5", {className: "center"}, "2. Open any iTunes link"
              React.createElement "div", {className: "row center"},
                React.createElement "a",
                  {
                    # href: "https://chrome.google.com/webstore/detail/laidaifjifgepaalodacjpijalnkmdhm"
                    id: "download-button"
                    className: "btn-large waves-effect waves-light blue"
                    href: "https://itunes.apple.com/us/app/periscope/id972909677"
                  },
                  "Try it out with Periscope"
              React.createElement "p", {className: "light"}, "We automatically intercept iTunes and AppStore links in oder to send them direct to your mobile device."


module.exports = MarketingBody