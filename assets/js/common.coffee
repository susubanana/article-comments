$ ->
  commentIdx = 0
  $('.top-comment .comment_area').keypress (e)->
    if e.keyCode is 13
      ++commentIdx
      CommentApp.addComment($('.top-comment'), commentIdx)

  $('.top-comment .btn-submit').click ->
    ++commentIdx
    CommentApp.addComment($('.top-comment'), commentIdx)

  CommentApp.getComments()
