<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05.09.2022
  Time: 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
</head>
<body>
<%
    Author author = (Author) request.getAttribute("author");
%>
<h1>Update data</h1>
<form action="/author/edit" method="post">
    <input type="hidden" name="authorId" value="<%=author.getId()%>"><br>
    <input type="text" name="name" value="<%=author.getName()%>"><br>
    <input type="text" name="surname" value="<%=author.getSurname()%>"><br>
    <input type="email" name="email" value="<%=author.getEmail()%>"><br>
    <input type="number" name="age" min="20" max="100" value="<%=author.getAge()%>"><br>
    <input type="submit" value="UPDATE AUTHOR">
</form>

</body>
</html>
