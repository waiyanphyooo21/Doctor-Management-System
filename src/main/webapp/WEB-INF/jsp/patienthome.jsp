<%--
  Created by IntelliJ IDEA.
  User: Wai Yan Phyo Oo
  Date: 7/19/25
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Patient Home</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f5f7fa; padding: 40px; }
        .container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);}
        h1 { color: #333; }
        .logout { margin-top: 20px; }
        .logout a { color: #007bff; text-decoration: none; font-weight: bold; }
        .logout a:hover { text-decoration: underline; }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome, <c:out value="${user.username}"/>!</h1>
    <p>This is your patient dashboard.</p>


    <div class="logout">
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
    </div>
</div>
</body>
</html>

