mongoose = require('mongoose')
path = require('path')
require path.join(__dirname, 'db')
global.Comment = mongoose.model 'Commentc', new Schema
  id: ObjectId
  ref_id:
    type: String
  user_name:
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


