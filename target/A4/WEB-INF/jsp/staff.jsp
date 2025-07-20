<%--
  Created by IntelliJ IDEA.
  User: Wai Yan Phyo Oo
  Date: 7/20/25
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Staff Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
    }
    .dashboard-header {
      margin-bottom: 30px;
    }
    .dashboard-header h1 {
      margin: 0;
    }
    .dashboard-cards {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }
    .card {
      background: #f9f9f9;
      border-radius: 8px;
      padding: 20px;
      flex: 1 1 250px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      cursor: pointer;
      text-align: center;
      transition: background-color 0.2s ease;
      text-decoration: none;
      color: black;
    }
    .card:hover {
      background-color: #e0f0ff;
    }
    .card h2 {
      margin: 0 0 10px 0;
      font-size: 1.5em;
    }
    .card p {
      font-size: 1.2em;
      margin: 0;
    }
  </style>
</head>
<body>

<div class="dashboard-header">
  <h1>Welcome, ${sessionScope.loggedInUser.name}</h1>
  <p>Role: ${sessionScope.loggedInUser.role}</p>
</div>

<div class="dashboard-cards">

  <a href="${pageContext.request.contextPath}/viewemp" class="card">
    <h2>Doctors</h2>
    <p>Manage Doctors</p>
  </a>

  <a href="${pageContext.request.contextPath}/someOtherStaffFunction" class="card">
    <h2>Other Section</h2>
    <p>Some Other Staff Action</p>
  </a>

  <a href="${pageContext.request.contextPath}/logout" class="card">
    <h2>Logout</h2>
    <p>End your session</p>
  </a>

</div>

</body>
</html>
