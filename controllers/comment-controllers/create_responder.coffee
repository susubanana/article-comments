path = require('path')
require path.join(__dirname, 'commentResponder')
class CommentResponder.Create extends CommentResponder
  commentIndex = 0
  respond: (@req, @res) =>
    comment = new Comment(@req.param('comment'))
    if(comment.ref_id == "parent")
      comment.ref_id = "syh" + commentIndex++
    else
      childCount = Comment.count comment.ref_id, ->
      if childCount
        comment.ref_id = comment.ref_id + "#" + childCount++
      else
        comment.ref_id = comment.ref_id + "#" + commentIndex++

    comment.save(@complete)


