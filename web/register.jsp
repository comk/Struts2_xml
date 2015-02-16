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
    $(document).ready(function(){
      $('#text').datepicker({
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
      <table>
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
            <input  type="text" id="text" class="form-control">

          </td>

        </tr>


      </table>

</body>
</html>