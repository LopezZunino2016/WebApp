<%@page import="es.altair.bean.Articulo"%>
<%@page import="es.altair.dao.ArticuloDAO" %>
<%@page import="java.util.List"%>
<%@page import="es.altair.dao.ArticuloDAOImplHibernate"%>
<%@page import="es.altair.dao.ArticuloDAO"%>
<html>
<head>
<title>Web App</title>
<!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="fonts/font-awesome.min.css">
<link href="css/estilo.css" rel="stylesheet" type="text/css" />
<link href="css/Prueba.css" rel="stylesheet" type="text/css" />
<link href="css/PruebaArticulo.css" rel="stylesheet" type="text/css" />


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
			</ul>
		</div>
	</nav>
	<br>
	<br>
	<div class="row" style="float: left">
		<div class="col-md-12">
			<div class="profile-sidebar" style="float: left">
				<br>
				<!-- Sidebar title -->
				<div class="profile-user">
					<div class="profile-name">
						<label>Inicie Sesion</label>
						<%
							String error = request.getParameter("mensaje");

							System.out.println("Error: " + error);

							if (error != null) {
						%>
						<div class="alert alert-warning alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">x</button>
							<strong>Info:<%=error%></strong>
						</div>
						<%
							}
						%>
					</div>
					<!-- Sidebar menu -->
					<nav class="profile-menu">
						<form role="form" method="POST" action="ValidarUsuario">
							<div class="form-group">
								<label for="usuario">Usuario</label> <input type="text"
									class="form-control" id="usuario" name="usuario"
									placeholder="Usuario" autofocus required="required">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="Password" required="required">
							</div>
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-sign-in"></i> Enviar
							</button>
							<button type="button" class="btn btn-default"
								onclick="location.href='jsp/registrar.jsp'">
								<i class="fa fa-user-plus"></i> Registrar
							</button>
						</form>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<section>
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
						src="jsp/image.jsp?imag=<%=a.getIdArticulos()%>"
						class="img-thumbnail" width="300" height="300"></td>
					<td><%=a.getNombre()%> <br> <%=a.getDescripcion()%> <br> <%=a.getPrecio() %> Euros.</td>
					<td><button type="button" class="btn btn-primary-"
							data-toggle="modal" data-target="#Comprar<%=a.getIdArticulos()%>">
							<i class="fa fa-shopping-basket" aria-hidden="true"></i> Comprar</button></td>
							
							<div class="modal fade" id="Comprar<%=a.getIdArticulos()%>"
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
										Para comprar tienes que logearte
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											data-dismiss="modal">OK</button>
										
									</div>
								</div>
							</div>
						</div>
				</tr>
			</table>



			<%
				}
			%>
		</div>
	</section>





	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
