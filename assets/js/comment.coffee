@CommentApp ||= {}
CommentApp.addComment = (current, element) ->
  commentUserName = current.find('.user-name')
  commentEle = current.find('.comment-area')
  par = current.closest('li')
  replyName = par.find('.user-name').eq(0).find('.name').text()
  comment = {
    key_id: element,
    user_name: commentUserName.val(),
    reply_name: replyName,
    comment_cont: commentEle.val()
  }
  if !comment.user_name? or comment.user_name.trim() is ""
    alert "姓名不能为空"
  else if !comment.comment_cont? or comment.comment_cont.trim() is ""
    alert "评论内容不能为空"
  else
    request = $.post('api/comments', comment: comment)
    request.fail (response) =>
      message = response.parse(response.responseText).message
      alert message
    request.done (comment) =>
      floor = $('.comments-warper > li').length
      CommentApp.appendComment(comment, floor)
      commentUserName.val("")
      commentEle.val("")

CommentApp.getComments = ->
  request = $.get('api/comments')
  request.done (comments)->
    leng = comments.length
    for comment in comments.reverse()
      floor = parseInt(comment.index_init)
      CommentApp.appendComment(comment, floor)

CommentApp.appendComment = (comment, floor) ->
  dateTime = comment.create_at.split('.')[0].replace('T', ' ')
  comment.create_at = dateTime
  comment.floor = floor
  commentKeyId = comment.key_id
  keyIdIdx = commentKeyId.indexOf('#')
  if  keyIdIdx > 0
    liId = commentKeyId.substring(0, keyIdIdx)
    par = $('#' + liId)
    childList_warper = _.template(Templates.childList_warper)(comment)
    template = _.template(Templates.childList_item_template)(comment)
    li = $(template)
    childWraper = par.find('.child-wraper .child-list')
    if childWraper.length == 0
      par.append(childList_warper)

    par.find('.child-wraper .child-list').append(li)

  else
    template = _.template(Templates.list_item_template)(comment)
    li = $(template)
    $('#comments').append(li)
  if (comment.remove_opts == false)
    opts = $('<a hkey="javascript:;" class="reply">回复</a><a hkey="javascript:;" class="danger">删除</a>')
    li.find('.comment-footer').append(opts)
  CommentApp.watchForChanges(li, comment)

CommentApp.deleteComment = (li, comment) ->
  comment.comment_cont = "该评论已删除"
  comment.remove_opts = true
  comment.create_at = $(li).find('.create-time').text().replace(' ', 'T')
  keyId = $(li).attr('id')
  request = $.post '/api/comments/' + keyId,
    comment: comment
    _method: 'put'
  request.fail (response) =>
    message = response.parse(response.responseText).message
    alert(message)
  request.done ->
    $(li).find('.comment-cont').text("该评论已删除")
    $(li).find('.comment-footer a').remove()

CommentApp.watchForChanges = (li, comment) ->
  $('.danger', li).click =>
    CommentApp.deleteComment(li, comment)
  $('.reply', li).click =>
    $('.reply-box').remove()
    template = _.template(Templates.list_reply_box)()
    reply_box = $(template)
    $(li).find('.comment-self').eq(0).append(reply_box)
    $(li).siblings().find('.reply-box').remove()

