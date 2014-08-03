class JsonResult
  constructor: (@code, @result) ->

  @getError: (err) ->
    new JsonResult('fail', err)
#    [@code, @result] = ['fail', err]

  @getSuccess: (doc) ->
    new JsonResult('succ', doc)

exports = module.exports = JsonResult