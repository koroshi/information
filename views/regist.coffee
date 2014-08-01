doctype 5
html ->
  head ->
    meta name:"viewport", content:"width=device-width, initial-scale=1.0", charset:'utf-8'
    link href:"css/bootstrap.css", rel:"stylesheet"
    link href:"css/common.css", rel:"stylesheet"
    title '信息管理系统'
#    script src:"/lib/jquery.js"
#    script src:"/lib/bootstrap.js"
#    script src:"/lib/md5.js"
#    script src:"/lib/common.js"
#    script src:"/lib/angular.js"
#    script src:"/lib/validator.js"
#    script src:"/lib/require.js"
#    script src:"/js/reg/controller.js"

    script 'data-main':"js/reg/main.js", src:"lib/require.js"
#    script 'data-main':"lib/built.js", src:"lib/require.js"


  body style:"height:100%; background-color: #428bca;", ->
    div class:"container fixed-width center-block", id:'createUserModal', style:'margin-top:80px; width:500px;', 'ng-controller':'regCtrl',->
      p -> '{{ w }} x {{ h }}'
      div class:"center-block", id:"loginPanel", ->
        p class:"text-center", id:'loginLogo', ->'信息管理系统'
        div class:"form-horizontal", 'role':"form", ->
          div class:"form-group ", ->
            div class:"col-xs-12", id:'registArea', ->
              input type:"text", class:"form-control validator", validator:"specialChar", required:"required",
              description:'用户名', id:'txtName', 'ng-model':'user.name',  'ng-model':'username', placeholder:'用户名', ->

              input type:"password", class:"form-control validator", validator:"password", required:"required",
              description:'密码', id:'txtPassword', 'ng-model':'user.password',  placeholder:'密码', ->

              input type:"text", class:"form-control validator", validator:"specialChar", required:"required",
              description:'确认密码',id:'txtConfirm','ng-model':'user.password',  placeholder:'确认密码', ->

              input type:"text", class:"form-control validator", validator:"email", required:"required",
              description:'邮箱', id:'txtEmail', 'ng-model':'user.email',  placeholder:'邮箱', ->

              input type:"text", class:"form-control validator", validator:"phone", required:"required",
              description:'手机号码', id:'txtPhone', 'ng-model':'user.phone',  placeholder:'手机号码', ->

              input type:"text", class:"form-control validator", validator:"specialChar",
              description:'地址', 'ng-model':'user.address', id:'txtAddr',  placeholder:'地址', ->

          div class:"form-group", ->
            div class:"col-xs-12", ->
              a class:"btn btn-default col-xs-3 ", href:'/login', ->'登录'
              button class:"btn btn-default col-xs-8 col-xs-offset-1 ", id:"loginBtn",type:"button",'ng-click':'register()', ->'注册'
          div ->
            if @error?
              div '#status',style:'display:none;', ->"#{@error}"




#  script 'data-main':"js/reg/main.js", src:"lib/require.js"


