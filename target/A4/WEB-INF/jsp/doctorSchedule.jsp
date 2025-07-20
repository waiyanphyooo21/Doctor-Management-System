<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h2>Welcome, Dr. ${doctorName}</h2>

<table border="1" cellpadding="8" cellspacing="0">
  <tr>
    <th>Patient Name</th>
    <th>Appointment Date</th>
    <th>Status</th>
    <th>Notes</th>
  </tr>
  <c:forEach var="appointment" items="${appointments}">
    <tr>
      <td>${appointment.patientName}</td>
      <td>${appointment.formattedAppointmentDate}</td>
      <td>${appointment.status}</td>
      <td>${appointment.notes}</td>
    </tr>
  </c:forEach>
</table>

<a href="${pageContext.request.contextPath}/doctorhome" class="btn btn-primary me-2">Back Home</a>
