@CommentApp ||= {}

# Update the style based on the state:
CommentApp.styleByState = (li, comment) ->
  if comment.state is "completed"
    $('.comment_state', li).attr('checked', true)
    $('label.active', li).removeClass('active')
    $('.comment_title', li).addClass('completed').attr('disabled', true)
  else
    $('.comment_state', li).attr('checked', false)
    $('label', li).addClass('active')
    $('.comment_title', li).removeClass('completed').attr('disabled', false)

CommentApp.addComment = ->
  comment_ele = $('.comment_area')
  comment = {comment_cont: comment_ele.val()}
  if !comment.comment_cont? or comment.comment_cont.trim() is ""
    alert "评论内容不能为空"
  else
    request = $.post('api/comments', comment: comment)
    request.fail (response) =>
      message = response.parse(response.responseText).message
      alert message
    request.done (comment) =>
      floor = $('.comments-warper > li').length
      CommentApp.appendComment(comment, floor)
      comment_ele.val("")

CommentApp.getComments = ->
  request = $.get('api/comments')
  console.log(1)
  request.done (comments)->
    leng = comments.length
    for comment, i in comments.reverse()
      floor = i + 1
      CommentApp.appendComment(comment, floor)

CommentApp.appendComment = (comment, floor) ->
  date_time = comment.create_at.split('.')[0].replace('T', ' ')
  comment.create_at = date_time
  comment.floor = floor
  template = _.template(Templates.list_item_template)(comment)
  li = $(template)
  $('#comments').append(li)
  CommentApp.watchForChanges(li, comment)
  CommentApp.styleByState(li, comment)

CommentApp.updateComment = (li, comment) ->
  comment.title = $('.comment_title', li).val()
  if !comment.title? or comment.title.trim() is " "
    alert("title can't be blank")
  else
    if $('.comment_state', li).attr('checked')?
      comment.state = "completed"
    else
      comment.state = "pending"

    id = $(li).attr('id')
    request = $.post '/api/comments/' + id,
      comment : comment
      _method: 'post'
    request.fail (response) =>
      message = response.parse(response.responseText).message
      alert(message)
    request.done (comment) ->
      CommentApp.styleByState(li, comment)

CommentApp.deleteComment = (li, comment) ->
  id = $(li).attr('id')
  request = $.post '/api/comments/' + id, _method: 'delete'
  request.done  =>
    $('#comments li:not("#new_comment")').remove()
    CommentApp.getComments()

CommentApp.watchForChanges = (li, comment) ->
  $('.comment_state', li).click (e) =>
    CommentApp.updateComment(li, comment)
  $('.comment_title', li).keypress (e) =>
    if e.keyCode is 13
      CommentApp.updateComment(li, comment)
  $('.danger', li).click (e) =>
    CommentApp.deleteComment(li, comment)


git@github.com:susubanana/article-comment.git