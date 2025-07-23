<%--
  Created by IntelliJ IDEA.
  User: Wai Yan Phyo Oo
  Date: 7/19/25
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--  <title>Doctor Dashboard</title>--%>
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container mt-5">--%>
<%--  <h2>Welcome, Dr. ${doctorName}</h2>--%>
<%--  <div class="mt-4">--%>
<%--    <a href="${pageContext.request.contextPath}/viewemp" class="btn btn-primary me-2">View Doctor List</a>--%>
<%--    <a href="${pageContext.request.contextPath}/doctorSchedule" class="btn btn-secondary">View Doctor Schedule</a>--%>
<%--  </div>--%>

<%--  <div class="mt-4">--%>
<%--    <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger">Logout</a>--%>
<%--  </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--New UI--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Doctor Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
      background-color: #f8f9fa;
      padding: 20px;
    }
    .dashboard-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding: 15px 0;
      border-bottom: 1px solid #eee;
    }
    .welcome-message h2 {
      color: #2c3e50;
      font-weight: 600;
      margin: 0;
    }
    .user-dropdown .btn {
      background: none;
      border: none;
      color: #2c3e50;
      padding: 5px 10px;
    }
    .user-dropdown .btn:hover {
      background-color: #f1f1f1;
    }
    .user-dropdown .dropdown-menu {
      border: none;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      border-radius: 8px;
    }
    .user-dropdown .dropdown-item {
      padding: 8px 15px;
    }
    .user-dropdown .dropdown-item i {
      width: 20px;
      text-align: center;
      margin-right: 8px;
    }
    .dashboard-content {
      max-width: 800px;
      margin: 0 auto;
    }
    .action-btn {
      padding: 10px 20px;
      border-radius: 8px;
      font-weight: 500;
    }
  </style>
</head>
<body>
<div class="dashboard-content">
  <div class="dashboard-header">
    <div class="welcome-message">
<%--      <h2>Welcome, Dr. ${doctorName}</h2>--%>
      <h2>Doctor Dashboard</h2>
    </div>

    <div class="user-dropdown">
      <div class="dropdown">
        <button class="btn dropdown-toggle d-flex align-items-center" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
          <i class="fas fa-user-circle fa-lg me-2"></i>
          <span>Dr. ${doctorName}</span>
        </button>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
          <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Profile</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
            <i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="mt-4">
    <a href="${pageContext.request.contextPath}/doctorSchedule" class="btn btn-primary action-btn">
      <i class="fas fa-calendar-alt me-2"></i>View Doctor Schedule
    </a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
