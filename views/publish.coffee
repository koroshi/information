extend "layout"

block 'title', ->
  title '用户'

block 'script', ->
  script src:"/js/lib/$require.js", 'data-main':'/js/publish/publish.js'

block 'main', ->
  div id:'user', style:'padding-top:50px', 'ng-controller':'publishCtrl', onselectstart:'return false', ->
    div class:"well well-sm fix-top-2", ->
      div class :"container fixed-width", ->
        button type:"button", class:"btn btn-primary gap",  id:'btnDelete', 'ng-click':'createInformation($event.target)', ->
          span class:"glyphicon glyphicon-trash", ->
          text ' 发布'

    div class: 'container fix-top-2-tablelist-default fixed-width', ->
      p -> '标题:'
      input class:'form-control validator', required:'required', 'ng-model':'information.title', validator:'specialChar', description:'标题',  type:'text', ->
      p -> '正文:'
      textarea class:'form-control validator', required:"required",'ng-model':'information.content', validator:'specialChar', description:'内容', style:' height:600px;', ->