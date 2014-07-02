path = require('path')
require path.join(__dirname, 'commentResponder')
class CommentResponder.Get extends CommentResponder
  respond: (@req, @res) =>
    Comment.find {}, null, {sort: {key_id: -1}}, @complete
