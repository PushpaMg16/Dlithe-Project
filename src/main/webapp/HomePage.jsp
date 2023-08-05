<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
   	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<%@page import="DB.User" %>
	<%
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("message", "Invalid user. Please login!");
			RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
			rd.forward(request, response);
		}
	%>
	<nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="bi bi-box"></i> Inventory Manager</a>
            <div class="align-middle">
                <i class="bi bi-person-circle" style="display: inline; color: white;"></i>
                <p style="display: inline; color: white;" class="mx-2">${user.getUsername()} (${user.getUserType()})</p>
                <button type="button" class="btn btn-primary btn-sm" onclick="location.href='LogoutServlet'">LogOut</button>
            </div>
        </div>
    </nav>
    <div class="container-fluid text-start">
        <div class="row mt-3">
          <div class="col-sm-2">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action active" aria-current="true"><i class="bi bi-house"></i> Home</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-box2"></i> Products</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-person"></i> Customers</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-file-earmark-person"></i> Suppliers</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-currency-rupee"></i> Sales</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-wallet"></i> Purchases</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-person-vcard"></i> Users</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="bi bi-journals"></i> User Log</a>
              </div>
          </div>
          <div class="col text-start">
            <h1>Welcome, ${user.getUsername()}.</h1>
            <div>
                <p>Manage your inventory, transactions and personnel, all in one place.</p>
                <p>Click on the side menu items to start.</p>
            </div>
          </div>
          <div class="col-sm-3">
            <!-- form -->
          </div>
        </div>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>