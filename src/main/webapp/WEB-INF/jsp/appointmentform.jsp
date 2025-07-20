<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Book Appointment</title></head>
<body>
<h2>Book an Appointment</h2>

<c:if test="${not empty message}">
  <p style="color:green">${message}</p>
</c:if>

<form:form modelAttribute="appointment" method="post" action="${pageContext.request.contextPath}/appointment">

  <label for="doctorId">Choose Doctor:</label>
  <form:select path="doctorId" id="doctorId">
    <form:options items="${doctors}" itemValue="id" itemLabel="name" />
  </form:select>
  <br><br>

  <label for="appointmentDate">Appointment Date & Time:</label>
  <form:input path="appointmentDate" id="appointmentDate" type="datetime-local"/>
  <br><br>

  <label for="notes">Notes:</label><br>
  <form:textarea path="notes" id="notes" rows="3" cols="30"/>
  <br><br>

  <input type="submit" value="Book Appointment"/>
</form:form>

<a href="${pageContext.request.contextPath}/patientappointments">View My Appointments</a>
</body>
</html>
