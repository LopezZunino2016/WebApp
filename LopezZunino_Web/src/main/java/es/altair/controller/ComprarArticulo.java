package es.altair.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import es.altair.bean.Articulo;
import es.altair.bean.Compra;
import es.altair.bean.Usuario;
import es.altair.dao.ArticuloDAO;
import es.altair.dao.ArticuloDAOImplHibernate;
import es.altair.dao.CompraDAO;
import es.altair.dao.CompraDAOImplHibernate;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImplHibernate;

/**
 * Servlet implementation class ComprarArticulo
 */
@MultipartConfig
public class ComprarArticulo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComprarArticulo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Entramos en CompraArticulo");
		
		java.util.Date fecha = new Date();
		Date fechaR = fecha; 
		System.out.println(fechaR);
		
		
						
		int cantidad = 1; 
		float precio1 = 12;

		String codigo = request.getParameter("codigo");
		System.out.println(codigo);
		ArticuloDAO aDAO = new ArticuloDAOImplHibernate();

		Articulo a = aDAO.obtenerArticuloPorCodigo(request.getParameter("codigo"));
		System.out.println("Articulo: "+ a.getNombre());
		
		HttpSession sesion = request.getSession();		
		System.out.println("USuario: "+ sesion.getAttribute("usuLogeado"));
		
			
		CompraDAO cDAO = new CompraDAOImplHibernate(); 
		
		Compra c = new Compra(fechaR, cantidad, precio1, (Usuario)sesion.getAttribute("usuLogeado") , a);
		System.out.println("COMPRA: "+c);
		cDAO.insertar(c);
		
		response.sendRedirect("jsp/principalUsu.jsp");

	}
}