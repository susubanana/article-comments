// Generated by CoffeeScript 1.7.1
(function() {
  var mongoose;

  mongoose = require('mongoose');

  global.Schema = mongoose.Schema;

  global.ObjectId = Schema.ObjectId;

  mongoose.connect("mongodb://localhost:27017/comments");

}).call(this);
