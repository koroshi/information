app.get '/user', (req, res) ->
  res.render 'information'

app.get '/login', (req, res) ->
  res.render 'login'

app.get '/reg', (req, res) ->
  res.render 'regist'

app.get '/', (req, res) ->
  res.render 'information'

app.get '/comment', (req, res) ->
  res.render 'information'

app.get '/manage/user', (req, res) ->
  res.render 'manage/user'

app.get '/publish', (req, res) ->
  res.render 'publish'

app.get '/test', (req, res) ->
  res.json JsonResult.pageSuccess(['aa'], 10)