<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加表单</title>
</head>
<body>

<form action="/add" method="post">
    <div><input type="number" name="id" placeholder="id"></div>
    <div><input type="text" name="name" placeholder="书名"></div>
    <div><input type="number" name="price" placeholder="价格"></div>
    <div><input type="text" name="author" placeholder="作者"></div>
    <div><input type="text" name="press" placeholder="出版社"></div>
    <div><input type="submit"></div>
</form>

</body>
</html>
