express = require('express')
path = require('path')
app.configure ->
  app.set('port', process.env.PORT || 3000)
  app.set('views', path.join(__dirname, 'views'))
  app.set('view engine', 'ejs')
  app.use(express.logger('dev'))
  app.use(express.json())
  app.use(express.urlencoded())
  app.use(express.methodOverride())
  app.use(app.router)
  app.use express.static path.join(__dirname, 'public')
  app.use(require('connect-assets')())

  app.get('/index', routes.index)