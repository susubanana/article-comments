path = require('path')
require('../../models/comment')
require path.join(__dirname, 'commentResponder')
class CommentResponder.Show extends CommentResponder
  respond: (@req, @res) =>
    Comment.findById @req.param('id'), @complete


