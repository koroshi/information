global.express = require 'express'
global.app = express()

global.mongoose = require 'mongoose'
global.Schema = mongoose.Schema
mongoose.connect 'mongodb://localhost/information'
global.$WEBPATH = __dirname
global.Guid = require 'guid'
global.async = require 'async'
global._ = require 'underscore'
global.JsonResult = require "#{__dirname}/model/JsonResult"

# all environments
app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'coffee'
app.engine 'coffee', require('kupfilter').__express

app.use require('morgan')({ format: 'dev' })
app.use require('body-parser')()
app.use require('method-override')()
app.use require('cookie-parser')()
app.use require('cookie-session') {secret:'shgbit'}


app.use express.static "#{__dirname}/public"

db = mongoose.connection
db.on 'error', (err)-> console.log err
db.once 'open', -> console.log 'db is opened'

require "./controllers/routes"
require "./controllers/user"
require "./controllers/information"
require "./controllers/comment"



app.listen 3003, ->
  console.log 'listening on port 3003'
