express = require('express')
http = require('http')
path = require('path')
global.app = app = express()

require path.join(__dirname, 'configuration')
require path.join(__dirname, 'controllers/comment-controllers/commentController')
require path.join(__dirname, 'controllers/comment-controllers/commentResponder')
require path.join(__dirname, 'models/db')
require path.join(__dirname, 'models/comment')
require path.join(__dirname, 'controllers/controller')

#development only
if ('development' is app.get('env'))
  app.use(express.errorHandler())

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
