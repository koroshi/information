User = require '../model/user'
JsonResult = require '../model/jsonResult'

app.post '/user', (req, res) ->
  user = new User()
  (user[k] = v) for k, v of req.body
  console.log user
  user.save (err, doc) ->
    return res.json JsonResult.getError(err.message) if err?
    res.json JsonResult.getSuccess(doc)