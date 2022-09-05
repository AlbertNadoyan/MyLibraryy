<%@ page import="java.util.List" %>
<%@ page import="model.Book" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 05.09.2022
  Time: 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
<%
    List<Book> bookList = (List<Book>) request.getAttribute("books");
%>

<table border="1" class="authorTable">
    <tr class="tableName">
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>price</th>
        <th>author</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    <% for (Book book : bookList) { %>
        <tr>
            <td class="tableId"><%=book.getId()%></td>
            <td><%=book.getTitle()%></td>
            <td><%=book.getDescription()%></td>
            <td><%=book.getPrice()%></td>
            <td><%=book.getAuthor().getName()%></td>
            <td class="editTable"><a href="/book/edit?bookId=<%=book.getId()%>">EDIT</a></td>
            <td class="deleteTable"><a href="/book/delete?bookId=<%=book.getId()%>">DELETE</a></td>
        </tr>
    <% } %>
</table>

</body>
</html>
