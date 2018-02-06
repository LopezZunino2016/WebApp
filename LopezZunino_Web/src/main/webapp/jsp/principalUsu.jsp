<%@page import="es.altair.dao.UsuarioDAOImplHibernate"%>
<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.dao.ArticuloDAOImplHibernate"%>
<%@page import="es.altair.bean.Articulo"%>
<%@page import="java.util.List"%>
<%@page import="es.altair.dao.ArticuloDAO"%>
<%@page import="es.altair.bean.Usuario"%>
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
<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
<link href="../css/Prueba.css" rel="stylesheet" type="text/css" />

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
			<li class="nav-item"><a class="nav-link" href="../CerrarSesion">Cerrar
					Sesión</a></li>
		</ul>
	</div>
	</nav>
	<br>
	
	<div class="container">

		<% if(session.getAttribute("usuLogeado") == null || session.isNew())
		{
			response.sendRedirect("../index.jsp?mensaje=Inicie sesión)");
		} else{
			String login = ((Usuario)session.getAttribute("usuLogeado")).getLogin();
			System.out.println(login);
			
		%>



	</div>
	<!-- Main page -->
	<div class="row" style="float: left">
		<br>
		<br>
		<!-- Sidebar -->
		<div class="col-md-2 col-sm-2">
			<div class="profile-sidebar" style="float: left">
				<!-- Sidebar title -->
				<div class="profile-user">
					<div class="profile-name">
					<br>
		<br>
						<label>Bienvenido</label> <label name="login"><%=((Usuario)session.getAttribute("usuLogeado")).getNombre()%></label>
						
					</div>
				</div>

				<!-- Sidebar menu -->
				<nav class="profile-menu">
				<ul class="nav navbar vertical">
					<li>
						<button type="button" class="btn btn-warning.active"
							data-dismiss="alert" aria-hidden="true"
							onclick="location.href='misCompras.jsp'">MisCompras</button>
							<%
							}
						%>
					</li>
					
					<br>
					<li>
						<button type="button" class="btn btn-warning.active"
							data-dismiss="alert" aria-hidden="true"
							onclick="location.href='../CerrarSesion'">Cerrar Sesión</button>
					</li>

				</ul>
				</nav>
			</div>
		</div>

		</div>
		
		<section style="float: right">
		<br>
		<br>
		<h1>Articulos</h1>
		<div class="row col-md-6 col-md-offset-2">
			<%
				ArticuloDAO aDAO = new ArticuloDAOImplHibernate();
				List<Articulo> listaArticulo = aDAO.listar();
				for (Articulo a : listaArticulo) {
			%>
			<table class="table table">
				<tr>
					<td><img alt="Portada"
						src="image.jsp?imag=<%=a.getIdArticulos()%>"
						class="img-thumbnail" width="350" height="350"></td>
					<td><%=a.getNombre()%> <br> <%=a.getDescripcion()%> <br> <%=a.getPrecio() %> Euros <br></td>
																					
					
					<td><button type="button" class="btn btn-primary-"
							data-toggle="modal" data-target="#Comprar<%=a.getIdArticulos()%>">
							<i class="fa fa-shopping-basket" aria-hidden="true"></i> Comprar
						</button>
						
						<div class="modal fade" id="Comprar<%=a.getIdArticulos()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Comprar
											Articulo</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										¿Desea Comprar el articulo
										<%=a.getNombre()%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../ComprarArticulo?codigo=<%=a.getCodigo()%>'">Sí</button>
									</div>
								</div>
							</div>
						</div>
						
							
					</td>
				</tr>
			</table>



			<%
				}
			%>
		</div>
	</section>
	
	
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="../js/jquery-3.2.1.slim.min.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
</body>
</html>