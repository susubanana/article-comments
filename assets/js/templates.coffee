# Change the syntax for underscore.js templates.
# The pattern is now {{some_var}} instead of <%= some_var %>
_.templateSettings = interpolate : /\{\{(.+?)\}\}/g
  
@Templates = {}

Templates.list_item_template = """
<li id="{{_id}}">
  <div class="clearfix">
      <div class="comment-self">
        <div class="comment-header">
          <h3 class="comment-floor"><strong>{{floor}}</strong> 楼</h3>
          <span class="user-name">{{user_name}}说：</span>
        </div>

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
    <input type="text" class="user-name" maxlength="30" placeholder="输入你的昵称" />
    <div class="textarea-wrapper">
      <textarea name="message" placeholder="说点什么吧…"></textarea>
    </div>
    <div class="opts-wraper">
      <button class="btn-submit" type="submit">发布</button>
    </div>
</div>

"""