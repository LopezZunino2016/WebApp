<html>
<head>
<title>Web App</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Stylesheets -->
<link rel="stylesheet" href="fonts/font-awesome.min.css">
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
					href="inicio.html">Inicio</a></li>
				<li class="nav-item"><a class="nav-link" href="#articulos">Artículos</a></li>
				<li class="nav-item"><a class="nav-link" href="#tablas">Tablas</a></li>
				<li class="nav-item"><a class="nav-link" href="#componentes">Componentes</a></li>
			</ul>
			<div class="col-sm-4">
				<form role="form" method="POST" action="principal.html">
					<div class="form-group">
						<input type="text"	class="form-control" id="usuario" 
							placeholder="Usuario" autofocus> 
					
						<input type="password"
							class="form-control" id="password" placeholder="Password">
						<button type="submit" class="btn btn-primary">
						<i class="fa fa-sign-in"></i> Enviar</button>
					</div>
				</form>
			</div>
		</div>
	</nav>
	<br>
	

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
