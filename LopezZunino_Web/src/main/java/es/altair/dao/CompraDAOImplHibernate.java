package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Compra;
import es.altair.bean.Usuario;
import es.altair.util.SessionProvider;

public class CompraDAOImplHibernate implements CompraDAO {

	public void insertar(Compra c) {
		Session sesion = SessionProvider.getSession();
		
		try {
			System.out.println("entramos en try ");
			sesion.beginTransaction();
			System.out.println("antes de guardar");

			sesion.createSQLQuery("INSERT INTO compra (fecha, cantidad, precio, idUsuario, idArticulo) values(:f, :c, :p, :u, :a) ")
				.setParameter("f", c.getFecha())
				.setParameter("c", c.getCantidad())
				.setParameter("p", c.getPrecio())
				.setParameter("u", c.getUsuario().getIdUsuarios())
				.setParameter("a", c.getArticulo().getIdArticulos())
				.executeUpdate();
			
			System.out.println("despues de guardar");
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	}

	public List<Compra> listarPorUsu(Usuario u) {
		List<Compra> compras = new ArrayList<Compra>();
		
		Session sesion = SessionProvider.getSession();
	
		try {
			System.out.println("entramos en try ");
			sesion.beginTransaction();
			System.out.println("antes de guardar");

			compras = sesion.createQuery("FROM Compra c WHERE usuario=:usu")
						.setParameter("usu", u).list();
			
			System.out.println("despues de guardar");
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return compras;
	}

	public void borrar(int idArticulo) {
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			
			sesion.createQuery("DELETE FROM Compra WHERE idcompra=:clave")
					.setParameter("clave", idArticulo)
					.executeUpdate();
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

}
