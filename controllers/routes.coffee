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