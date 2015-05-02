React   = require 'react'

Footer = React.createClass
  render: ()->
    React.createElement "footer", {className: "page-footer orange"},
      React.createElement "div", {className: "container"},
        React.createElement "div", {className: "row"},
          React.createElement "div", {className: "col l6 s12"},
            React.createElement "h5", {className: "white-text"}, "Let's hack!"
            React.createElement "p", {className: "grey-text text-lighten-4"},
              "The code this project can be found on "
              React.createElement "a", {className: "grey-text text-lighten-5", href: "https://github.com/corydolphin/sender-extension"}, "Github! "
              "Hack it, break it and have fun :-)"
      React.createElement "div", {className: "footer-copyright"},
        React.createElement "div", {className: "container"},
          "Built by Cory Dolphin"
          React.createElement "a", {className: "grey-text text-lighten-5", href: "https://twitter.com/corydolphin"},
            ". Drop me a line!"
module.exports = Footer