extend "layout"

block 'title', ->
  title '用户'

block 'script', ->
  script src:"/lib/require.js", 'data-main':"js/information/information.js"

block 'main', ->
  div class:"modal fade ", id:"createUserModal", 'tabindex':"-1", 'role':"dialog", 'aria-labelledby':"createUserModalLabel", 'aria-hidden':"true", ->
    div class:"modal-dialog", ->
      div class:"modal-content", ->
        div class:"modal-header", ->
          button type:"button",class:"close",'data-dismiss':"modal",'aria-hidden':"true", ->
            text '&times;'
          h4 class:"modal-title", id:"createUserModalLabel", ->
            text '创建用户'
        div class:"modal-body", ->
          form class:"form-horizontal", ->
            div class: "input-group col-xs-12", ->
              span class: 'input-group-addon addon-width-4 ', style:'width:95px; text-align:right;', ->'姓名：'
              input class: "form-control validator", validator:'username', id:'extName', description:'姓名', required:'', type:"text", name:"name",->
            br ->
            div class: "input-group col-xs-12", ->
              span class: 'input-group-addon addon-width-4', -> '公司名称：'
              input class: "form-control validator",  validator:'specialChar', id:'extCompany', description:'公司名称', type:"text", name:"company", ->
            br ->
            div class: "input-group col-xs-12", ->
              span class: 'input-group-addon addon-width-4', style:'width:95px; text-align:right;', -> '邮箱：'
              input class: "form-control validator",  validator:'email', id:'extEmail', description:'邮箱', type:"text", name:"email", ->
            br ->
            div class: "input-group col-xs-12", ->
              span class: 'input-group-addon addon-width-4', -> '手机号码：'
              input class: "form-control validator", type:"text",  validator:'tel', id:'extPhone', description:'手机号码', name:"phone", ->
            br ->
            div class: "input-group col-xs-12", ->
              span class: 'input-group-addon addon-width-4', style:'width:95px; text-align:right;', -> '地址：'
              input class: "form-control validator", validator:'phone', id:'extTel', description:'地址',  required:'', type:"text", name:"phone", ->
        div class:"modal-footer",->
          button class:"btn btn-primary  col-xs-offset-6", id:"btnCreateUser", type:"button", ->'保存'

          button type:"button", class:"btn btn-default", 'data-dismiss':"modal",->
            text '关闭'

  div id:'user', style:'padding-top:50px', 'ng-controller':'usersCtrl', onselectstart:'return false', ->
    div class:"well well-sm fix-top-2", ->
      div class :"container fixed-width", ->
        button type:"button", id:'btnShowCreateModal', class:"btn btn-default", 'data-toggle':"modal", 'data-target':"#createUserModal", ->
          span class:"glyphicon glyphicon-user", ->
          text ' 添加'
        button type:"button", class:"btn btn-default gap",  id:'btnDelete', 'ng-click':'removeUsers(this, $event.target)', ->
          span class:"glyphicon glyphicon-trash", ->
          text ' 删除'
        div class: 'col-xs-3 input-group pull-right searchPanel', ->
          input type:"text", class:"form-control", id:"searchInput", placeholder:"请输入新闻标题", 'ng-model':'search', ->
          span class: 'input-group-btn', ->
            button type:"submit", class:"btn btn-default", id:"searchBtn", -> '搜索'

    div class: 'container fix-top-2-tablelist-default fixed-width', ->
      h3 class: 'pageInfo', ->
        img src: 'images/header.png',class: 'circlePic', ->
        text '&nbsp新闻'
      div class: 'panel panel-default', ->
        table class: 'table table-striped', style:"table-layout:fixed;word-wrap:break-word;", id: 'tblUses', ->
          thead class:"thead-color", ->
            tr ->
              th style:'width:30px', ->
                input type:'checkbox', class :'checkbox', id:'chkAllItems', onclick:'common.selectAllChk()',
              th class:"col-xs-3", style:'cursor:pointer', 'ng-click':"orderColumn='name'; orderMode=!orderMode", -> '用户名'
              th class:"col-xs-3", style:'cursor:pointer', 'ng-click':"orderColumn='phone'; orderMode=!orderMode", ->'手机号码'
              th class:"col-xs-3", style:'cursor:pointer', 'ng-click':"orderColumn='email'; orderMode=!orderMode", ->'邮箱'
              th class:"col-xs-3", ->'操作'
          tbody ->
            tr class:'', 'ng-repeat':'user in users | filter: {name:search} | orderBy:orderColumn:orderMode', ->
              td style:'width:30px', ->
                input type:'checkbox', class :'checkbox chkItem', value:'{{user._id}}', onclick:'common.selectItemChk()',
              td class:"col-xs-3", 'ng-bind':'user.name',  ->
              td class:"col-xs-3", 'ng-bind':'user.phone', ->
              td class:"col-xs-3", 'ng-bind':'user.email', ->
              td class:"col-xs-3", ->
                a href:'javascript:void(0)', 'ng-click':'remove(this, $target.event)', id:'{{user._id}}', -> '删除'
                a href:'#', -> '编辑'


block 'lazyscript', ->

