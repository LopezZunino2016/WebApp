<%@page import="es.altair.bean.Articulo"%>
<%@page import="es.altair.dao.ArticuloDAOImplHibernate"%>
<%@page import="es.altair.dao.ArticuloDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Editar Articulos</title>
			<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">
	
			<!-- Stylesheets -->
		<link rel="stylesheet" href="../fonts/font-awesome.min.css">
		<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>	
	</head>
	<body>
	
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="principalAdmin.jsp">Inicio</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarExample" aria-controls="navbarExample"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarExample">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#articulos">Artículos</a></li>
				<li class="nav-item"><a class="nav-link" href="#tablas">Tablas</a></li>
				
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="container">
		<%
			if(session.getAttribute("usuLogeado") == null || session.isNew() )
			{
				response.sendRedirect("../Index.jsp?mensaje=Inicie Sesion");	
			}else{
				ArticuloDAO aDAO = new ArticuloDAOImplHibernate();
				Articulo a = aDAO.obtenerArticuloPorCodigo(request.getParameter("codigo"));
	%>
	<div class="row">
			<div class="col-md-5 col-md-offset-3">
				<div class="form-area">
					<form action="../EditarArticulo" method="post" role="form" enctype="multipart/form-data">
						<h3>Editar Articulo</h3>
						<input type="hidden" name="codigo" id="codigo" value="<%=a.getCodigo()%>"/>
						
						<div class="form-group">
							<label for="nombre">Nombre</label>
							<input type="text" name="nombre" id="nombre" class="form-control" value="<%=a.getNombre()%>"/>
						</div>
						
						<div class="form-group">
							<label for="descripcion">Descripcion</label>
							<input type="text" name="descripcion" id="descripcion" class="form-control" value="<%=a.getDescripcion()%>"/>
						</div>
						
						<div class="form-group">
							<label for="precio">Precio</label>
							<input type="number" name="precio" id="precio" class="form-control" value="<%=a.getPrecio()%>"/>
						</div>
						
						<div class="form-group">
							<img alt="Foto" src="image.jsp?imag=<%=a.getIdArticulos()%>" class="img-thumbnail" >		
							<input type="file" class="form-control" id="foto" name="foto">					
						</div>
						
						<div class="form-group">
							<input type="submit" class="form-control btn btn-primary">			
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
	
		<%
			} 
		%>	
				
	
			
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	</body>
</html>