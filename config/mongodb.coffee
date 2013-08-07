mongoose = require 'mongoose'
nconf = require('nconf').file({ file: 'config/settings.json'}).env()

class MongodbConfiguration
  constructor: ->
    dbUrl = nconf.get('Mongoose_Url')
    mongoose.connect dbUrl
    db = mongoose.connection
    db.on('error', console.error.bind(console, 'connection error:'))
    db.once('open', ->
      console.log "Successfully connection to #{dbUrl}"
    )


module.exports = MongodbConfiguration

