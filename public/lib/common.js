if(!window.console) window.console = {
    log:function(){}
};

function popBy(obj, flag, message, direct) {
    $(obj).popover('destroy');
    $(obj).popover({
        placement: direct ||'bottom',
        trigger: 'manual',
        content: message
    });
    if (!flag) {

        clearTimeout($(obj).data('timeout'));
        $(obj).popover('show');
        var timeout = setTimeout(function () { $(obj).popover('hide'); }, 3000);
        $(obj).data('timeout',timeout);
        return false;
    }
    else {
        $(obj).popover('hide');
        return true;
    }
}

function getQueryString(key) {
    var value = "";
    var sURL = window.document.URL;

    if (sURL.indexOf("?") > 0) {
        var arrayParams = sURL.split("?");
        var arrayURLParams = arrayParams[1].split("&");

        for (var i = 0; i < arrayURLParams.length; i++) {
            var sParam = arrayURLParams[i].split("=");

            if ((sParam[0] == key) && (sParam[1] != "")) {
                value = sParam[1];
                break;
            }
        }
    }

    return value;
}

function selectAllChk() {
    $('.chkItem').prop('checked', $('#chkAllItems').prop('checked'));
}

function selectItemChk() {
    $('#chkAllItems').prop('checked', $(".chkItem:checked").length === $(".chkItem").length);
}

function $get() { return document.getElementById(arguments[0]); }

function pagerDelegate(obj, method, mode) {
    var delegate = function () {
        var args = [];
        args.push(mode);
        method.apply(obj, args);
    }

    return delegate;
}

String.format = function () {
    if (arguments.length == 0)
        return null;

    var str = arguments[0];
    for (var i = 1; i < arguments.length; i++) {
        var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
        str = str.replace(re, arguments[i]);
    }

    return str;
}

String.prototype.format = function () {
    var args = arguments;
    return this.replace(/\{(\d+)\}/g, function (m, i) {
        return args[i];
    });
}

function readonly() {
    this.blur();
    return false;
}

function clearPop() {
    $('.book-room-day .popover').remove();
    $.each($('#bookRooms .occupied'),function(i,o) {
        if($(o).next().hasClass('popover')) {
            $(o).next().remove();
        }
    })
}

function  pop(obj, content, position) {
    $(obj).popover("destroy");
    $(obj).popover({
        placement: position || "bottom",
        content: content,
        trigger: "click"
    });
    $(obj).popover("show");
    setTimeout(function() {$(obj).popover("hide");}, 3000);
}

function modalInputFocus($modalid,$txtid) {
    var id = $.cookie('userid');
    $.get('/user/'+id).done(function(result) {
        $('#nameTxt').val(result.name);
        $('#emailTxt').val(result.email);
        $('#mobilePhoneTxt').val(result.mobilePhone);
        $('#telePhoneTxt').val(result.telephone);
        $($modalid).modal('show');
        $($modalid).on('shown.bs.modal', function (e) {
            $($txtid).focus();
        })
    }).error(function(){alert('未知错误请联系管理员！')});
}

function modifyName() {
    var name = $("#nameTxt").val().trim();
    var data = {};
    data.name = name;
    $.ajax({
        type: "PUT",
        url: "/user/"+ $.cookie('userid'),
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            if(!json)  return alert('未知的错误');
            if(json.status === 'failed') {
                popBy('#newname',false,json.result);//result为错误信息
            } else {
                popBy('#newname',false,'修改成功');
                setTimeout(function() {
                    $("#modifyPersonalModal").modal('hide')
                },500);
            }
        },
        error: function (err) {
            alert(err.responseText);
        }
    });
}

function modifyPassword() {
    if(!validateOriginalPassword("#originalPasswordTxt")  ||  !validateoNewPassword("#newPasswordTxt") || !validateComfirmPassword("#newPasswordTxt","#comfirmPasswordTxt")) {
        return;
    }
    var originalPassword = $("#originalPasswordTxt").val().trim();
    var newPassword = $("#newPasswordTxt").val().trim();
    $.ajax({
        type: "PUT",
        url: "/user/"+ $.cookie('userid'),
        data: JSON.stringify({oldpassword: hex_md5(originalPassword), newpassword: hex_md5(newPassword)}),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            if(!json)  return alert('未知的错误');
            if(json.status === 'failed') {
                popBy('#modifyPasswordBtn',false,json.result);//result为错误信息
            } else {
                popBy('#modifyPasswordBtn',false,'修改成功');
                setTimeout(function() {
                    $("#modifyPersonalModal").modal('hide');
                    $("#originalPasswordTxt").val('');
                    $("#newPasswordTxt").val('');
                    $("#comfirmPasswordTxt").val('');
                },500);

            }
        },
        error: function (err) {
            alert(err.responseText)
        }
    });
}

function modifyContact() {
    var email = $("#emailTxt").val().trim();
    var mobilePhone = $("#mobilePhoneTxt").val().trim();
    var telephone = $("#telePhoneTxt").val().trim();
    var data = {};
    data.email = email;
    data.mobilePhone = mobilePhone;
    data.telephone = telephone;
    $.ajax({
        type: "PUT",
        url: "/user/"+ $.cookie('userid'),
        data: data,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            if(!json)  return alert('未知的错误');
            if(json.status === 'failed') {
                popBy('#contact',false,json.result);//result为错误信息
            } else {
                popBy('#contact',false,'修改成功');
                setTimeout(function() {
                    $("#modifyPersonalModal").modal('hide');
                },500);
            }
        },
        error: function (err) {
            alert(err.responseText);
        }
    });
}


