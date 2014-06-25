path = require('path')
require path.join(__dirname, 'commentResponder')
class CommentResponder.Delete extends CommentResponder.Show
    complete: (err, result={}) =>
      unless err?
        result.remove()
      super