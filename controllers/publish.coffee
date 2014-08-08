Information = require '../model/information'

app.post '/publish', (req, res) ->
  information = new Information()
  information[k] = v for k, v of req.body
  information.save (err, doc) ->
    console.log(doc)
    return res.json JsonResult.getError(err.message) if err
    res.json JsonResult.getSuccess(doc)
