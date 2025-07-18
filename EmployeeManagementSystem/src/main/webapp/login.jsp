<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="en">
  <head>
  	<title>Admin Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/style.css">

  </head>
  <body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-5">
					<div class="login-wrap p-4 p-md-5">
		      			<div class="icon d-flex align-items-center justify-content-center">
		      				<span class="fa fa-user-o"></span>
		      			</div>
		      			<h3 class="text-center mb-4">Admin Login</h3>

						<form action="login" method="post" class="login-form">
		      				<div class="form-group">
		      					<input type="text" name="username" class="form-control rounded-left" placeholder="Username" required>
		      				</div>
	            			<div class="form-group d-flex">
	              				<input type="password" name="password" class="form-control rounded-left" placeholder="Password" required>
	            			</div>
	            			<div class="form-group d-md-flex">
	            				<div class="w-50">
	            					<label class="checkbox-wrap checkbox-primary">Remember Me
									  	<input type="checkbox" checked>
									  	<span class="checkmark"></span>
									</label>
								</div>
	            			</div>
	            			<div class="form-group">
	            				<button type="submit" class="btn btn-primary rounded submit p-3 px-5">Login</button>
	            			</div>

	            			<% if (request.getAttribute("error") != null) { %>
								<p class="text-danger text-center">
									<%= request.getAttribute("error") %>
								</p>
							<% } %>
	          			</form>
	        		</div>
				</div>
			</div>
		</div>
	</section>
  </body>
</html>
