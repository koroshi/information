doctype 5
html ->
  head ->
    meta name:"viewport", content:"width=device-width, initial-scale=1.0", charset:'utf-8'
    link href:"css/bootstrap.css", rel:"stylesheet"
    link href:"css/common.css", rel:"stylesheet"
    title 'GBCONF'
    script src:"/lib/require.js", 'data-main':"/js/login/login.js"


  body style:"height:100%; background-color: #428bca;", 'ng-controller':'loginCtrl', ->
    form method:'post',action:'/login',->
      div class:"container fixed-width center-block", id:'createUserModal', style:'margin-top:80px; width:500px;', ->
        div class:"center-block", id:"loginPanel", ->
          p class:"text-center", id:'loginLogo', ->'信息管理系统'
          div class:"form-horizontal", 'role':"form", ->
            div class:"form-group ", ->
              div class:"col-xs-12", ->
                input type:"text", class:"form-control validator", validator:"password", required:"required",
                description:'用户名', placeholder:'用户名', ->
                input type:"password", class:"form-control validator", validator:"password", required:"required",
                description:'密码', placeholder:'密码', ->
            div class:"form-group", ->
              div class:"col-xs-12", ->
                a class:"btn btn-default col-xs-3 ", href:'/reg', ->'注册'
                button class:"btn btn-default col-xs-8 col-xs-offset-1", id:"loginBtn",type:"button",'ng-click':'login($event.target, this)', ->'登录'
            div ->
              if @error?
                div '#status',style:'display:none;', ->"#{@error}"

  coffeescript ->

#    window.document.onkeydown = (e)->
#      e = e || window.event;
#      login() if e.keyCode is 13




