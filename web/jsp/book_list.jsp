<%@ page import="java.util.List" %>
<%@ page import="com.nf.bookstore1.entity.Book" %>
<%@ page import="util.WebUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书列表</title>

    <style>
        table {
            border-collapse: collapse;
        }

        table, th, td {
            padding: 3px 1em;
            border: 1px solid black;
        }
    </style>
</head>
<body>

<%= WebUtil.popSessionMsg(request) %>

<form action="/q">
    <input type="text" placeholder="查询条件(名字)" name="condition">
    <input type="submit" value="搜索">
</form>

<form action="/del" method="post">
    <table>
        <tr>
            <th><input type="checkbox" onclick="alls(this)"></th>
            <th>id</th>
            <th>书名</th>
            <th>价格</th>
            <th>作者</th>
            <th>出版社</th>
            <th>其他</th>
        </tr>
        <%
            List<Book> books = (List<Book>) request.getAttribute("books");

            for (Book book : books) {
        %>
        <tr>
            <td><input name="id" value="<%= book.getId()%>" type="checkbox"></td>
            <td><%= book.getId() %>
            </td>
            <td><a href="/detail?id=<%= book.getId()%>"><%= book.getName() %>
            </a></td>
            <td><%= book.getPrice() %>
            </td>
            <td><%= book.getAuthor() %>
            </td>
            <td><%= book.getPress() %>
            </td>
            <td>
                <a href="/del?id=<%= book.getId() %>">删除</a>
                <a href="/update?id=<%= book.getId() %>">更新</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>


    <div style="margin-top: 2em;">
        <input type="submit" value="删除">
        <a href="/add">增加新的书籍</a>
    </div>
</form>

<script>
    function alls(e) {
        var checkboxs=document.getElementsByName("id");
        for (var i = 0; i < checkboxs.length; i++) {
            checkboxs[i].checked=e.checked
        }
    }
</script>
</body>
</html>
