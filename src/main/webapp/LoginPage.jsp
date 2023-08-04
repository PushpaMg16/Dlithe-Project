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
</head>
<body>
	<div class="container w-50 mt-5">
	
	<!-- check if password is invalid -->
	<%if((String)request.getAttribute("invalid")=="true"){%>
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
		  Invalid username/password. Try again!
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	<%} %>
	
        <h1 class="text-center">Inventory Manager</h1>
        <form method=post action=LoginServlet>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input name="userText" type="text" class="form-control" id="userText" aria-describedby="emailHelp">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input name="passText" type="password" class="form-control" id="passText">
            </div>
            <div class="mb-3">
                <label for="exampleInputUserType" class="form-label">User type</label>
                <select name="userType" class="form-select" aria-label="Default select example" id="userType">
                    <option value="ADMINISTRATOR">Admin</option>
                    <option value="EMPLOYEE">Employee</option>
                  </select>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
            <button type="reset" class="btn btn-primary">Clear</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>