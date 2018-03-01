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
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">

<link href="../css/1-col-portfolio.css" rel="stylesheet">


</head>
<body>

	<% if(session.getAttribute("usuLogeado") == null || session.isNew())
		{
			response.sendRedirect("../index.jsp?mensaje=Inicie sesión)");
		} else{
			String login = ((Usuario)session.getAttribute("usuLogeado")).getLogin();
			System.out.println(login);
			
	%>
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
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="misCompras.jsp">Mis Compras</a></li>
				
			</ul>

			<div class="pull-right">
				<ul class="nav pull-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Bienvenido, User <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<a href="editarMiUsuario.jsp">
									<i class="icon-cog"></i>Mi Usuario
								</a>
							</li>
							<li class="divider"></li>
							<li><a href="../CerrarSesion"><i class="icon-off"></i>
									Logout</a></li>
							<%
		}
	%>
						</ul></li>
				</ul>
			</div>

		</div>
	</div>
	
	</nav>
	
	<br>
	<!-- Page Content -->
	
	<div class="container">
		<h1 class="my-4">Articulos</h1>
		<%
				ArticuloDAO aDAO = new ArticuloDAOImplHibernate();
				List<Articulo> listaArticulo = aDAO.listar();
				for (Articulo a : listaArticulo) {
		%>
		<!-- Page Heading -->


		<!-- Project One -->
		<div class="row">
			<div class="col-md-7">
				<img alt="Portada" src="image.jsp?imag=<%=a.getIdArticulos()%>"
					class="img-thumbnail" width="300" height="300">
			</div>
			<div class="col-md-5">
				<h3><%=a.getNombre()%>
				</h3>
				<p><%=a.getDescripcion()%>
				</p>
				<p><%=a.getPrecio() %>
					Euros
				</p>
				<button type="button" class="btn btn-primary-" data-toggle="modal"
					data-target="#Comprar<%=a.getIdArticulos()%>">
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
							<div class="modal-body">¿Desea Comprar el articulo
										<%=a.getNombre()%>?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../ComprarArticulo?codigo=<%=a.getCodigo()%>'">Sí</button>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- /.row -->

		<hr>
		<%
			}
		%>
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Jose Mª
			Lopez Zunino2018</p>
	</div>
	 </footer>

	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>