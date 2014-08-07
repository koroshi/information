doctype 5
html ->
  head ->
    meta name:"viewport", content:"width=device-width, initial-scale=1.0", charset:'utf-8'
    link href:"/css/bootstrap.css", rel:"stylesheet"
    link href:"/css/style.css", rel:"stylesheet"
    block 'title', ->
      title 'information'
    block 'script', ->

  body style:'min-width:1280px;', ->
    div class:"modal fade", id:"modifyPersonalModal", 'tabindex':"-1", 'role':"dialog", 'aria-labelledby':"modifyPersonalModalLabel", 'aria-hidden':"true", ->
      div class:"modal-dialog", ->
        div class:"modal-content", ->
          div class:"modal-header", ->
            button type:"button",class:"close",'data-dismiss':"modal",'aria-hidden':"true", ->
              text '&times;'
            h4 class:"modal-title", id:"modifyPersonalModalLabel", ->
              text '修改个人信息'
          div class:"modal-body col-sm-offset-1", ->
            form class:"form-horizontal", id: 'newname', style: 'margin-top: 10px', ->
              div class:"form-group", ->
                label for:"nameTxt", class:"col-sm-3 control-label", ->'姓名'
                div class:"col-sm-6", ->
                  input type:"text", class:"form-control ", id:"nameTxt", placeholder:"", ->
              div class:"form-group", ->
                div class:"col-sm-6 col-sm-offset-3", ->
                  button type:"button", id:'modifyNameBtn', class:"btn btn-primary col-sm-offset-8 formConFix", onclick:"modifyName()", ->
                    text '保存修改'
            form class:"form-horizontal", id: 'password', style: 'margin-top: 10px', ->
              div class:"form-group", ->
                label for:"originalPasswordTxt", class:"col-sm-3 control-label", ->'原密码'
                div class:"col-sm-6", ->
                  input type:"password", class:"form-control ", id:"originalPasswordTxt", placeholder:"请输入原密码", ->
              div class:"form-group", ->
                label for:"newPasswordTxt", class:"col-sm-3 control-label", ->'新密码'
                div class:"col-sm-6", ->
                  input type:"password", class:"form-control ", id:"newPasswordTxt", placeholder:"请输入新密码", ->
              div class:"form-group", ->
                label for:"comfirmPasswordTxt", class:"col-sm-3 control-label", ->'确认新密码'
                div class:"col-sm-6", ->
                  input type:"password", class:"form-control ", id:"comfirmPasswordTxt", placeholder:"请再次输入新密码", ->
              div class:"form-group", ->
                div class:"col-sm-6 col-sm-offset-3", ->
                  button type:"button", id:'modifyPasswordBtn', class:"btn btn-primary col-sm-offset-8 formConFix", onclick:"modifyPassword()", ->
                    text '保存修改'
            form class:"form-horizontal", id: 'contact', style: 'margin-top: 10px', ->
              div class:"form-group", ->
                label for:"emailTxt", class:"col-sm-3 control-label", ->'邮箱'
                div class:"col-sm-6", ->
                  input type:"text", class:"form-control ", id:"emailTxt", placeholder:"", ->
              div class:"form-group", ->
                label for:"mobilePhoneTxt", class:"col-sm-3 control-label", ->'手机'
                div class:"col-sm-6", ->
                  input type:"text", class:"form-control ", id:"mobilePhoneTxt", placeholder:"", ->
              div class:"form-group", ->
                label for:"telePhoneTxt", class:"col-sm-3 control-label", ->'电话'
                div class:"col-sm-6", ->
                  input type:"text", class:"form-control ", id:"telePhoneTxt", placeholder:"", ->
              div class:"form-group", ->
                div class:"col-sm-6 col-sm-offset-3", ->
                  button type:"button", id:'modifyContactBtn', class:"btn btn-primary col-sm-offset-8 formConFix", onclick:"modifyContact()", ->
                    text '保存修改'
          div class:"modal-footer",->
            button type:"button", class:"btn btn-default", 'data-dismiss':"modal",->
              text '关闭'

    div class:"navbar navbar-inverse navbar-fixed-top ", role:"navigation", ->
      div class:"container ", ->
        div class:"navbar-header", ->
          button type:"button", class:"navbar-toggle", 'data-toggle':"collapse", 'data-target':".navbar-collapse", ->
            span class:"sr-only", -> 'Toggle navigation'
            span class:"icon-bar"
            span class:"icon-bar"
            span class:"icon-bar"
          a class:"navbar-brand", href:"#", ->'会议预约管理系统'
        div class:"collapse navbar-collapse",style:"min-width:794px;", ->
          ul class:"nav navbar-nav", id:'headNav', ->
            li class:"", -> a href:"/booking", -> '预约'
            li class:"", -> a href:"/MB/index", -> '我的预约'
            li class:"", -> a href:"/invite", ->
              text '与会通知&nbsp'
              span class:"badge", ->'new'
            li class:"", -> a href:"/audit", -> '审批'
            li class:"adminauthor mouseoper", ->
              a class:'managerarea', href:"javascript:void(0)", ->
                text '管理'
                b class:"caret"
            li class:"mouseoper", ->
              a class:'helparea', href:"javascript:void(0)", ->
                text ' 帮助'
                b class:"caret"

          ul class:"nav navbar-nav navbar-right", ->
            li class:"dropdown", ->
              a href:'javascript:void(0)', class:"dropdown-toggle", 'data-toggle':"dropdown", ->
                b id: "usertype", style:"display:none", -> ''
                b id: "username", -> ''
                coffeescript ->
                  require.config
                    paths:
                      'jquery':'/js/lib/jquery'
                      'jquery.cookies':'/js/lib/jquery.cookies'
                    shim:
                      'jquery.cookies': ['jquery'],
                  require ['jquery', 'jquery.cookies'], () ->
                    actived = location.pathname
                    type = $.cookie('type')
                    $.each $('.nav li a'), (i,o) ->
                      if actived is $(o).attr('href')
                        $(o).parent().addClass('active').siblings('li').removeClass('active')
                    $('#username').html($.cookie('name') or '')
                    $('#usertype').html($.cookie('role') or '')
                b class:"caret"
              ul class:"dropdown-menu", ->
                li ->
                  a href:'javascript:void(0)', onclick:"modalInputFocus('#modifyPersonalModal', '#newMailTxt')", -> '修改个人信息'
                li class:'divider', ->
                li ->
                  a href:'/logout', -> '退出'


    block 'main'
  block 'lazyscript'


