extend "layout"

block 'title', ->
  title '信息'
  link href:"/css/pager.css", rel:"stylesheet"

block 'script', ->
  script src:"/js/lib/$require.js", 'data-main':"/js/information/information.js"
  coffeescript ->
    @query_list =
      pageindex : 1
      pagesize : 10
      keyword:''


block 'main', ->
  div class:"modal fade ", id:"infoModal", 'tabindex':"-1", 'role':"dialog", 'aria-labelledby':"infoModalLabel",'aria-hidden':"true", ->
    div class:"modal-dialog", ->
      div class:"modal-content", ->
        div class:"modal-header", ->
          button type:"button",class:"close",'data-dismiss':"modal",'aria-hidden':"true", ->
            text '&times;'
          h4 class:"modal-title", id:"infoModalLabel", ->
            text '新闻详情'
        div class:"modal-body", ->
          div class:"form-horizontal", ->
            div class: "input-group col-xs-12", ->
              span class: 'input-group-addon addon-width-4 ', style:'width:95px; text-align:right;', ->'标题：'
              input class: "form-control validator", validator:'specialChar', id:'txtTitle',
              description:'标题', required:'', type:"text", 'ng-model':'information.title', ->
            br ->
            div class: "input-group col-xs-12", ->
              span class: 'input-group-addon addon-width-4', style:'width:95px; text-align:right;', -> '内容：'
              input class: "form-control validator",  validator:'email', id:'txtContent',
              description:'内容', type:"text",  value:'{{information.content}}',

        div class:"modal-footer",->
          button type:"button", class:"btn btn-default", 'data-dismiss':"modal",->
            text '关闭'

  div id:'informationList', style:'padding-top:50px', 'ng-controller':'infoCtrl', onselectstart:'return false', ->
    div class:"well well-sm fix-top-2", ->
      div class :"container fixed-width", ->
        button type:"button", class:"btn btn-primary gap",  id:'btnDelete', 'ng-click':'multiRemoveInfo(this, $event.target)', ->
          span class:"glyphicon glyphicon-trash", ->
          text ' 删除'
        div class: 'col-xs-3 input-group pull-right searchPanel', ->
          input type:"text", class:"form-control", id:"searchInput", placeholder:"请输入文章名称", 'ng-model':'search', ->
          span class: 'input-group-btn', ->
            button type:"submit", class:"btn btn-default", id:"searchBtn", -> '搜索'

    div class: 'container fix-top-2-tablelist-default fixed-width', ->
      h3 class: 'pageInfo', ->
        img src: '/images/header.png',class: 'circlePic', ->
        text '&nbsp信息'
      div class: 'panel panel-default', ->
        table class: 'table table-striped', style:"table-layout:fixed;word-wrap:break-word;", id: 'tblInfo', ->
          thead class:"thead-color", ->
            tr ->
              th style:'width:30px', ->
                input type:'checkbox', class :'checkbox', id:"chkAllItems", onclick:"common.selectAllChk(this, '.chkItem')",
              th class:"col-xs-2", style:'cursor:pointer', 'ng-click':"orderColumn='title'; orderMode=!orderMode", -> '标题'
              th class:"col-xs-3", style:'cursor:pointer', 'ng-click':"orderColumn='addedTime'; orderMode=!orderMode", -> '时间'
              th class:"col-xs-3", style:'cursor:pointer', 'ng-click':"orderColumn='user.name'; orderMode=!orderMode", -> '作者'
              th class:"col-xs-3", ->'操作'
          tbody class:'listArea', style:'display:none', ->
            tr class:'', 'ng-repeat':'information in informations  | filter: {title:search} |  orderBy:orderColumn:orderMode', ->
              td style:'width:30px', ->
                input type:'checkbox', class :'checkbox chkItem', value:'{{information._id}}', onclick:"common.selectItemChk('.chkItem', '#chkAllItems')",
              td class:"col-xs-2", 'ng-bind':'information.title',  ->
              td class:"col-xs-3", 'ng-bind':'information.addedTime | dateFilter', ->
              td class:"col-xs-3", 'ng-bind':'information.user.name', ->
              td class:"col-xs-3", ->
                a 'gap', href:'javascript:void(0)', 'ng-click':'remove(this, $target.event)', id:'{{information._id}}', -> '删除'
                a href:'javascript:void(0)',  'ng-click':'showDetail(this, $target.event)', -> '详情'
      div class:'page_y', id:'pager'

block 'lazyscript', ->

