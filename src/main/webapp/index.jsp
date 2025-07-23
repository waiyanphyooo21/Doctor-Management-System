<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Login | Doctor Management System</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body class="bg-light">--%>

<%--<div class="container mt-5">--%>
<%--    <div class="row justify-content-center">--%>
<%--        <div class="col-md-6">--%>
<%--            <div class="card shadow-sm rounded">--%>
<%--                <div class="card-header text-center">--%>
<%--                    <h4>Login</h4>--%>
<%--                </div>--%>
<%--                <div class="card-body">--%>
<%--                    <!-- Show login error if any -->--%>
<%--                    <c:if test="${not empty error}">--%>
<%--                        <div class="alert alert-danger text-center">${error}</div>--%>
<%--                    </c:if>--%>

<%--                    <!-- Login Form -->--%>
<%--                    <form method="post" action="${pageContext.request.contextPath}/login">--%>
<%--                        <div class="mb-3">--%>
<%--                            <label for="email" class="form-label">Username</label>--%>
<%--                            <input type="text" id="email" name="email" class="form-control" required />--%>
<%--                        </div>--%>

<%--                        <div class="mb-3">--%>
<%--                            <label for="password" class="form-label">Password</label>--%>
<%--                            <input type="password" id="password" name="password" class="form-control" required />--%>
<%--                        </div>--%>

<%--                        <div class="d-grid">--%>
<%--                            <button type="submit" class="btn btn-primary">Login</button>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--New UI--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Doctor Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
        }

        .login-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .login-card:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1.5rem;
            text-align: center;
        }

        .card-body {
            padding: 2rem;
            background-color: white;
        }

        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 5px;
            border: 1px solid #ddd;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
        }

        .btn-login {
            background-color: var(--primary-color);
            border: none;
            padding: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .btn-login:hover {
            background-color: #3a5ccc;
        }

        .input-group-text {
            background-color: transparent;
            border-right: none;
        }

        .input-with-icon {
            border-left: none;
            padding-left: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6 col-xl-5">
            <div class="login-card card">
                <div class="card-header">
                    <h3></i>Pearl Yadana Hospital</h3>
                </div>
                <div class="card-body p-4">
                    <!-- Show login error if any -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show text-center">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <!-- Login Form -->
                    <form method="post" action="${pageContext.request.contextPath}/login">
                        <div class="mb-4">
                            <label for="email" class="form-label fw-bold">Username</label>
                            <div class="input-group">
                                <span class="input-group-text bg-transparent"><i class="fas fa-envelope"></i></span>
                                <input type="text" id="email" name="email" class="form-control input-with-icon"
                                       placeholder="Enter your username" required />
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="password" class="form-label fw-bold">Password</label>
                            <div class="input-group">
                                <span class="input-group-text bg-transparent"><i class="fas fa-lock"></i></span>
                                <input type="password" id="password" name="password" class="form-control input-with-icon"
                                       placeholder="Enter your password" required />
                            </div>
                        </div>

                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-login btn-block">
                                <i class="fas fa-sign-in-alt me-2"></i>Login
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>