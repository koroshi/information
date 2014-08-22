class JsonResult
  constructor: (@code, @result) ->

  @getError: (err) ->
    new JsonResult('fail', err)

  @getSuccess: (doc) ->
    new JsonResult('succ', doc)

  @pageSuccess: (doc, allCount) ->
    json = new JsonResult('succ', doc)
    [json.count, json.allCount] = [ doc.length, allCount]
    json

exports = module.exports = JsonResult