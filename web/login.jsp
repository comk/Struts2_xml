<%--
  Created by IntelliJ IDEA.
  User: daihai
  Date: 2015/2/15
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
  <script type="text/javascript" src="common/js/jquery-2.1.3.js" ></script>
  <script type="text/javascript" src="common/js/login/login.js" ></script>
</head>
<body>

<table >
  <tr>
    <td>

      <s:textfield id="username" name="username" label="UserName"></s:textfield><label style="color: crimson" id="alert-username">用户名不能为空</label>
    </td>
  </tr>
  <tr>
    <td>

      <s:textfield id="userpwd" name="userpwd" label="UserPwd"></s:textfield><label style="color: crimson" id="alert-userpwd">密码不能为空</label>
    </td>
  </tr>
  <tr id="alert-tr">
    <td align="center">
      <label style="color: crimson" >密码不能为空</label>
    </td>

  </tr>
  <tr>
    <td align="center">
      <button type="button" onclick="login()">Login</button>
    </td>

  </tr>
</table>

</body>
</html>
