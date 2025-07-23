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

<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>

<%--<style>--%>
<%--  .doctor-dashboard {--%>
<%--    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--%>
<%--    max-width: 1200px;--%>
<%--    margin: 30px auto;--%>
<%--    padding: 20px;--%>
<%--    color: #333;--%>
<%--  }--%>

<%--  .welcome-header {--%>
<%--    color: #2c3e50;--%>
<%--    margin-bottom: 25px;--%>
<%--    padding-bottom: 10px;--%>
<%--    border-bottom: 2px solid #3498db;--%>
<%--  }--%>

<%--  .appointments-table {--%>
<%--    width: 100%;--%>
<%--    border-collapse: collapse;--%>
<%--    margin-bottom: 30px;--%>
<%--    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);--%>
<%--    border-radius: 8px;--%>
<%--    overflow: hidden;--%>
<%--  }--%>

<%--  .appointments-table th {--%>
<%--    background-color: #3498db;--%>
<%--    color: white;--%>
<%--    padding: 15px;--%>
<%--    text-align: left;--%>
<%--    font-weight: 600;--%>
<%--  }--%>

<%--  .appointments-table td {--%>
<%--    padding: 12px 15px;--%>
<%--    border-bottom: 1px solid #e0e0e0;--%>
<%--  }--%>

<%--  .appointments-table tr:nth-child(even) {--%>
<%--    background-color: #f8f9fa;--%>
<%--  }--%>

<%--  .appointments-table tr:hover {--%>
<%--    background-color: #e8f4fc;--%>
<%--  }--%>

<%--  .btn {--%>
<%--    display: inline-block;--%>
<%--    padding: 10px 20px;--%>
<%--    background-color: #3498db;--%>
<%--    color: white;--%>
<%--    text-decoration: none;--%>
<%--    border-radius: 5px;--%>
<%--    transition: background-color 0.3s;--%>
<%--    font-weight: 500;--%>
<%--    border: none;--%>
<%--    cursor: pointer;--%>
<%--  }--%>

<%--  .btn:hover {--%>
<%--    background-color: #2980b9;--%>
<%--  }--%>

<%--  .status-pending {--%>
<%--    color: #e67e22;--%>
<%--    font-weight: 500;--%>
<%--  }--%>

<%--  .status-completed {--%>
<%--    color: #27ae60;--%>
<%--    font-weight: 500;--%>
<%--  }--%>

<%--  .status-cancelled {--%>
<%--    color: #e74c3c;--%>
<%--    font-weight: 500;--%>
<%--  }--%>
<%--</style>--%>

<%--<div class="doctor-dashboard">--%>
<%--  <h1 class="welcome-header">Dr. ${doctorName}'s Appointments</h1>--%>

<%--  <table class="appointments-table">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--      <th>Patient Name</th>--%>
<%--      <th>Appointment Date</th>--%>
<%--      <th>Status</th>--%>
<%--      <th>Notes</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="appointment" items="${appointments}">--%>
<%--      <tr>--%>
<%--        <td>${appointment.patientName}</td>--%>
<%--        <td>${appointment.formattedAppointmentDate}</td>--%>
<%--        <td class="status-${fn:toLowerCase(appointment.status)}">${appointment.status}</td>--%>
<%--        <td>${appointment.notes}</td>--%>
<%--      </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--  </table>--%>

<%--  <a href="${pageContext.request.contextPath}/doctorhome" class="btn">Back to Home</a>--%>
<%--</div>--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
  .doctor-dashboard {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    max-width: 1200px;
    margin: 30px auto;
    padding: 20px;
    color: #333;
    background-color: #f5f7fa;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }

  .welcome-header {
    color: #2c3e50;
    margin-bottom: 25px;
    padding-bottom: 15px;
    border-bottom: 2px solid #3498db;
    font-size: 28px;
    font-weight: 600;
  }

  .appointments-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 30px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
    background-color: white;
  }

  .appointments-table th {
    background-color: #3498db;
    color: white;
    padding: 16px 20px;
    text-align: left;
    font-weight: 600;
    font-size: 15px;
  }

  .appointments-table td {
    padding: 14px 20px;
    border-bottom: 1px solid #e0e0e0;
    vertical-align: top;
  }

  .appointments-table tr:nth-child(even) {
    background-color: #f8f9fa;
  }

  .appointments-table tr:hover {
    background-color: #e8f4fc;
  }

  .btn {
    display: inline-block;
    padding: 12px 24px;
    background-color: #3498db;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    transition: all 0.3s ease;
    font-weight: 500;
    font-size: 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  }

  .btn:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  }

  .status-pending {
    color: #e67e22;
    font-weight: 500;
    background-color: #fdf2e9;
    padding: 4px 8px;
    border-radius: 4px;
    display: inline-block;
  }

  .status-completed {
    color: #27ae60;
    font-weight: 500;
    background-color: #eafaf1;
    padding: 4px 8px;
    border-radius: 4px;
    display: inline-block;
  }

  .status-cancelled {
    color: #e74c3c;
    font-weight: 500;
    background-color: #fdedec;
    padding: 4px 8px;
    border-radius: 4px;
    display: inline-block;
  }

  .empty-state {
    text-align: center;
    padding: 40px;
    color: #7f8c8d;
    font-size: 16px;
  }
</style>

<div class="doctor-dashboard">
  <h1 class="welcome-header">
    <i class="fas fa-calendar-alt" style="margin-right: 10px;"></i>
    Dr. ${doctorName}'s Appointments
  </h1>

  <table class="appointments-table">
    <thead>
    <tr>
      <th>Patient Name</th>
      <th>Appointment Date/Time</th>
      <th>Status</th>
      <th>Notes</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${not empty appointments}">
        <c:forEach var="appointment" items="${appointments}">
          <tr>
            <td>
              <strong>${appointment.patientName}</strong>
            </td>
            <td>
              <i class="far fa-clock" style="margin-right: 8px; color: #3498db;"></i>
                ${appointment.formattedAppointmentDate}
            </td>
            <td>
                <span class="status-${fn:toLowerCase(appointment.status)}">
                    ${fn:toUpperCase(fn:substring(appointment.status, 0, 1))}${fn:toLowerCase(fn:substring(appointment.status, 1, -1))}
                </span>
            </td>
            <td>
              <c:choose>
                <c:when test="${not empty appointment.notes}">
                  ${appointment.notes}
                </c:when>
                <c:otherwise>
                  <span style="color: #95a5a6; font-style: italic;">No notes</span>
                </c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr>
          <td colspan="4" class="empty-state">
            <i class="far fa-calendar-times" style="font-size: 24px; margin-bottom: 10px;"></i><br>
            No appointments scheduled
          </td>
        </tr>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>

  <div style="text-align: center; margin-top: 20px;">
    <a href="${pageContext.request.contextPath}/doctorhome" class="btn">
      <i class="fas fa-arrow-left" style="margin-right: 8px;"></i> Back to Dashboard
    </a>
  </div>
</div>

<!-- Font Awesome for icons (add this in your <head> or layout template) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
