<%@page import="es.altair.dao.UsuarioDAO"%>
<%@page import="es.altair.dao.UsuarioDAOImplHibernate"%>
<%@page import="es.altair.bean.Usuario"%>
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
				<li class="nav-item"><a class="nav-link" href="#Articulo">Articulos</a></li>
				<li class="nav-item"><a class="nav-link" href="#Usuario">Usuario</a>
				</li>

			</ul>

			<div class="pull-right">
				<ul class="nav pull-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Bienvenido, <%=login %> <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li>
								<a href="editarMiUsuario.jsp">
									<i class="icon-cog"></i>Mi Usuario
								</a>
							</li>
							<li><a href="../CerrarSesion"><i class="icon-off"></i>
									Cerrar Sesion</a></li>

						</ul></li>
				</ul>
			</div>

		</div>
	</div>
	</nav>
	<br>
	<div id="Articulo" class="container">
		<h1 class="my-4">Articulos</h1>
		<div class="row">
			<div class="col-md-7">

				<div>
					<table class="table table">
						<thead>
							<tr>
								<th>Nombre</th>
								<th>Descripcion</th>
								<th>Foto</th>
								<th>Precio</th>
								<th></th>
							</tr>
						</thead>
						<%
							ArticuloDAO aDAO = new ArticuloDAOImplHibernate();
							List<Articulo> listaArticulo = aDAO.listar(); 
							for (Articulo a : listaArticulo) {
						%>
						<tr>
							<td><%=a.getNombre()%></td>
							<td><%=a.getDescripcion()%></td>
							<td><img alt="Portada"
								src="image.jsp?imag=<%=a.getIdArticulos()%>"
								class="img-thumbnail" width="50" height="50"></td>
							<td><%=a.getPrecio()%></td>
							<td>
								<button type="button" class="btn btn-default"
									onclick="location.href='editarArticulo.jsp?codigo=<%=a.getCodigo()%>'">
									<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
									Actualizar
								</button> <!-- Button trigger modal -->

								<button type="button" class="btn btn-warning"
									data-toggle="modal"
									data-target="#borrarArticulo<%=a.getIdArticulos()%>">
									<i class="fa fa-times" aria-hidden="true"></i> Borrar
								</button> <!-- Modal -->

								<div class="modal fade"
									id="borrarArticulo<%=a.getIdArticulos()%>" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
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
					<button class="btn btn-primary"
						onclick="location.href='anadirArticulo.jsp'">
						<i class="fa fa-plus-square" aria-hidden="true"></i> Añadir
						Articulo
					</button>
				</div>
				<hr>
			</div>
		</div>

		<!--  -->
		<h1 id="Usuario" class="my-4">Usuarios</h1>
		<%
			String error = request.getParameter("mensaje");
			System.out.println("Error: " + error);
			
		%>
		<div class="row">
			<div class="col-md-7">
				<table class="table table">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Apellidos</th>
							<th>Telefono</th>
							<th>Email</th>
							<th>Login</th>
							<th></th>
						</tr>
					</thead>
					<%
						UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
						List<Usuario> listaUsuario = uDAO.lista();  
						for(Usuario u : listaUsuario){
					%>
					<tbody>
						<tr>
							<th><%= u.getNombre()%></th>
							<th><%= u.getApellido() %></th>
							<th><%= u.getTelefono() %></th>
							<th><%= u.getEmail() %></th>
							<th><%= u.getLogin() %></th>
							<th>
								<button type="button" class="btn btn-warning"
									data-toggle="modal"
									data-target="#borrarUsuario<%=u.getIdUsuarios()%>">
									<i class="fa fa-times" aria-hidden="true"></i> Borrar
								</button> <!-- Modal -->

								<div class="modal fade" id="borrarUsuario<%=u.getIdUsuarios()%>"
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
												¿Desea borrar el usuario
												<%=u.getNombre()%>?
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">No</button>
												<button type="button" class="btn btn-primary"
													onclick="location.href='../BorrarUsuario?id=<%=u.getIdUsuarios()%>'">Sí
												</button>
											</div>
										</div>
									</div>
								</div>
							</th>
						</tr>
					</tbody>
					<%
					}
					%>
				</table>

			</div>
		</div>
		<%
			}
		%>
	</div>
	<br>


	





	
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