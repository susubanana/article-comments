$ ->
  $('#new_comment .comment_area').keypress (e)->
    if e.keyCode is 13
      CommentApp.addComment()

  $('.btn-submit').click ->
    CommentApp.addComment()

  CommentApp.getComments()