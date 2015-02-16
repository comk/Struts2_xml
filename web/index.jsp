<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: daihai
  Date: 2015/2/15
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
    <script type="text/javascript" src="common/js/jquery-2.1.3.js" ></script>
    <script type="text/javascript">
      $(document).ready(function(){
       // $('*[id^="alert"]').hide();
      });


    </script>
  </head>
  <body>

    <a href="login.action" >登陆</a><br/>
    <a href="register.action" >注册</a>

<br/>
    <table >
      <tr>
        <td>

          <s:textfield name="username" label="UserName"></s:textfield>
        </td>
        <td id="alert-username">
          UserName Can not Be Null!

        </td>

      </tr>
      <tr>
        <td>

          <s:textfield name="userpwd" label="UserPwd"></s:textfield>
        </td>
        <td id="alert-userpwd">
          UserPwd Can not Be Null !

        </td>
      </tr>
      <tr id="alert-tr">
        <td align="center">
          UserName Or Password Error !
        </td>

      </tr>
      <tr>
        <td align="center">
          <button type="button" >Login</button>
        </td>

      </tr>
    </table>

  </body>
</html>
