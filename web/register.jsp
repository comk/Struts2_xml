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
  <link id="bsdp-css" href="common/js/css/datepicker3.css" rel="stylesheet">
  <script type="text/javascript" src="common/js/jquery-2.1.3.js"></script>
  <script type="text/javascript" src="common/js/register/bootstrap-datepicker.js"></script>

  <script type="text/javascript">

    function btn_click(){
      $.post("getcode.action",null,function(data){
        $("#verifycodeimg").attr("src", "getcode.action");
      });
    }




    function btn_submit(){
      var username = $("#username").val();
      var userpwd = $("#userpwd").val();
      var userpwd2 = $("#userpwd2").val();
      var data = $("#birthday").val();
      var verifycode = $("#verifycodetext").val();

      if(username.length >=6){
        if(userpwd.length >= 6){
          if(userpwd2.length >=6){
            if(userpwd == userpwd2){
              $.post("validateReg.action",{username:username,userpwd:userpwd,vcode:verifycode},function(data){
                if(data < 0){
                  location.href="showuserinfo.action";
                }else{
                  alert(data);
                }
              });
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
      $('#birthday').datepicker({
        weekStart: 7,
        startDate: "02/17/2015",
        endDate: "03/17/2015",
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
            <s:textfield id="birthday" class="form-control" label="Birthday"></s:textfield>
          </td>

        </tr>
        <tr>
          <td>
            <s:textfield id="verifycodetext" class="form-control" label="Birthday"></s:textfield>
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
