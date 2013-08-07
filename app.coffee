express = require 'express'
http = require 'http'
path = require 'path'
Router = require './config/router'
MongodbConfiguration = require './config/mongodb'

app = express()

#config
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

# middleware
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(require('less-middleware')({ src: __dirname + '/public' }));
app.use(express.static(path.join(__dirname, 'public')));

if 'development' == app.get('env')
  app.use(express.errorHandler())

mongo = new MongodbConfiguration
router = new Router(app)

http.createServer(app).listen(app.get('port'), ->
  console.log "Application successfully started on #{app.get('port')}"
)

######################### Project Setup ###############################
#1. Install http://code.google.com/p/clink (uber command prompt)
#2. run 'npm install' from command prompt (in project root)
#3. afterwards, in the project root, run "grunt" (will start on port 3000)
#4. Passport is installed but not configured (that's the oauth2 libarary stuff)