#ApiRouter = require '../api/config/routes/router'

class Router
  constructor: (app) ->
    #apiRouter = new ApiRouter(app)

    app.get '/', (req, res) ->
      res.render 'index', {title: 'dark-skyz'}

module.exports = Router