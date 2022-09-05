<%@ page import="model.Author" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05.09.2022
  Time: 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add book</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
<%
    List<Author> authors = (List<Author>) request.getAttribute("authors");
%>
<h1>Input book data</h1>
<form action="/book/add" method="post" class="addData">
    <input type="text" name="title" placeholder="input title">
    <textarea name="description" rows="3" cols="30" placeholder="input description"></textarea>
    <input class="priceAndauthor" type="number" name="price" min="0.00" max="100000.00" step="0.01" placeholder="price"/>
    <select name="author" id="" class="priceAndauthor">
        
        <% for (Author author : authors) { %>
        <option value="<%=author.getId()%>"><%=author.getName()
        %></option>
        <% } %>
    </select>
    <input class="add" type="submit" value="ADD BOOK">
</form>
</body>
</html>
