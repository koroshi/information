Information = require '../model/information'


app.post '/information', (req, res) ->
  information = new Information()
  information[k] = v for k, v of req.body
  information.addedTime = new Date()
  information.save (err, doc) ->
    console.log(doc)
    return res.json JsonResult.getError(err.message) if err
    res.json JsonResult.getSuccess(doc)

app.put '/information', (req, res) ->
  user = req.body
  uid = user?._id
  return res.json JsonResult.getError('用户不存在') unless uid
  delete user._id
  Information.findByIdAndUpdate uid, {$set:user}, (err, doc) ->
    return res.json JsonResult.getError(err.message) if err
    res.json JsonResult.getSuccess(doc)



app.get '/informations', (req, res) ->
  pagerSize = req.query.pagesize || 10
  pagerIndex = req.query.pageindex || 1

  console.log(pagerSize)

  keyword = req.query.keyword || ''
  orderBy = req.query.orderby || 'addedTime'
  orderMode = req.query.orderMode || -1 # desc
  reg = new RegExp(keyword, 'ig')
  sort = {}
  sort[orderBy] = orderMode
  Information.find({title:{$regex:reg}}).sort(sort).skip(pagerSize * (pagerIndex - 1)).limit(pagerSize).populate('user').exec (err, docs) ->
    return res.json JsonResult.getError(err.message) if err?
    Information.find({title:{$regex:reg}}).count (err, count) ->
      return res.json JsonResult.getError(err.message) if err?
      res.json JsonResult.pageSuccess(docs, count)

app.delete '/information/:id', (req, res)->
  id = req.params.id
  return res.json JsonResult.getError('用户编号不存在') unless id
  Information.remove {_id:id}, (err, count) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(count)

app.delete '/informations', (req, res) ->
  ids = req.body
  return res.json JsonResult.getError('文章编号不存在') unless ids
  Information.remove {_id:{$in:ids}}, (err, count) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(count)