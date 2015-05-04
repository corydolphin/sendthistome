React   = require 'react'

Header = React.createClass
  render: ()->
    React.createElement "nav", {className: "blue lighten-1", role: "navigation"},
      React.createElement "div", {className: "nav-wrapper container"},
        React.createElement "a", {id: "logo-container", href: "#", className: "brand-logo"}, "SendThisToMe"
        React.createElement "ul", {id: "nav-mobile", className: "side-nav"},
          React.createElement "li", null,
            React.createElement "a", {href: "/"}, "Navbar Link"
        React.createElement "a", {href: "/", "data-activates": "nav-mobile", className: "button-collapse"},
          React.createElement "i", {className: "mdi-navigation-menu"}

module.exports = Header