<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="es.altair.bean.Articulo"%>
<%@page import="es.altair.dao.ArticuloDAO"%>
<%@page import="es.altair.dao.ArticuloDAOImplHibernate"%>
<%@page import="java.util.List"%>

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
	<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>	
	</head>
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
				List<Articulo> listaArticulo = aDAO.listar(); 
				
			
		%>
		<div class="row col-md-6 col-md-offset-2">
		<h2 id="articulos">Articulos</h2>
		
		
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Descripcion</th>
						<th>Foto</th>
						<th>Precio</th>
						<th></th>
					</tr>
				</thead>
				<%
					for(Articulo a : listaArticulo){
					 
				%>
				<tr>
					<td><%out.print(a.getIdArticulos()); %></td>
					<td><%=a.getNombre() %></td>
					<td><%=a.getDescripcion()%></td>
					<td><img alt="Portada" src="image.jsp?imag=<%=a.getIdArticulos() %>" class="img-thumbnail"
						width="50" height="50" ></td>
					<td><%=a.getPrecio() %></td>
					<td>
						<button type="button" class="btn btn-default"
							onclick="location.href='editarArticulo.jsp?codigo=<%=a.getCodigo()%>'">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
							Actualizar
						</button> <!-- Button trigger modal -->
						
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#borrarArticulo<%=a.getIdArticulos()%>">
							<i class="fa fa-times" aria-hidden="true"></i> Borrar
						</button> <!-- Modal -->
						
						<div class="modal fade" id="borrarArticulo<%=a.getIdArticulos()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Borrar
											Articulo</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										¿Desea borrar el articulo
										<%=a.getNombre()%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarArticulo?codigo=<%=a.getCodigo()%>'">Sí</button>
									</div>
								</div>
							</div>
						</div>
						
						
					</td>
					
				</tr>
				<%
					}
				%>
			</table>
			<button class="btn btn-primary" onclick="location.href='jsp/anadirArticulo.jsp'">>
				<i class="fa fa-plus-square" aria-hidden="true"></i>
				Añadir Articulo
			</button>
		</div>	
		<%
			} 
		%>	
	</div>						
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.2.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	
	</body>
</html>