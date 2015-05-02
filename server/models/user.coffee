Mongoose = require 'mongoose'

User = Mongoose.Schema
  phone_number: String
  id_str: String

Mongoose.model 'User', User
