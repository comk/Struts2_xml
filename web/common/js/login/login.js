/**
 * Created by daihai on 2015/2/16.
 */


$(document).ready(function(){
    $('[id^="alert"]').hide();
})


/**
 * 登陆的方法
 * @param str_id
 */
function login(){
    $.post("validate.action",{"username":$("#username").val(),"userpwd":$("#userpwd").val()},function(data){
        alert(data);
    });
}
