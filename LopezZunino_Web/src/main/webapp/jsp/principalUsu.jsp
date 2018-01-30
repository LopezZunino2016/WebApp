<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Principal Usuario</title>
		<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">

		<!-- Stylesheets -->
	<link rel="stylesheet" href="../fonts/font-awesome.min.css">
	<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>	</head>
	<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="index.jsp">Mi Web</a>
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
				<li class="nav-item"><a class="nav-link" href="../CerrarSesion">Cerrar Sesión</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		
		<% if(session.getAttribute("usuLogeado") == null || session.isNew())
		{
			response.sendRedirect("../index.jsp?mensaje=Inicie sesión)");
		} else{
		%>	
		<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true" onclick="location.href='../CerrarSesion'">Cerrar Sesión</button>
		<%}
		%>
	</div>
	
	
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	</body>
</html>