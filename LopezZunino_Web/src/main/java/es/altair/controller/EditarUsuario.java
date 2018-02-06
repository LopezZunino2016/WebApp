package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Usuario;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImplHibernate;


/**
 * Servlet implementation class EditarUsuario
 */
@MultipartConfig
public class EditarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuario() {
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
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String telefono = request.getParameter("telefono");
		String email = request.getParameter("email");
		int tipo  = 1;
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		
		Usuario usu = new Usuario(nombre, apellido, telefono, email, tipo, login, password);
		
		UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
		
		String msg = "";
		int filas = 0;
		
		if(uDAO.validarlogin(usu)) {
			uDAO.actualizar(nombre, apellido, telefono, email, tipo, login, password);
							
			response.sendRedirect("jsp/principalUsu.jsp?mensaje="+msg);
		}
	}

}
