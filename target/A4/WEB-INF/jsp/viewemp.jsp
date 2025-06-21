<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor Directory</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: whitesmoke;
            /*background: #3F5EFB;*/
            /*background: radial-gradient(circle, rgba(63, 94, 251, 1) 0%, rgba(252, 70, 107, 1) 100%);*/
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            font-weight: 800;
            color: lightslategray;
            margin-bottom: 30px;
        }

        .add-link {
            text-align: center;
            margin-bottom: 25px;
        }

        .add-link a {
            text-decoration: none;
            margin: 0 15px;
            font-weight: 600;
            color: gray;
            border: 2px solid lightslategray;
            padding: 8px 20px;
            border-radius: 25px;
            transition: all 0.3s;
        }

        .add-link a:hover {
            background: #678099;
            color: white;
        }

        .search-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .search-box {
            padding: 12px 20px;
            width: 50%;
            border: 2px solid #ccc;
            border-radius: 25px;
            font-size: 16px;
            transition: 0.3s;
        }

        .search-box:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 10px rgba(59, 130, 246, 0.3);
        }

        .search-button {
            background: #3b82f6;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 25px;
            margin-left: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        .search-button:hover {
            background: #2563eb;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            border-radius: 12px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background: lightslategray;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background: #f9fafb;
        }

        tr:hover {
            background: #c7ced5;
        }

        img {
            max-width: 80px;
            max-height: 100px;
            border-radius: 8px;
        }

        .action, .view-details-link {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            margin: 2px;
            display: inline-block;
        }

        .action {
            background: lightslategray;
            color: white;
        }

        .action:hover {
            background: #678099;
        }

        .view-details-link {
            background: lightslategray;
            color: white;
        }

        .view-details-link:hover {
            background: #678099;
        }
    </style>
</head>
<body>

<h2>Doctor Lists</h2>

<div class="add-link">
    <a href="${pageContext.request.contextPath}/add-doctor">Add New Doctor</a>
    <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
</div>

<%--<div class="search-container">--%>
<%--    <form action="${pageContext.request.contextPath}/search-doctors" method="get">--%>
<%--        <input type="text" name="query" class="search-box" placeholder="Search by name or ID..." value="${searchQuery}">--%>
<%--        <button type="submit" class="search-button">Search</button>--%>
<%--    </form>--%>
<%--</div>--%>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Image</th>
        <th>Name</th>
        <th>Qualification</th>
        <th>Specialist</th>
        <th>Salary</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Gender</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="doc" items="${doctors}">
        <tr>
            <td>${doc.id}</td>
            <td>
                <c:if test="${not empty doc.base64Image}">
                    <img src="data:image/jpeg;base64,${doc.base64Image}" alt="Doctor Image"/>
                </c:if>
            </td>
            <td>${doc.name}</td>
            <td>${doc.qualification}</td>
            <td>${doc.specialist}</td>
            <td>${doc.salary}</td>
            <td>${doc.contact}</td>
            <td>${doc.email}</td>
            <td>${doc.gender}</td>
            <td>
                <a class="action" href="${pageContext.request.contextPath}/edit-doctor/${doc.id}">Edit</a>
                <a class="action" href="${pageContext.request.contextPath}/delete-doctor/${doc.id}" onclick="return confirm('Are you sure you want to delete this doctor?')">Delete</a>
                <a class="view-details-link" href="${pageContext.request.contextPath}/doctor-details/${doc.id}">Details</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
