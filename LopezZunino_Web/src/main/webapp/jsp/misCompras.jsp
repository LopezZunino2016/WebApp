<%@page import="es.altair.bean.Compra"%>
<%@page import="es.altair.dao.CompraDAO"%>
<%@page import="es.altair.dao.CompraDAOImplHibernate"%>
<%@page import="es.altair.bean.Usuario"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mis Compras</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="../fonts/font-awesome.min.css">

<link href="../css/1-col-portfolio.css" rel="stylesheet">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="#">Zuni-Component</a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a class="nav-link" href="#">Mis
							Compras <span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link"	href="principalUsu.jsp">Volver </a>
					</li>
				</ul>
			</div>
		</nav>
	
		<div class="container">

		<% if(session.getAttribute("usuLogeado") == null || session.isNew())
		{
			response.sendRedirect("../index.jsp?mensaje=Inicie sesión)");
		} else{
			String login = ((Usuario)session.getAttribute("usuLogeado")).getLogin();
			
			CompraDAO cDAO = new CompraDAOImplHibernate();
			List<Compra> listCompra = cDAO.listarPorUsu((Usuario)session.getAttribute("usuLogeado"));
			
		%>
		
		<br>
		
			<div class="row">
				<table class="table table">
					<h1 class="my-4">Mis Compras</h1>
					
					<thead>
						<tr>
							<th>Foto</th>
							<th>Fecha</th>
							<th>Cantidad</th>
							<th>Precio</th>
							<th>Producto</th>
							<th></th>
						</tr>
					</thead>
					
					<%
						for (Compra c : listCompra){
					%>
						<tr>
							<td><img alt="Portada"
								src="image.jsp?imag=<%=c.getArticulo().getIdArticulos()%>"
								class="img-thumbnail" width="150" height="150"></td>
							
							<td><%=c.getFecha()%></td>
							<td><%=c.getCantidad() %></td>
							<td><%=c.getPrecio() %></td>
							<td><%=c.getArticulo().getNombre() %></td>
							<td>
							
							<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#borrarCompra<%=c.getIdcompra()%>">
							<i class="fa fa-times" aria-hidden="true"></i> Borrar
							</button>
							
							<div class="modal fade" id="borrarCompra<%=c.getIdcompra()%>"
							tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Borrar
											Compra</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										¿Desea borrar la compra del
										<%=c.getArticulo().getNombre()%>?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">No</button>
										<button type="button" class="btn btn-primary"
											onclick="location.href='../BorrarCompra?id=<%=c.getIdcompra()%>'">Sí</button>
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
			</div>
			
		

		<%
		}
		%>
		</div>
		<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Jose Mª
			Lopez Zunino2018</p>
	</div>
	 </footer>
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../js/jquery-3.2.1.slim.min.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
</body>
</html>