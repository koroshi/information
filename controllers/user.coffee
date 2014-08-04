User = require '../model/user'
JsonResult = require '../model/jsonResult'

app.post '/user', (req, res) ->
  user = new User()
  (user[k] = v) for k, v of req.body
  console.log user
  user.save (err, doc) ->
    return res.json JsonResult.getError(err.message) if err?
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
