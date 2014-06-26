path = require('path')
require path.join(__dirname, 'commentResponder')
class CommentResponder.Delete extends CommentResponder.Show
  complete: (err, result={}) =>
    if err?
      super
    else
      result.set(@req.param('comment'))
      result.save(super)