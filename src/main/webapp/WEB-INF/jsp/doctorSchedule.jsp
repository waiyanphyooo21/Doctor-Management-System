<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>

<%--<h2>Welcome, Dr. ${doctorName}</h2>--%>

<%--<table border="1" cellpadding="8" cellspacing="0">--%>
<%--  <tr>--%>
<%--    <th>Patient Name</th>--%>
<%--    <th>Appointment Date</th>--%>
<%--    <th>Status</th>--%>
<%--    <th>Notes</th>--%>
<%--  </tr>--%>
<%--  <c:forEach var="appointment" items="${appointments}">--%>
<%--    <tr>--%>
<%--      <td>${appointment.patientName}</td>--%>
<%--      <td>${appointment.formattedAppointmentDate}</td>--%>
<%--      <td>${appointment.status}</td>--%>
<%--      <td>${appointment.notes}</td>--%>
<%--    </tr>--%>
<%--  </c:forEach>--%>
<%--</table>--%>

<%--<a href="${pageContext.request.contextPath}/doctorhome" class="btn btn-primary me-2">Back Home</a>--%>

<%--New UI--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  .doctor-dashboard {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    max-width: 1200px;
    margin: 30px auto;
    padding: 20px;
    color: #333;
  }

  .welcome-header {
    color: #2c3e50;
    margin-bottom: 25px;
    padding-bottom: 10px;
    border-bottom: 2px solid #3498db;
  }

  .appointments-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
  }

  .appointments-table th {
    background-color: #3498db;
    color: white;
    padding: 15px;
    text-align: left;
    font-weight: 600;
  }

  .appointments-table td {
    padding: 12px 15px;
    border-bottom: 1px solid #e0e0e0;
  }

  .appointments-table tr:nth-child(even) {
    background-color: #f8f9fa;
  }

  .appointments-table tr:hover {
    background-color: #e8f4fc;
  }

  .btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    font-weight: 500;
    border: none;
    cursor: pointer;
  }

  .btn:hover {
    background-color: #2980b9;
  }

  .status-pending {
    color: #e67e22;
    font-weight: 500;
  }

  .status-completed {
    color: #27ae60;
    font-weight: 500;
  }

  .status-cancelled {
    color: #e74c3c;
    font-weight: 500;
  }
</style>

<div class="doctor-dashboard">
  <h1 class="welcome-header">Dr. ${doctorName}'s Appointments</h1>

  <table class="appointments-table">
    <thead>
    <tr>
      <th>Patient Name</th>
      <th>Appointment Date</th>
      <th>Status</th>
      <th>Notes</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="appointment" items="${appointments}">
      <tr>
        <td>${appointment.patientName}</td>
        <td>${appointment.formattedAppointmentDate}</td>
        <td class="status-${fn:toLowerCase(appointment.status)}">${appointment.status}</td>
        <td>${appointment.notes}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <a href="${pageContext.request.contextPath}/doctorhome" class="btn">Back to Home</a>
</div>
