User = require '../model/user'
JsonResult = require '../model/jsonResult'

app.post '/user', (req, res) ->
  user = new User()
  (user[k] = v) for k, v of req.body
  console.log user
  user.save (err, doc) ->
    return res.json JsonResult.getError(err.message) if err?
    res.cookie 'id', doc._id
    res.cookie 'name', doc.name
    res.cookie 'role', doc.role
    res.json JsonResult.getSuccess(doc)

app.put '/user', (req, res) ->
  user = req.body
  console.log(user.name)
  return res.json JsonResult.getError('用户不存在') unless user?._id
  User.findByIdAndUpdate user._id, user, (err, doc) ->
    console.log(doc.name)
    return res.json JsonResult.getError(err.message) if err
    res.json JsonResult.getSuccess(doc)



app.get '/users', (req, res) ->
  User.find().exec (err, docs) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(docs)

app.delete '/user/:id', (req, res)->
  id = req.params.id
  return res.json JsonResult.getError('用户编号不存在') unless id
  User.remove {_id:id}, (err, count) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(count)

app.delete '/users', (req, res) ->
  ids = req.body
  return res.json JsonResult.getError('用户编号不存在') unless ids
  User.remove {_id:{$in:ids}}, (err, count) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(count)

app.post '/login', (req, res) ->
  name = req.body.name
  pwd = req.body.password

  User.find {name:name, password:pwd}, (err, docs) ->
    return res.json JsonResult.getError(err.message) if err?
    return res.json JsonResult.getError('登录失败，用户名或者密码不正确') if(docs.length is 0)
    res.cookie 'id', docs[0]._id
    res.cookie 'name', docs[0].name
    res.cookie 'role', docs[0].role
    res.json JsonResult.getSuccess(docs[0])