<%--
  Created by IntelliJ IDEA.
  User: Wai Yan Phyo Oo
  Date: 7/19/25
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Doctor Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
  <h2>Welcome, Dr. ${doctorName}</h2>
  <div class="mt-4">
    <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-primary me-2">View Doctor List</a>
    <a href="${pageContext.request.contextPath}/doctorSchedule" class="btn btn-secondary">View Doctor Schedule</a>
  </div>

  <div class="mt-4">
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>
  </div>
</div>
</body>
</html>

