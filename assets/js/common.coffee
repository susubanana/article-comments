$ ->
  $('.top-comment .comment_area').keypress (e)->
    if e.keyCode is 13
      topComment = $('.top-comment')
      commentEle = "parent"
      CommentApp.addComment(topComment, commentEle)

  $('.top-comment .btn-submit').click ->
    topComment = $('.top-comment')
    commentEle = "parent"
    CommentApp.addComment(topComment, commentEle)

  CommentApp.getComments()
