//判断对象是否为空的公共方法
function isEmpty(obj) {
    if (typeof obj == "undefined" || obj === null || obj == "" || obj=="null") {
        return true;
    } else {
        return false;
    }
}


//获取url参数方法
function GetQueryString(name)
{
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);//search,查询？后面的参数，并匹配正则
    if(r!=null)return  unescape(r[2]); return null;
}
