<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Patient Details</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #eef2f7;
      padding: 40px;
    }
    .container {
      max-width: 700px;
      background: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
      margin: auto;
    }
    img.patient-img {
      max-height: 200px;
      border-radius: 12px;
      display: block;
      margin-bottom: 20px;
    }
    h2 {
      margin-bottom: 20px;
      color: #333;
    }
    .field-label {
      font-weight: bold;
      color: #555;
    }
    .field-value {
      margin-bottom: 15px;
    }
    .back-link {
      margin-top: 30px;
      text-align: center;
    }
    .back-link a {
      color: #007bff;
      text-decoration: none;
      font-weight: bold;
    }
    .back-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <c:if test="${not empty patient.base64Image}">
    <img src="data:image/jpeg;base64,${patient.base64Image}" alt="Patient Image" class="patient-img"/>
  </c:if>

  <h2>Patient Details</h2>

  <div>
    <div class="field-label">Name:</div>
    <div class="field-value">${patient.name}</div>
  </div>
  <div>
    <div class="field-label">Age:</div>
    <div class="field-value">${patient.age}</div>
  </div>
  <div>
    <div class="field-label">Gender:</div>
    <div class="field-value">${patient.gender}</div>
  </div>
  <div>
    <div class="field-label">Contact:</div>
    <div class="field-value">${patient.contact}</div>
  </div>
  <div>
    <div class="field-label">Email:</div>
    <div class="field-value">${patient.email}</div>
  </div>
  <div>
    <div class="field-label">Address:</div>
    <div class="field-value">${patient.address}</div>
  </div>
  <div>
    <div class="field-label">Medical History:</div>
    <div class="field-value">${patient.medicalHistory}</div>
  </div>
  <div>
    <div class="field-label">Allergies:</div>
    <div class="field-value">${patient.allergies}</div>
  </div>
  <div>
    <div class="field-label">Emergency Contact:</div>
    <div class="field-value">${patient.emergencyContact}</div>
  </div>
  <div>
    <div class="field-label">Registration Date:</div>
    <div class="field-value">${patient.registrationDate}</div>
  </div>

  <div class="back-link">
    <a href="${pageContext.request.contextPath}/viewpatients">← Back to Patient List</a>
  </div>
</div>

</body>
</html>
