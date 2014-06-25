# Change the syntax for underscore.js templates.
# The pattern is now {{some_var}} instead of <%= some_var %>
_.templateSettings = interpolate : /\{\{(.+?)\}\}/g
  
@Templates = {}

Templates.list_item_template = """

<div id="reply-box" class="reply-warper reply-box">
  <form method="post">
    <div class="textarea-wrapper">
      <textarea name="message" placeholder="说点什么吧…"></textarea>
    </div>
    <div class="opts-wraper">
      <button class="btn-submit" type="submit">发布</button>
    </div>
  </form>
</div>

"""