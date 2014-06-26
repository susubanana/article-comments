path = require('path')
for name in['get', 'create', 'show', 'remove']
  require path.join(__dirname, "#{name}_responder")

# 取所有数据
app.get '/api/comments', new CommentResponder.Get().respond

# 增加一条数据
app.post '/api/comments', new CommentResponder.Create().respond

# 取一条数据
app.get '/api/comments/:id', new CommentResponder.Show().respond

# 删除一条数据
app.put '/api/comments/:id', new CommentResponder.Delete().respond


