extend "layout"

block 'title', ->
  title '用户'

block 'script', ->
  script src:"/lib/require.js", 'data-main':"js/information/information.js"

block 'main', ->
  div class:"modal fade", id:"modalBoxes", 'tabindex':"-1", 'role':"dialog", 'aria-labelledby':"modalBoxesLabel", 'aria-hidden':"true", ->
    div class:"modal-dialog", ->
      div class:"modal-content", ->
        div class:"modal-header", ->
          button type:"button",class:"close",'data-dismiss':"modal",'aria-hidden':"true", ->
            text '&times;'
          h4 class:"modal-title", id:"modalBoxesLabel", ->
            text '授权'
        div class:"modal-body", ->
          div ->
            div class :"row ", id:'box', ->
              div class: 'panel panel-default', ->
                table class: 'table table-striped', style:"table-layout:fixed;word-wrap:break-word;", id: 'box-list', ->
                  thead class:"thead-color",->
                    tr ->
                      th class :"col-xs-6",->
                        span class:"col-xs-1 ", ->
                          input type: 'checkbox',id:"allBoxes"
                        div class :"col-xs-10 ", ->
                          span class :" col-xs-7", ->
                            text ' 设备名'
                            b class:"caret ",sortColName:"name",style:"display:none",
                      th class :"col-xs-6",->
                        text '名称'
                        b class:"caret", sortColName:"playlist",style:"display:none",
                  tbody ->
            br ->
          div class:"col-xs-offset-9 diabtnfix ", ->
            button type:"button",  class:"btn btn-primary ",id:"btnAuthorize", ->
              text '确定'
            button type:"button", class:"btn btn-default gap", 'data-dismiss':"modal",->
              text '关闭'

    div class:"modal fade ", id:"createUserModal", 'tabindex':"-1", 'role':"dialog", 'aria-labelledby':"createUserModalLabel", 'aria-hidden':"true", ->
      div class:"modal-dialog", ->
        div class:"modal-content", ->
          div class:"modal-header", ->
            button type:"button",class:"close",'data-dismiss':"modal",'aria-hidden':"true", ->
              text '&times;'
            h4 class:"modal-title", id:"createUserModalLabel", ->
              text '创建用户'
          div class:"modal-body   col-xs-offset-1", ->
            form class:"form-horizontal", id: 'password', style: 'margin-top: 10px', ->
              h2 class:"form-signin-heading", ->
              div class:"form-group", ->
                label for:"nameTxt", class:"col-xs-3 control-label", ->'用户名'
                div class:"col-xs-6", ->
                  input type:"text", class:"form-control ", id:'nameTxt', placeholder:'请输入用户名', ->
              div class:"form-group", ->
                label for:"passwordTxt", class:"col-xs-3 control-label", ->'密码'
                div class:"col-xs-6", ->
                  input type:"password", class:"form-control ", id:'passwordTxt', placeholder:'请输入密码', ->
              div class:"form-group", ->
                label for:"confirmTxt", class:"col-xs-3 control-label", ->'确认密码'
                div class:"col-xs-6", ->
                  input type:"password", class:"form-control ", id:'confirmTxt', placeholder:'请再次输入密码', ->
#              div class:"form-group", ->
#                label for:"emailTxt", class:"col-xs-3 control-label", ->'邮箱'
#                div class:"col-xs-6", ->
#                  input type:"text", class:"form-control ", id:'emailTxt', placeholder:'请输入邮箱', ->
              div class:"form-group", ->
                label for:"txtDescription", class:"col-xs-3 control-label", ->'个人注释'
                div class:"col-xs-6", ->
                  textarea  class:"form-control", id:'txtDescription', placeholder:'请输入个人注释', ->
          div class:"modal-footer",->
            button class:"btn btn-primary  col-xs-offset-6", id:"btnCreateUser", type:"button", ->'创建用户'

            button type:"button", class:"btn btn-default", 'data-dismiss':"modal",->
              text '关闭'

  div id:'user', style:'padding-top:50px', 'ng-controller':'usersCtrl', ->
    div class:"well well-sm fix-top-2", ->
      div class :"container fixed-width", ->
        button type:"button", id:'btnShowCreateModal', class:"btn btn-default", ->
          span class:"glyphicon glyphicon-user", ->
          text ' 添加'
        button type:"button", class:"btn btn-default gap",  id:'btnDelete', 'ng-click':'removeUsers(this, $event.target)', ->
          span class:"glyphicon glyphicon-trash", ->
          text ' 删除'
        div class: 'col-xs-3 input-group pull-right searchPanel', ->
          input type:"text", class:"form-control", id:"searchInput", placeholder:"请输入新闻标题", ->
          span class: 'input-group-btn', ->
            button type:"submit", class:"btn btn-default", id:"searchBtn", -> '搜索'

    div class: 'container fix-top-2-tablelist-default fixed-width', ->
      h3 class: 'pageInfo', ->
        img src: 'images/header.png',class: 'circlePic', ->
        text '&nbsp新闻'
      div class: 'panel panel-default', ->
        table class: 'table table-striped', style:"table-layout:fixed;word-wrap:break-word;", id: 'tblUses', ->
          thead class:"thead-color btn-primary",->
            tr ->
              th style:'width:30px', ->
                input type:'checkbox', class :'checkbox', id:'chkAllItems'
              th class:"col-xs-3", style:'cursor:pointer', -> '用户名'
              th class:"col-xs-3", ->'手机号码'
              th class:"col-xs-3", ->'邮箱'
              th class:"col-xs-3", ->'操作'
          tbody ->
            tr class:'', 'ng-repeat':'user in users', ->
              td style:'width:30px', ->
                input type:'checkbox', class :'checkbox chkItem', 'ng-bind':'user._id',
              td class:"col-xs-3", 'ng-bind':'user.name',  ->
              td class:"col-xs-3", 'ng-bind':'user.phone', ->
              td class:"col-xs-3", 'ng-bind':'user.email', ->
              td class:"col-xs-3", ->
                a href:'javascript:void(0)', 'ng-click':'remove(this, $target.event)', id:'{{user._id}}', -> '删除'
                a href:'#', -> '编辑'

  script type:"text/template", id:"userTemplate", style:"display:none", ->
    td class:"col-xs-4 ",->
      div class:'dropdowm', ->
        span class:"col-xs-1", ->
          input type:"checkbox",value:"{{id}}", class: 'chkUserItem'
        span class:"col-xs-10 sp-Username displayName",title:"{{name}}", -> '{{name}}'
        span class:"col-xs-6  userOper", style:'display:none', ->
          a href:'javascript:void(0)', class: 'deleteUser ',title:'删除',  ->'删除'
          a href:'javascript:void(0)', class: 'resetPassword gap',title:'重置密码', ->'重置'
          a href:'javascript:void(0)', class: 'activateUser gap',title:'激活', ->'激活'
          a href:'javascript:void(0)', class: 'authorize gap',title:'授权', ->'授权'
    td class:"col-xs-4", ->
      div class:"col-xs-12", ->
        span class:"userDescription displayName", title:"{{description}}",  ->'{{description}}'

block 'lazyscript', ->

