mongoose = require('mongoose')
path = require('path')
require path.join(__dirname, 'db')
global.Comment = mongoose.model 'CommentsBox', new Schema
  id: ObjectId
  comment_cont:
    type: String
    validate: /.+/
  ref_id:
    type: String
  create_at:
    type: Date
    default: Date
  remove_opts:
    type: Boolean
    default: false

