<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04.09.2022
  Time: 13:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Author</title>
  <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
<h1>Input author data</h1>
<form action="/author/add" method="post" class="addData">
  <input type="text" name="name" placeholder="input name"><br>
  <input type="text" name="surname" placeholder="input surname"><br>
  <input type="email" name="email" placeholder="input email"><br>
  <input class="priceAndauthor" type="number" name="age" min="20" max="100" placeholder="input age"><br>
  <input class="add" type="submit" value="ADD AUTHOR">
</form>

</body>
</html>
