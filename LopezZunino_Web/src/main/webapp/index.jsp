<%@page import="es.altair.bean.Articulo"%>
<%@page import="es.altair.dao.ArticuloDAO"%>
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
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="fonts/font-awesome.min.css">
<!-- <link href="css/estilo.css" rel="stylesheet" type="text/css" />
<link href="css/Prueba.css" rel="stylesheet" type="text/css" />
<link href="css/PruebaArticulo.css" rel="stylesheet" type="text/css" /> -->
<link href="css/1-col-portfolio.css" rel="stylesheet">

</head>
<body>
	<!-- Navigation -->
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
					
				</ul>
				<div class="pull-right">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Iniciar Sesion<b class="caret"></b></a>
							<ul class="dropdown-menu">
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
									<br>
									<button type="button" class="btn btn-default"
										onclick="location.href='jsp/registrar.jsp'">
										<i class="fa fa-user-plus"></i> Registrar
									</button>
								</form>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
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
				<img alt="Portada" src="jsp/image.jsp?imag=<%=a.getIdArticulos()%>"
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
							<div class="modal-body">Para comprar tienes que logearte</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">OK</button>

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
			<p class="m-0 text-center text-white">Copyright &copy; Jose Mª Lopez Zunino2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
