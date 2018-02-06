package es.altair.dao;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Articulo;
import es.altair.bean.Usuario;
import es.altair.util.SessionProvider;

public class ArticuloDAOImplHibernate implements ArticuloDAO {

	public List<Articulo> listar() {
		
		List<Articulo> articulos = new ArrayList<Articulo>();
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			articulos = sesion.createQuery("FROM Articulo a ")
					.list(); 

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
		
		return articulos;
	}

	public byte[] obtenerPortadaPorId(int idArticulo) {
		byte[] imagen = null; 
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();
			
			imagen = (byte[])sesion.createQuery("Select a.foto From Articulo a Where a.idArticulos=:id")
					.setParameter("id", idArticulo).uniqueResult();
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		return imagen; 
	}

	public void borrar(String codigo) {
		
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			
			sesion.createQuery("DELETE FROM Articulo WHERE codigo=:clave")
					.setParameter("clave", codigo)
					.executeUpdate();
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public Articulo obtenerArticuloPorCodigo(String codigo) {
		System.out.println("Entro en el metodo obtener");

		Articulo a = null; 
		System.out.println("Creamos la sesion");
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			System.out.println("Entremos en el try");
			a = (Articulo)sesion.createQuery("FROM Articulo a WHERE a.codigo=:clave")
					.setParameter("clave", codigo)
					.uniqueResult();

			System.out.println("SALIMOS" + a);
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		return a;
	}

	public void actualizar(String nombre, String descripcion, float precio, ByteArrayOutputStream os, String codigo) {
		System.out.println("Entro en el metodo Actualizar");
		
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			System.out.println("Entro en la asesion");
			if(os != null) {
				System.out.println("Entro en el if");

				sesion.createQuery("UPDATE Articulo SET nombre=:n,  descripcion=:d, precio=:p, foto=:f WHERE codigo=:clave")
					.setParameter("n", nombre)
					.setParameter("d", descripcion)
					.setParameter("p", precio)
					.setParameter("f", os.toByteArray())
					.setParameter("clave", codigo)
					.executeUpdate();
			}else {
				System.out.println("Entro en el else");

				sesion.createQuery("UPDATE Articulo SET nombre=:n,  descripcion=:d, precio=:p WHERE codigo=:clave ")
				.setParameter("n", nombre)
				.setParameter("d", descripcion)
				.setParameter("p", precio)
				.setParameter("clave", codigo)
				.executeUpdate();
			}
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public void insertar(Articulo a) {
		
		Session sesion = SessionProvider.getSession();
		
		try {
			System.out.println("entramos en try ");
			sesion.beginTransaction();
			System.out.println("antes de guardar");

			sesion.save(a);
			
			System.out.println("despues de guardar");
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

}
