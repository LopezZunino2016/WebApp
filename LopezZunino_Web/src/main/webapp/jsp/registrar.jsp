<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registrar</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="../fonts/font-awesome.min.css">
	<link href="css/estilo.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">Mi Web</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarExample" aria-controls="navbarExample"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarExample">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="/index.jsp">Inicio</a></li>
				<li class="nav-item"><a class="nav-link" href="#articulos">Artículos</a></li>
				<li class="nav-item"><a class="nav-link" href="#tablas">Tablas</a></li>
				<li class="nav-item"><a class="nav-link" href="#componentes">Componentes</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Registro</h1>
				<%
					String error = request.getParameter("mensaje");
					if (error != null) {
				%>
				<div class="alert alert-warning alert-dismissable">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">x</button>
					<strong>Info!</strong>
					<%=error%>
				</div>
				<%
					}
				%>
				<hr>
				<form action="../RegistrarUsuario" class="form-horizontal" method="post">
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
						<label class="col-md-6 control-label" for="nombre">Nombre</label>
						<div class="col-md-6">
							<input type="text" id="nombre" name="nombre" placeholder="Nombre"
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
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>