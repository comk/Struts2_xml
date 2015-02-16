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
    $('[id^="alert"]').hide();
    $.post("validate.action",{"username":$("#username").val(),"userpwd":$("#userpwd").val()},function(data){
        if(data >= 0){
            if(data == 1){
                $("[id='alert-username']").show();
            }else if(data == 2){
                $("[id='alert-userpwd']").show();
            }
        }else{
            location.href="userinfo.jsp";
        }
    });
}
