Mongoose = require 'mongoose'

Installation = Mongoose.Schema
  phone_number: String
  id_str: String
  app_link: String


Mongoose.model 'Installation', Installation
