<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        a {
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Logout Section -->
    <div class="d-flex justify-content-between align-items-center p-3">
        <h1>ToDo Item List</h1>
        <div>
            <span class="mr-3">Welcome, ${currentUser}</span>
            <a class="btn btn-warning" href="${pageContext.request.contextPath}/logout">Logout</a>
        </div>
    </div>

    <form:form modelAttribute="todo">
        <table class="table table-bordered">
            <tr>
                <th>Id</th>
                <th>Title</th>
                <th>Date</th>
                <th>Status</th>
                <th>Mark Completed</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <c:forEach var="todo" items="${list}">
                <tr>
                    <td><c:out value="${todo.id}"/></td>
                    <td><c:out value="${todo.title}"/></td>
                    <td><fmt:formatDate value="${todo.date}" pattern="yyyy-MM-dd"/></td>
                    <td><c:out value="${todo.status}"/></td>
                    <td>
                        <a class="btn btn-success" href="${pageContext.request.contextPath}/updateToDoStatus/${todo.id}">Mark Complete</a>
                    </td>
                    <td>
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/editToDoItem/${todo.id}">Edit</a>
                    </td>
                    <td>
                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteToDoItem/${todo.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form:form>

    <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath}/addToDoItem">Add New ToDo Item</a>
</div>

<script>
    window.onload = function () {
        var msg = "${message}";
        if (msg === "Save Success") {
            toastr.success("Item added successfully!!");
        } else if (msg === "Delete Success") {
            toastr.success("Item deleted successfully!!");
        } else if (msg === "Delete Failure") {
            toastr.error("Some error occurred, couldn't delete item");
        } else if (msg === "Edit Success") {
            toastr.success("Item updated successfully!!");
        }

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
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