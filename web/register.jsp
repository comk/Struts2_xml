<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: daihai
  Date: 2015/2/16
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link id="bs-css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <link id="bsdp-css" href="common/css/datepicker3.css" rel="stylesheet">
  <script type="text/javascript" src="common/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="common/js/register/bootstrap-datepicker.js"></script>

  <script type="text/javascript">

    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function(fmt)
    { //author: meizz
      var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
      };
      if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
      for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
          fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
      return fmt;
    }

    function btn_click(){
      $.post("getcode.action",null,function(data){
        $("#verifycodeimg").attr("src", "getcode.action");
      });
    }

    function btn_submit(){
      var username = $("#username").val();
      var userpwd = $("#userpwd").val();
      var userpwd2 = $("#userpwd2").val();
      var date = $("#birthday").val();
      var verifycode = $("#verifycodetext").val();

      if(username.length >=6){
        if(userpwd.length >= 6){
          if(userpwd2.length >=6){
            if(userpwd == userpwd2){
              if(date.match(/((^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(10|12|0?[13578])([-\/\._])(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(11|0?[469])([-\/\._])(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))([-\/\._])(0?2)([-\/\._])(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([3579][26]00)([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][0][48])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][2468][048])([-\/\._])(0?2)([-\/\._])(29)$)|(^([1][89][13579][26])([-\/\._])(0?2)([-\/\._])(29)$)|(^([2-9][0-9][13579][26])([-\/\._])(0?2)([-\/\._])(29)$))/) != null){
                $.post("validateReg.action",{username:username,userpwd:userpwd,date:date,vcode:verifycode},function(data){
                  if(data < 0){
                    location.href="/user/showuserinfo.action";
                  }else{
                    //alert(data);
//                  var date = new Date();
//                  var df=new SimpleDateFormat();//jsJava1.0需要使用DateFormat对象，不要弄错就是了
//                  df.applyPattern("MM-dd-yyyy");
//                  var str=df.format(date.toDateString());
//                  alert(date.Format("MM/dd/yyyy"));
                  }
                });
              }else{
                alert("日期格式错误！");
              }
            }else{
              alert("两次密码输入不一致！");
            }
          }else{
            alert("重复密码不能为空！");
          }
        }else{
          alert("密码不能为空！");
        }
      }else{
        alert("用户名不能为空！");
      }


    }



    $(document).ready(function(){
      var startDate = new Date();
      startDate.setYear(startDate.getYear() - 100);
      startDate = startDate.Format("MM/dd/yyyy");
      var endDate = new Date().Format("MM/dd/yyyy");
      $('#birthday').datepicker({
        weekStart: 7,
        startDate: "09/09/2012",
        endDate: endDate,
        orientation: "auto",
        autoclose: true,
        todayHighlight: true,
        beforeShowDay: function (date){
          if (date.getMonth() == (new Date()).getMonth())
            switch (date.getDate()){
              case 4:
                return {
                  tooltip: 'Example tooltip',
                  classes: 'active'
                };
              case 8:
                return false;
              case 12:
                return "green";
            }
        }
      });
    });

  </script>
</head>
<body>
      <table align="center">
          <tr>
            <td>
              <s:textfield id="username" name="UserName" label="UserName" ></s:textfield>
            </td>
          </tr>
        <tr>
          <td>
            <s:textfield id="userpwd" name="UserPwd" label="UserPwd" ></s:textfield>
          </td>
        </tr>
        <tr>
          <td>
            <s:textfield id="userpwd2" name="ReUserPwd" label="ReUserPwd" ></s:textfield>
          </td>

        </tr>
        <tr>
          <td>
            <s:textfield id="birthday" class="form-control" label="Birthday" ></s:textfield>
          </td>

        </tr>
        <tr>
          <td>
            <s:textfield id="verifycodetext" class="form-control" label="Birthday" ></s:textfield>
          </td>
          <td>
            <img id="verifycodeimg" src="getcode.action"
                    />

            <button id="refreshcode" type="button" onclick="btn_click()">点击刷新</button>
          </td>
        </tr>


        <tr>

          <td>
            <button type="button" onclick="btn_submit()" >提交</button>

          </td>
        </tr>
      </table>

</body>
</html>
