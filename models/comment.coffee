mongoose = require('mongoose')
path = require('path')
require path.join(__dirname, 'db')
global.Comment = mongoose.model 'Comments', new Schema
  id: ObjectId
  article_id:
    type: Number
    default: 1
  key_id:
    type: String
  index_init:
    type: String
    default: '000'
  user_name:
    type: String
  reply_name:
    type: String
  comment_cont:
    type: String
    validate: /.+/
  create_at:
    type: Date
    default: Date
  remove_opts:
    type: Boolean
    default: false


