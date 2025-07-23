<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Staff Dashboard</title>--%>
<%--  <style>--%>
<%--    body {--%>
<%--      font-family: Arial, sans-serif;--%>
<%--      padding: 20px;--%>
<%--    }--%>
<%--    .dashboard-header {--%>
<%--      margin-bottom: 30px;--%>
<%--    }--%>
<%--    .dashboard-header h1 {--%>
<%--      margin: 0;--%>
<%--    }--%>
<%--    .dashboard-cards {--%>
<%--      display: flex;--%>
<%--      gap: 20px;--%>
<%--      flex-wrap: wrap;--%>
<%--    }--%>
<%--    .card {--%>
<%--      background: #f9f9f9;--%>
<%--      border-radius: 8px;--%>
<%--      padding: 20px;--%>
<%--      flex: 1 1 250px;--%>
<%--      box-shadow: 0 2px 5px rgba(0,0,0,0.1);--%>
<%--      cursor: pointer;--%>
<%--      text-align: center;--%>
<%--      transition: background-color 0.2s ease;--%>
<%--      text-decoration: none;--%>
<%--      color: black;--%>
<%--    }--%>
<%--    .card:hover {--%>
<%--      background-color: #e0f0ff;--%>
<%--    }--%>
<%--    .card h2 {--%>
<%--      margin: 0 0 10px 0;--%>
<%--      font-size: 1.5em;--%>
<%--    }--%>
<%--    .card p {--%>
<%--      font-size: 1.2em;--%>
<%--      margin: 0;--%>
<%--    }--%>
<%--  </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="dashboard-header">--%>
<%--  <h1>Welcome, ${sessionScope.loggedInUser.name}</h1>--%>
<%--  <p>Role: ${sessionScope.loggedInUser.role}</p>--%>
<%--</div>--%>

<%--<div class="dashboard-cards">--%>

<%--  <a href="${pageContext.request.contextPath}/viewemp" class="card">--%>
<%--    <h2>Doctors</h2>--%>
<%--    <p>Manage Doctors</p>--%>
<%--  </a>--%>

<%--  <a href="${pageContext.request.contextPath}/logout" class="card">--%>
<%--    <h2>Logout</h2>--%>
<%--    <p>End your session</p>--%>
<%--  </a>--%>

<%--</div>--%>

<%--</body>--%>
<%--</html>--%>


<%--New UI--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Staff Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #4e73df;
      --secondary-color: #f8f9fc;
      --success-color: #1cc88a;
      --info-color: #36b9cc;
      --warning-color: #f6c23e;
      --danger-color: #e74a3b;
    }

    body {
      background-color: #f8f9fc;
      font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
    }

    .dashboard-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }

    .dashboard-header {
      background: white;
      border-radius: 10px;
      padding: 25px;
      margin-bottom: 30px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
      text-align: center;
    }

    .welcome-text {
      color: var(--primary-color);
      font-weight: 600;
      margin-bottom: 0;
    }

    .dashboard-cards {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 25px;
    }

    .dashboard-card {
      background: white;
      border-radius: 10px;
      padding: 25px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
      text-decoration: none;
      color: inherit;
      border-left: 4px solid var(--primary-color);
      height: 100%;
      display: flex;
      flex-direction: column;
    }

    .dashboard-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
    }

    .doctors-card:hover {
      border-left: 4px solid var(--success-color);
    }

    .patients-card:hover {
      border-left: 4px solid var(--info-color);
    }

    .card-icon {
      font-size: 2.5rem;
      margin-bottom: 15px;
      color: var(--primary-color);
    }

    .doctors-card .card-icon {
      color: var(--success-color);
    }

    .patients-card .card-icon {
      color: var(--info-color);
    }

    .card-title {
      font-size: 1.4rem;
      font-weight: 600;
      margin-bottom: 10px;
      color: #2e3a4d;
    }

    .card-description {
      color: #6c757d;
      margin-bottom: 15px;
    }

    .logout-container {
      grid-column: 1 / -1;
      text-align: center;
      margin-top: 20px;
    }

    .logout-btn {
      background: transparent;
      border: 2px solid var(--danger-color);
      color: var(--danger-color);
      padding: 10px 25px;
      border-radius: 30px;
      font-weight: 600;
      transition: all 0.3s ease;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }

    .logout-btn:hover {
      background: var(--danger-color);
      color: white;
      transform: scale(1.05);
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <div class="dashboard-header">
    <h1 class="welcome-text">Welcome, ${sessionScope.loggedInUser.name}</h1>
  </div>

  <div class="dashboard-cards">
    <a href="${pageContext.request.contextPath}/viewemp" class="dashboard-card doctors-card">
      <div class="card-icon">
        <i class="fas fa-user-md"></i>
      </div>
      <h2 class="card-title">Doctors Management</h2>
      <p class="card-description">View, add, edit or remove doctors</p>
      <div class="mt-auto">
        <span class="text-success">Manage Doctors <i class="fas fa-arrow-right ms-1"></i></span>
      </div>
    </a>

    <a href="${pageContext.request.contextPath}/viewemp" class="dashboard-card patients-card">
      <div class="card-icon">
        <i class="fas fa-user-injured"></i>
      </div>
      <h2 class="card-title">Patients Management</h2>
      <p class="card-description">View, add, edit or remove patients</p>
      <div class="mt-auto">
        <span class="text-info">Manage Patients <i class="fas fa-arrow-right ms-1"></i></span>
      </div>
    </a>
  </div>

  <div class="logout-container">
    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
      <i class="fas fa-sign-out-alt"></i>
      Logout
    </a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
