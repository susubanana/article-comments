path = require('path')
require('../../models/comment')
require path.join(__dirname, 'show_responder')

class CommentResponder.Update extends CommentResponder.Show
    complete: (err, result={}) =>
      if err?
        super
      else
        result.set(@req.param('comment'))
        result.save(super)

