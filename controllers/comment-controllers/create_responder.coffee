path = require('path')
require path.join(__dirname, 'commentResponder')
class CommentResponder.Create extends CommentResponder
  respond: (@req, @res) =>
    comment = new Comment(@req.param('comment'))
    if(comment.key_id == "parent")
      if comment.index_init == "000"
        comment.index_init = "001"
      else
        parIndexInit = parseInt(comment.index_init)
        parIndexInit++
        if parIndexInit < 10
          comment.index_init = "00" + parIndexInit
        else if parIndexInit >= 10 && parIndexInit < 100
          comment.index_init = "0" + parIndexInit
        else
          comment.index_init = parIndexInit
      comment.key_id = "syh" + comment.index_init
    else
      childKeyId = comment.key_id.split("#")[0].substring(3, 6)
      childIndexInit = parseInt(childKeyId)
      comment.index_init = "00" + childIndexInit
    comment.save(@complete)


