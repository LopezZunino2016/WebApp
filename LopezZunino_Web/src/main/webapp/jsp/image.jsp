<%@page import="java.io.OutputStream"%><%@page import="es.altair.dao.ArticuloDAOImplHibernate"%><%@page import="es.altair.dao.ArticuloDAO"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%
	try{
		String idArticulo = request.getParameter("imag");
		ArticuloDAO aDAO = new ArticuloDAOImplHibernate(); 
		
		byte[] imagen = aDAO.obtenerPortadaPorId(Integer.parseInt(idArticulo));
		try{
			if(imagen != null ){
				response.setContentType("image/jpeg");
				response.setHeader("Content-Disposition", "attachment");
				OutputStream o = response.getOutputStream();
				o.write(imagen);
				o.flush();
				o.close();
				return;
			}
		}catch (IllegalStateException e){
			
		}
	}catch (Exception e){
		
	}
%>
   