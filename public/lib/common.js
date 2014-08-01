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
    };

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
};

String.prototype.format = function () {
    var args = arguments;
    return this.replace(/\{(\d+)\}/g, function (m, i) {
        return args[i];
    });
};

function readonly() {
    this.blur();
    return false;
}


