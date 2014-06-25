path = require('path')
require path.join(__dirname, 'commentResponder')
class CommentResponder.Create extends CommentResponder
  respond: (@req, @res) =>
    comment = new Comment(@req.param('comment'))
    comment.save(@complete)


