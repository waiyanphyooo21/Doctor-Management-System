<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>
        <c:choose>
            <c:when test="${patient.id == 0}">Add Patient</c:when>
            <c:otherwise>Edit Patient</c:otherwise>
        </c:choose>
    </title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #eef2f7;
            padding: 50px;
        }
        .form-wrapper {
            background: #ffffff;
            max-width: 700px;
            margin: auto;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #444;
        }
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="email"],
        .form-group input[type="file"],
        .form-group input[type="date"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }
        .form-group .error {
            color: red;
            font-size: 12px;
        }
        .form-group .gender-options {
            margin-top: 6px;
        }
        .form-group .gender-options label {
            margin-right: 15px;
        }
        .form-group img {
            max-height: 150px;
            display: block;
            margin-top: 10px;
            border-radius: 8px;
        }
        .form-actions {
            text-align: center;
            margin-top: 30px;
        }
        .form-actions input[type="submit"] {
            padding: 12px 30px;
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .form-actions input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #007bff;
            text-decoration: none;
        }
        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <h2>
        <c:choose>
            <c:when test="${patient.id == 0}">Add New Patient</c:when>
            <c:otherwise>Edit Patient</c:otherwise>
        </c:choose>
    </h2>

    <form:form method="post"
               modelAttribute="patient"
               action="${pageContext.request.contextPath}${patient.id == 0 ? '/save-patient' : '/update-patient'}"
               enctype="multipart/form-data">

        <form:hidden path="id"/>

        <div class="form-group">
            <label>Name:</label>
            <form:input path="name"/>
            <form:errors path="name" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Age:</label>
            <form:input path="age" type="number"/>
            <form:errors path="age" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <div class="gender-options">
                <form:radiobutton path="gender" value="Male"/> Male
                <form:radiobutton path="gender" value="Female"/> Female
            </div>
            <form:errors path="gender" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Contact:</label>
            <form:input path="contact"/>
            <form:errors path="contact" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <form:input path="email"/>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Address:</label>
            <form:input path="address"/>
        </div>

        <div class="form-group">
            <label>Medical History:</label>
            <form:textarea path="medicalHistory" rows="3"/>
        </div>

        <div class="form-group">
            <label>Allergies:</label>
            <form:textarea path="allergies" rows="2"/>
        </div>

        <div class="form-group">
            <label>Emergency Contact:</label>
            <form:input path="emergencyContact"/>
        </div>

        <div class="form-group">
            <label>Registration Date:</label>
            <!-- Added type="date" explicitly for better browser support -->
            <form:input path="registrationDate" type="date"/>
            <form:errors path="registrationDate" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Upload Image:</label>
            <input type="file" name="imageFile" accept="image/*" onchange="previewImage(event)"/>
            <c:choose>
                <c:when test="${not empty base64Image}">
                    <img id="preview" src="data:image/jpeg;base64,${base64Image}" alt="Patient Image"/>
                </c:when>
                <c:otherwise>
                    <img id="preview" style="display:none;" alt="No image"/>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="form-actions">
            <input type="submit"
                   value="<c:out value='${patient.id == 0 ? "Save Patient" : "Update Patient"}'/>"/>
        </div>

    </form:form>

    <div class="back-link">
        <a href="${pageContext.request.contextPath}/viewpatients">← Back to Patient List</a>
    </div>
</div>

<script>
    function previewImage(event) {
        const output = document.getElementById('preview');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.style.display = 'block';
        output.onload = function () {
            URL.revokeObjectURL(output.src);
        }
    }
</script>

</body>
</html>
