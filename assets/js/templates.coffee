# Change the syntax for underscore.js templates.
# The pattern is now {{some_var}} instead of <%= some_var %>
_.templateSettings = interpolate : /\{\{(.+?)\}\}/g
  
@Templates = {}

Templates.list_item_template = """
<li id="{{_id}}">
  <div class="clearfix">
      <div class="comment-self">
        <h3 class="comment-header">第 <strong>{{floor}}</strong> 楼</h3>
        <p class="comment-cont">{{comment_cont}}</p>
        <p class="comment-footer">
          <span class="create-time">{{create_at}}</span>
        </p>
      </div>
  </div>
</li>
"""

Templates.list_reply_box = """
<div id="reply-box" class="reply-warper reply-box">
    <div class="textarea-wrapper">
      <textarea name="message" placeholder="说点什么吧…"></textarea>
    </div>
    <div class="opts-wraper">
      <button class="btn-submit" type="submit">发布</button>
    </div>
</div>

"""