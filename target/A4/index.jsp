<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Management</title>
    <style>
        body {
            /*background: linear-gradient(to right, #00c6ff, #0072ff);*/
            background: #3F5EFB;
            background: radial-gradient(circle, rgba(63, 94, 251, 1) 0%, rgba(252, 70, 107, 1) 100%);
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            color: #2c3e50;
            padding: 50px 30px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 90%;
        }

        h1 {
            font-size: 32px;
            margin-bottom: 15px;
            /*color: #0072ff;*/
            color: #2c3e50;
        }

        .welcome-message {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }

        .action-buttons a {
            display: inline-block;
            margin: 10px;
            padding: 12px 30px;
            /*background-color: #007bff;*/
            background-color: lightslategray;
            color: white;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .action-buttons a:hover {
            background-color: #678099;
            transform: translateY(-2px);
        }

    </style>
</head>
<body>
<div class="container">
    <h1>Doctor Management System</h1>

    <div class="action-buttons">
        <a href="<c:url value='/add-doctor'/>"> Add Doctor</a>
        <a href="<c:url value='/viewemp'/>"> View Doctors</a>
    </div>
</div>
</body>
</html>
