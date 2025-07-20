<h2>Welcome, Dr. ${doctorName}</h2>

<table border="1" cellpadding="8" cellspacing="0">
  <tr>
    <th>Patient ID</th>
    <th>Appointment Date</th>
    <th>Status</th>
    <th>Notes</th>
  </tr>
  <c:forEach var="appointment" items="${appointments}">
    <tr>
      <td>${appointment.patientId}</td>
      <td>${appointment.appointmentDate}</td>
      <td>${appointment.status}</td>
      <td>${appointment.notes}</td>
    </tr>
  </c:forEach>
</table>
