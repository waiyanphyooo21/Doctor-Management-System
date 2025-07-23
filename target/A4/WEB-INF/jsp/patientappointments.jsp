<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head><title>My Appointments</title></head>--%>
<%--<body>--%>
<%--<h2>My Appointments</h2>--%>

<%--<table border="1" cellpadding="8" cellspacing="0">--%>
<%--  <tr>--%>
<%--    <th>Doctor</th>--%>
<%--    <th>Appointment Date</th>--%>
<%--    <th>Status</th>--%>
<%--    <th>Notes</th>--%>
<%--  </tr>--%>
<%--  <c:forEach var="appointment" items="${appointments}">--%>
<%--    <tr>--%>
<%--      <td>${appointment.doctorName}</td>--%>
<%--      <td>${appointment.formattedAppointmentDate}</td>--%>
<%--      <td>${appointment.status}</td>--%>
<%--      <td>${appointment.notes}</td>--%>
<%--    </tr>--%>
<%--  </c:forEach>--%>
<%--</table>--%>

<%--<a href="${pageContext.request.contextPath}/appointment">Book New Appointment</a>--%>
<%--<a href="${pageContext.request.contextPath}/patienthome">Back to Home</a>--%>

<%--</body>--%>
<%--</html>--%>

<%--New UI--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Appointments</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
      background-color: #f8f9fa;
      padding: 20px;
    }
    .dashboard-container {
      max-width: 1200px;
      margin: 0 auto;
      background: white;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0,0,0,0.05);
      padding: 30px;
    }
    .page-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding-bottom: 15px;
      border-bottom: 1px solid #eee;
    }
    .page-title {
      color: #2c3e50;
      font-weight: 600;
      margin: 0;
    }
    .action-buttons {
      margin-top: 30px;
    }
    .btn-action {
      padding: 8px 20px;
      border-radius: 8px;
      font-weight: 500;
      margin-right: 10px;
    }
    .table-container {
      overflow-x: auto;
    }
    .appointment-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      border-radius: 10px;
      overflow: hidden;
    }
    .appointment-table th {
      background-color: #3498db;
      color: white;
      padding: 15px;
      text-align: left;
    }
    .appointment-table td {
      padding: 12px 15px;
      border-bottom: 1px solid #eee;
      vertical-align: middle;
    }
    .appointment-table tr:last-child td {
      border-bottom: none;
    }
    .appointment-table tr:hover {
      background-color: #f8f9fa;
    }
    .status-badge {
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 0.85rem;
      font-weight: 500;
    }
    .status-confirmed {
      background-color: #d4edda;
      color: #155724;
    }
    .status-pending {
      background-color: #fff3cd;
      color: #856404;
    }
    .status-cancelled {
      background-color: #f8d7da;
      color: #721c24;
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <div class="page-header">
    <h1 class="page-title">My Appointments</h1>
  </div>

  <div class="table-container">
    <table class="appointment-table">
      <thead>
      <tr>
        <th>Doctor</th>
        <th>Appointment Date</th>
        <th>Status</th>
        <th>Notes</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="appointment" items="${appointments}">
        <tr>
          <td>${appointment.doctorName}</td>
          <td>${appointment.formattedAppointmentDate}</td>
          <td>
              <span class="status-badge status-${appointment.status.toLowerCase()}">
                  ${appointment.status}
              </span>
          </td>
          <td>${appointment.notes}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <div class="action-buttons">
    <a href="${pageContext.request.contextPath}/appointment" class="btn btn-primary btn-action">
      <i class="fas fa-calendar-plus me-2"></i>Book New Appointment
    </a>
    <a href="${pageContext.request.contextPath}/patienthome" class="btn btn-outline-secondary btn-action">
      <i class="fas fa-arrow-left me-2"></i>Back to Home
    </a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>