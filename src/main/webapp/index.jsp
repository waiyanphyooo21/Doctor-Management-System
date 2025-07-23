<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Doctor Management</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            /*background: linear-gradient(to right, #00c6ff, #0072ff);*/--%>
<%--            background: #3F5EFB;--%>
<%--            background: radial-gradient(circle, rgba(63, 94, 251, 1) 0%, rgba(252, 70, 107, 1) 100%);--%>
<%--            margin: 0;--%>
<%--            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--%>
<%--            color: white;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            height: 100vh;--%>
<%--        }--%>

<%--        .container {--%>
<%--            background-color: white;--%>
<%--            color: #2c3e50;--%>
<%--            padding: 50px 30px;--%>
<%--            border-radius: 15px;--%>
<%--            text-align: center;--%>
<%--            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);--%>
<%--            max-width: 600px;--%>
<%--            width: 90%;--%>
<%--        }--%>

<%--        h1 {--%>
<%--            font-size: 32px;--%>
<%--            margin-bottom: 15px;--%>
<%--            /*color: #0072ff;*/--%>
<%--            color: #2c3e50;--%>
<%--        }--%>

<%--        .welcome-message {--%>
<%--            font-size: 18px;--%>
<%--            color: #555;--%>
<%--            margin-bottom: 30px;--%>
<%--        }--%>

<%--        .action-buttons a {--%>
<%--            display: inline-block;--%>
<%--            margin: 10px;--%>
<%--            padding: 12px 30px;--%>
<%--            /*background-color: #007bff;*/--%>
<%--            background-color: lightslategray;--%>
<%--            color: white;--%>
<%--            border-radius: 8px;--%>
<%--            font-weight: bold;--%>
<%--            text-decoration: none;--%>
<%--            transition: all 0.3s ease;--%>
<%--        }--%>

<%--        .action-buttons a:hover {--%>
<%--            background-color: #678099;--%>
<%--            transform: translateY(-2px);--%>
<%--        }--%>

<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>Doctor Management System</h1>--%>

<%--    <div class="action-buttons">--%>
<%--        <a href="<c:url value='/add-doctor'/>"> Add Doctor</a>--%>
<%--        <a href="<c:url value='/viewemp'/>"> View Doctors</a>--%>
<%--        <!-- New patient buttons -->--%>
<%--        <a href="<c:url value='/add-patient'/>">Add Patient</a>--%>
<%--        <a href="<c:url value='/viewpatients'/>">View Patients</a>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Doctor Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm rounded">
                <div class="card-header text-center">
                    <h4>Login</h4>
                </div>
                <div class="card-body">
                    <!-- Show login error if any -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger text-center">${error}</div>
                    </c:if>

                    <!-- Login Form -->
                    <form method="post" action="${pageContext.request.contextPath}/login">
                        <div class="mb-3">
                            <label for="email" class="form-label">Username</label>
                            <input type="text" id="email" name="email" class="form-control" required />
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" name="password" class="form-control" required />
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
