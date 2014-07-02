$ ->
  $('.top-comment .comment_area').keypress (e)->
    if e.keyCode is 13
      topComment = $('.top-comment')
      commentEle = "parent"
      parent = $('#comments')
      CommentApp.addComment(topComment, commentEle)

  $(document).on 'click', '.top-comment .btn-submit', ->
    topComment = $('.top-comment')
    commentEle = "parent"
    parent = $('#comments')
    CommentApp.addComment(topComment, commentEle)

  $(document).delegate '.reply-box .btn-submit', 'click', ->
    currentLi = $(this).closest('li')
    keyId = currentLi.attr('id')
    keyIdIdx = keyId.indexOf('#')
    if keyIdIdx > 0
      parentLi = currentLi.parents('li')
    else
      parentLi = currentLi
    lastChild = parentLi.find('li:last')
    if lastChild.length == 0
      commentEle = keyId + "#" + "001"
    else
      lastChildId = lastChild.attr('id')
      keyId = lastChildId.split('#')[0]
      idx = parseInt(lastChildId.split('#')[1])
      idx++
      if idx < 10
        commentEle = keyId + "#" + "00" + idx
      else if idx >= 10 && idx < 100
        commentEle = keyId + "#" + "0" + idx
      else
        commentEle = keyId + "#" + idx
    replyBox = $('.reply-box')
    CommentApp.addComment(replyBox, commentEle)
    replyBox.remove()

