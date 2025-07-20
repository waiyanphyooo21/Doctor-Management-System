<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>My Appointments</title></head>
<body>
<h2>My Appointments</h2>

<table border="1" cellpadding="8" cellspacing="0">
  <tr>
    <th>Doctor</th>
    <th>Appointment Date</th>
    <th>Status</th>
    <th>Notes</th>
  </tr>
  <c:forEach var="appointment" items="${appointments}">
    <tr>
      <td>
          <%-- Fetch doctor name by doctorId --%>
        <c:set var="doctorName" value="" />
        <c:forEach var="doc" items="${doctors}">
          <c:if test="${doc.id == appointment.doctorId}">
            <c:set var="doctorName" value="${doc.name}" />
          </c:if>
        </c:forEach>
          ${doctorName}
      </td>
      <td>${appointment.appointmentDate}</td>
      <td>${appointment.status}</td>
      <td>${appointment.notes}</td>
    </tr>
  </c:forEach>
</table>

<a href="${pageContext.request.contextPath}/patient/book-appointment">Book New Appointment</a>

</body>
</html>
