# Change the syntax for underscore.js templates.
# The pattern is now {{some_var}} instead of <%= some_var %>
_.templateSettings = interpolate : /\{\{(.+?)\}\}/g
  
@Templates = {}

Templates.list_item_template = """
<li id="{{_id}}">
  <div class="clearfix">
    <ul class="reply-list">
      <li>
        <h3 class="comment-header">第 <strong>{{floor}}</strong> 楼</h3>
        <p class="comment_cont">{{comment_cont}}</p>
        <p class="comment-footer">
          <span>{{create_at}}</span>
          <a href="javascript:;" class='reply'>回复</a>
          <a href="javascript:;" class='danger'>删除</a>
        </p>
      </li>

    </ul>
  </div>
</li>
"""