<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04.09.2022
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Library</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <%
  User user = (User) session.getAttribute("user");
  %>
  <body>
  <div class="indeximg">
    <img src="image/ph.jpg" alt="">
  </div>
  <div class="menu_container">
    <a href="/authors">Show All Authors</a>
    <a href="/book">Show All Books</a>
    <%
    if(user != null){
    %>
    <a href="/author/add">Add Author</a>
    <a href="/book/add">Add Book</a>
    <a href="/logout">Logout</a>
    <% }else{ %>
    <a href="/login">Login</a>
    <a href="/registration">Registration</a>
    <% } %>

  </div>
  </body>
</html>
