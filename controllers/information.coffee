Information = require '../model/information'


app.post '/information', (req, res) ->
  information = new Information()
  information[k] = v for k, v of req.body
  information.save (err, doc) ->
    console.log(doc)
    return res.json JsonResult.getError(err.message) if err
    res.json JsonResult.getSuccess(doc)

app.put '/information', (req, res) ->
  user = req.body
  uid = user?._id
  return res.json JsonResult.getError('用户不存在') unless uid
  delete user._id
  User.findByIdAndUpdate uid, {$set:user}, (err, doc) ->
    return res.json JsonResult.getError(err.message) if err
    res.json JsonResult.getSuccess(doc)



app.get '/informations', (req, res) ->
  User.find().exec (err, docs) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(docs)

app.delete '/information/:id', (req, res)->
  id = req.params.id
  return res.json JsonResult.getError('用户编号不存在') unless id
  User.remove {_id:id}, (err, count) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(count)

app.delete '/informations', (req, res) ->
  ids = req.body
  return res.json JsonResult.getError('用户编号不存在') unless ids
  User.remove {_id:{$in:ids}}, (err, count) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(count)