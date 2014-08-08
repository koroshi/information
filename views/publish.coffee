extend "layout"

block 'title', ->
  title '用户'

block 'script', ->
  script src:"/js/lib/require.js"

block 'main', ->
  div id:'user', style:'padding-top:50px', 'ng-controller':'usersCtrl', onselectstart:'return false', ->
    div class:"well well-sm fix-top-2", ->
      div class :"container fixed-width", ->
        button type:"button", class:"btn btn-primary gap",  id:'btnDelete', onclick:'publish(this)', ->
          span class:"glyphicon glyphicon-trash", ->
          text ' 发布'

    div class: 'container fix-top-2-tablelist-default fixed-width', ->
      p -> '标题:'
      input class:'form-control validator',  type:'text', ->
      p -> '正文:'
      textarea class:'form-control', style:' height:600px;', ->

  coffeescript ->
    @publish = () ->
      $.post '/publish', {title:'xxx', cotent:'xxxxx'}, (data) ->
        console.log(typeof $)
#
#    require.config
#      paths:
#        'jquery':'/js/lib/jquery'
#        'common':'/js/common'
#        'validator':'/js/lib/validator'
#      shim:
#        'validator': ['jquery', 'common'],
#    require ['jquery', 'validator'], () ->

