doctype 5
html ->
  head ->
    meta name:"viewport", content="width=device-width, initial-scale=1.0", charset:'utf-8'
    link href:"css/bootstrap.css", rel:"stylesheet"
    link href:"css/common.css", rel:"stylesheet"
    title '信息管理系统'
    script src:"/lib/jquery-1.10.2.js"
    script src:"/lib/bootstrap.js"
    script src:"/lib/md5.js"
    script src:"/lib/common.js"


  body style:"height:100%; background-color: #428bca;",->
    form method:'post',action:'/login', ->
      div class:"container fixed-width center-block", id:'createUserModal', style:'margin-top:80px; width:500px;', ->
        div class:"center-block", id:"loginPanel", ->
          p class:"text-center", id:'loginLogo', ->'信息管理系统'
          div class:"form-horizontal", 'role':"form", ->
            div class:"form-group ", ->
              div class:"col-xs-12", id:'registArea', ->
                input type:"text", class:"form-control",style:'border-radius:6px 6px 0 0;', id:'txtName', name:'username', placeholder:'用户名', ->
                input type:"password", class:"form-control ", id:'txtPassword', name:'password', placeholder:'密码', ->
                input type:"text", class:"form-control ", id:'txtConfirm', name:'password', placeholder:'确认密码', ->
                input type:"text", class:"form-control ", id:'txtEmail', name:'password', placeholder:'邮箱', ->
                input type:"text", class:"form-control ", id:'txtPhone', name:'password', placeholder:'手机号码', ->
                input type:"text", class:"form-control ", id:'txtAddr', name:'password', placeholder:'地址', ->
            coffeescript ->
              $('#nameTxt').focus()
            div class:"form-group", ->
              div class:"col-xs-12", ->
                button class:"btn btn-default col-xs-3 ", id:"loginBtn",type:"button",onclick:'regist()', ->'登录'
                button class:"btn btn-primary col-xs-8 col-xs-offset-1 ", id:"loginBtn",type:"button",onclick:'regist()', ->'注册'
            div ->
              if @error?
                div '#status',style:'display:none;', ->"#{@error}"







