<%@page import="es.altair.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registrar</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
		<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="../fonts/font-awesome.min.css">
		
		<link href="../css/1-col-portfolio.css" rel="stylesheet">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Zuni-Component</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Registrar Usuario
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="../index.jsp">Volver</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Registro</h1>
				<%
				if(session.getAttribute("usuLogeado") == null || session.isNew())
				{
					response.sendRedirect("../index.jsp?mensaje=Inicie sesi�n)");
				} else{
					String login = ((Usuario)session.getAttribute("usuLogeado")).getLogin();
					System.out.println(login);
				%>
				<div class="alert alert-warning alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">x</button>
					<strong>Info!</strong>
					
				</div>
				<%
					}
				%>
				<hr>
				<form action="../RegistrarUsuario" class="form-horizontal" method="post">
				
					<div class="form-group">
						<label class="col-md-6 control-label" for="nombre">Nombre</label>
						<div class="col-md-6">
							<input type="text" id="nombre" name="nombre" value="<%=((Usuario)session.getAttribute("usuLogeado")).getNombre() %>"
								class="form-control input-md" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-6 control-label" for="apellido">Apellido</label>
						<div class="col-md-6">
							<input type="text" id="apellido" name="apellido" placeholder="Apellido"
								class="form-control input-md" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-6 control-label" for="telefono">Telefono</label>
						<div class="col-md-6">
							<input type="number" id="telefono" name="telefono" placeholder="Telefono"
								class="form-control input-md" required>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-md-6 control-label" for="email">Email</label>
						<div class="col-md-6">
							<input type="email" id="email" name="email" placeholder="Email"
								class="form-control input-md" required>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-md-6 control-label" for="login">Login</label>
						<div class="col-md-6">
							<input type="text" id="login" name="login" placeholder="Login"
								class="form-control input-md" required>
						</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-md-6 control-label" for="password">Password</label>
						<div class="col-md-6">
							<input type="password" id="password" name="password" placeholder="Password"
								class="form-control input-md" required>
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="col-md-6">
							<input type="submit" value="Enviar"
								class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>