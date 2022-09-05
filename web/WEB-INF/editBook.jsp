<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05.09.2022
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
</head>
<body>
<%
  Book book = (Book) request.getAttribute("book");

%>
<h1>Update data</h1>
<form action="/book/edit" method="post">
    <input type="hidden" name="bookId" value="<%=book.getId()%>"><br>
    <input type="text" name="title" value="<%=book.getTitle()%>"><br>
    <textarea name="description" value="<%=book.getDescription()%>"></textarea>
    <input type="number" name="price" value="<%=book.getPrice()%>"/>
    <input type="submit" value="UPDATE AUTHOR">
</form>
</body>
</html>
