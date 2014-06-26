@CommentApp ||= {}

CommentApp.addComment = ->
  commentUserName = $('.user-name')
  commentEle = $('.comment_area')
  console.log(commentUserName)
  comment = {user_name: commentUserName.val(), comment_cont: commentEle.val()}
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
      commentEle.val("")

CommentApp.getComments = ->
  request = $.get('api/comments')
  request.done (comments)->
    leng = comments.length
    for comment, i in comments.reverse()
      floor = i + 1
      CommentApp.appendComment(comment, floor)

CommentApp.appendComment = (comment, floor) ->
  dateTime = comment.create_at.split('.')[0].replace('T', ' ')
  comment.create_at = dateTime
  comment.floor = floor
  template = _.template(Templates.list_item_template)(comment)
  li = $(template)
  $('#comments').append(li)
  if (comment.remove_opts == false)
    opts = $('<a href="javascript:;" class="reply">回复</a><a href="javascript:;" class="danger">删除</a>')
    li.find('.comment-footer').append(opts)
  CommentApp.watchForChanges(li, comment)


CommentApp.deleteComment = (li, comment) ->
  comment.comment_cont = "该评论已删除"
  comment.remove_opts = true
  comment.create_at = $(li).find('.create-time').text().replace(' ', 'T')
  id = $(li).attr('id')
  request = $.post '/api/comments/' + id,
    comment: comment
    _method: 'put'
  request.fail (response) =>
    message = response.parse(response.responseText).message
    alert(message)
  request.done ->
    $(li).find('.comment-cont').text("该评论已删除")
    $(li).find('.comment-footer a').remove()

CommentApp.watchForChanges = (li, comment) ->
  flag = false
  $('.danger', li).click (e) =>
    CommentApp.deleteComment(li, comment)
  $('.reply', li).click (e) =>
    template = _.template(Templates.list_reply_box)()
    reply_box = $(template)
    if flag == false
      $(li).find('.comment-self').append(reply_box)
      flag = true
    else
      $(li).find('.reply-box').remove()
      flag = false
    $(li).siblings().find('.reply-box').remove()
