<%--<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<html>--%>
<%--<head><title>Book Appointment</title></head>--%>
<%--<body>--%>
<%--<h2>Book an Appointment</h2>--%>

<%--<c:if test="${not empty message}">--%>
<%--  <p style="color:green">${message}</p>--%>
<%--</c:if>--%>

<%--<form:form modelAttribute="appointment" method="post" action="${pageContext.request.contextPath}/appointment">--%>

<%--  <label for="doctorId">Choose Doctor:</label>--%>
<%--  <form:select path="doctorId" id="doctorId">--%>
<%--    <form:options items="${doctors}" itemValue="id" itemLabel="name" />--%>
<%--  </form:select>--%>
<%--  <br><br>--%>

<%--  <label for="appointmentDate">Appointment Date & Time:</label>--%>
<%--  <form:input path="appointmentDate" id="appointmentDate" type="datetime-local"/>--%>
<%--  <br><br>--%>

<%--  <label for="notes">Notes:</label><br>--%>
<%--  <form:textarea path="notes" id="notes" rows="3" cols="30"/>--%>
<%--  <br><br>--%>

<%--  <input type="submit" value="Book Appointment"/>--%>
<%--</form:form>--%>

<%--<a href="${pageContext.request.contextPath}/patientappointments">View My Appointments</a>--%>
<%--</body>--%>
<%--</html>--%>

<%--New UI--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Book Appointment</title>
  <style>
    :root {
      --primary-color: #4a6fa5;
      --secondary-color: #6b8cae;
      --accent-color: #ff7e5f;
      --light-color: #f8f9fa;
      --dark-color: #343a40;
      --success-color: #28a745;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.6;
      color: var(--dark-color);
      background-color: #f5f7fa;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 600px;
      margin: 0 auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    h2 {
      color: var(--primary-color);
      text-align: center;
      margin-bottom: 25px;
      font-weight: 600;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: var(--secondary-color);
    }

    select, input[type="datetime-local"], textarea {
      width: 100%;
      padding: 12px;
      border: 1px solid #ddd;
      border-radius: 6px;
      font-size: 16px;
      transition: border 0.3s;
      box-sizing: border-box;
    }

    select:focus, input[type="datetime-local"]:focus, textarea:focus {
      border-color: var(--primary-color);
      outline: none;
      box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.2);
    }

    textarea {
      min-height: 100px;
      resize: vertical;
    }

    .btn {
      background-color: var(--primary-color);
      color: white;
      border: none;
      padding: 12px 25px;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s;
      width: 100%;
      font-weight: 500;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .btn:hover {
      background-color: var(--secondary-color);
    }

    .alert {
      padding: 12px 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      text-align: center;
    }

    .alert-success {
      background-color: rgba(40, 167, 69, 0.1);
      color: var(--success-color);
      border: 1px solid rgba(40, 167, 69, 0.2);
    }

    .link-btn {
      display: inline-block;
      margin-top: 20px;
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
      text-align: center;
      width: 100%;
    }

    .link-btn:hover {
      color: var(--accent-color);
      text-decoration: underline;
    }

    @media (max-width: 768px) {
      .container {
        padding: 20px;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Book an Appointment</h2>

  <c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
  </c:if>

  <form:form modelAttribute="appointment" method="post" action="${pageContext.request.contextPath}/appointment">
    <div class="form-group">
      <label for="doctorId">Choose Doctor</label>
      <form:select path="doctorId" id="doctorId">
        <form:options items="${doctors}" itemValue="id" itemLabel="name" />
      </form:select>
    </div>

    <div class="form-group">
      <label for="appointmentDate">Appointment Date & Time</label>
      <form:input path="appointmentDate" id="appointmentDate" type="datetime-local"/>
    </div>

    <div class="form-group">
      <label for="notes">Notes</label>
      <form:textarea path="notes" id="notes" rows="3" cols="30" placeholder="Any special requests or notes for the doctor..."/>
    </div>

    <button type="submit" class="btn">Book Appointment</button>
  </form:form>

  <a href="${pageContext.request.contextPath}/patientappointments" class="link-btn">View My Appointments</a>
</div>
</body>
</html>
