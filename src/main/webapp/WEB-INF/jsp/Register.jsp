<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="text-center p-3">Register</h1>
            
            <form:form action="${pageContext.request.contextPath}/register" method="post" modelAttribute="user">
                <div class="form-group">
                    <label for="username">Username</label>
                    <form:input path="username" id="username" class="form-control" required="required"/>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <form:input type="email" path="email" id="email" class="form-control" required="required"/>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <form:password path="password" id="password" class="form-control" required="required"/>
                </div>
                
                <button type="submit" class="btn btn-success btn-block">Register</button>
            </form:form>
            
            <div class="text-center mt-3">
                <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function () {
        var msg = "${message}";
        if (msg.startsWith("Registration Failure")) {
            toastr.error(msg.replace("Registration Failure - ", ""));
        }

        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000"
        };
    }
</script>
</body>
</html>