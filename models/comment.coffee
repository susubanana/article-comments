mongoose = require('mongoose')
path = require('path')
require path.join(__dirname, 'db')
global.Comment = mongoose.model 'CommentsBox', new Schema
  id: ObjectId
  comment_cont:
    type: String
    validate: /.+/
  name:
    type: String
  create_at:
    type: Date
    default: Date

