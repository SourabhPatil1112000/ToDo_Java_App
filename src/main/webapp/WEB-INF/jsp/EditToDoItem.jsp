<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit ToDo Item</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    <!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<body>

<div class="container">
    <h1 class="p-3">Edit ToDo Item</h1>

    <form:form action="${pageContext.request.contextPath}/editSaveToDoItem" method="post" modelAttribute="todo">
        <!-- Hidden ID -->
        <form:hidden path="id"/>

        <!-- Title -->
        <div class="form-group row">
            <label class="col-md-3 col-form-label" for="title">Title</label>
            <div class="col-md-6">
                <form:input path="title" id="title" class="form-control" required="required"/>
            </div>
        </div>

        <!-- Date -->
        <div class="form-group row">
            <label class="col-md-3 col-form-label" for="date">Date</label>
            <div class="col-md-6">
                <form:input type="date" path="date" id="date" class="form-control" required="required"/>
            </div>
        </div>

        <!-- Status -->
        <div class="form-group row">
            <label class="col-md-3 col-form-label" for="status">Status</label>
            <div class="col-md-6">
                <form:input path="status" id="status" class="form-control"/>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="form-group row">
            <div class="col-md-6 offset-md-3">
                <button type="submit" class="btn btn-success">Save</button>
            </div>
        </div>
    </form:form>
</div>

<!-- Toastr Notifications -->
<script>
    window.onload = function() {
        var msg = "${message}";
        if (msg === "Edit Failure") {
            toastr.error("Something went wrong with the edit.");
        } else if (msg === "Edit Success") {
            toastr.success("Item updated successfully!");
        }

        toastr.options = {
            "closeButton": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
    };
</script>

</body>
</html>
