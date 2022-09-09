<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10.09.2022
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
%>
<% if(msg != null){ %>
<p style="color: red"><%=msg%></p>
<% } %>
<form action="/login" method="post">
  <input type="email" name="email" placeholder="input email"><br>
  <input type="password" name="password" placeholder="input password"><br>
  <input type="submit" value="login">
</form>
</body>
</html>
