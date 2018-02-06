package es.altair.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import es.altair.dao.ArticuloDAO;
import es.altair.dao.ArticuloDAOImplHibernate;
import es.altair.bean.Articulo;


/**
 * Servlet implementation class AnadirArticulo
 */
@MultipartConfig
public class AnadirArticulo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnadirArticulo() {
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
		System.out.println("Entro en doPost");
		String codigo = UUID.randomUUID().toString();
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		float precio = Float.parseFloat(request.getParameter("precio"));
		
		Part filePart = request.getPart("foto");		
		
		
		InputStream inputS = null;
		ByteArrayOutputStream os = null;
		if (!getFileName(filePart).equals("")) {
			inputS = filePart.getInputStream();
			
			// Escalar la imagen
			BufferedImage imageBuffer = ImageIO.read(inputS);
			Image tmp = imageBuffer.getScaledInstance(640, 640, BufferedImage.SCALE_FAST);
			BufferedImage buffered = new BufferedImage(640, 640, BufferedImage.TYPE_INT_RGB);
			buffered.getGraphics().drawImage(tmp, 0, 0, null);
			
			os = new ByteArrayOutputStream();
			ImageIO.write(buffered, "jpg", os);
		}
		
		System.out.println("Voy a añadir");
		ArticuloDAO aDAO = new ArticuloDAOImplHibernate();
		Articulo a = new Articulo(nombre, descripcion, os.toByteArray(), precio, codigo);
		
		aDAO.insertar(a);
		response.sendRedirect("jsp/principalAdmin.jsp");
		
	}
	private String getFileName(Part filePart) {
		for(String content : filePart.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename"))
				return content.substring(content.indexOf("=")+1).trim().replace("\"", "");
		}
		return null;
	}

}
