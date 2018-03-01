package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import es.altair.bean.Articulo;
import es.altair.bean.Usuario;
import es.altair.util.SessionProvider;

public class UsuarioDAOImplHibernate implements UsuarioDAO {

	private String pass = "Articulo123$%";

	public Usuario comprobarUsuario(String login, String password) {

		Usuario usu = null;

		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usu = (Usuario) sesion
					.createQuery(
							"SELECT u FROM Usuario u WHERE login=:l " + "AND password=AES_ENCRYPT(:p, :passphrase)")
					.setParameter("l", login)
					.setParameter("p", password)
					.setParameter("passphrase", pass)
					.uniqueResult();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}

		return usu;
	}

	public int insertar(Usuario usu) {

		int filas = 0;

		Session sesion = SessionProvider.getSession();

		try {
			sesion.beginTransaction();

			filas = sesion
					.createSQLQuery("INSERT INTO usuarios (nombre, apellido,telefono,email,tipo,login,password)"
							+ "values (:n , :a, :t, :e ,:ti , :l ,AES_ENCRYPT(:p, :passphrase))")
					.setParameter("n", usu.getNombre()).setParameter("a", usu.getApellido())
					.setParameter("t", usu.getTelefono()).setParameter("e", usu.getEmail())
					.setParameter("ti", usu.getTipo()).setParameter("l", usu.getLogin())
					.setParameter("p", usu.getPassword()).setParameter("passphrase", pass).executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return filas;

	}

	public boolean validarEmail(Usuario usu) {

		boolean correcto = true;

		Session sesion = SessionProvider.getSession();

		try {
			sesion.beginTransaction();

			Usuario u = (Usuario) sesion.createQuery("From Usuario Where email=:e").setParameter("e", usu.getEmail())
					.uniqueResult();

			System.out.println("USUARIO: " + u);

			if (u != null)
				correcto = false;

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		return correcto;

	}

	public boolean validarlogin(Usuario usu) {
		boolean correcto = true;

		Session sesion = SessionProvider.getSession();

		try {
			sesion.beginTransaction();
			if ((Usuario) sesion.createQuery("From Usuario Where login=:l").setParameter("l", usu.getLogin())
					.uniqueResult() != null)
				correcto = false;
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}

		return correcto;

	}

	public Usuario obtenerUsuarioPorLogin(String login) {
		Usuario u = null;
		
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			
			u = (Usuario)sesion.createQuery("FROM usuario u WHERE u.login=:clave")
					.setParameter("clave", login)
					.uniqueResult();
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
		return u;
	}

	public void actualizar(String nombre, String apellido, String telefono, String email, int tipo, String login,
			String password) {
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			System.out.println("Entro en la asesion");
			
			sesion.createQuery("UPDATE Usuario SET nombre=:n, apellido=:a, telefono=:t, email=:e, tipo=:ti, login=:l, password=:pas")
				.setParameter("n", nombre)
				.setParameter("a", apellido)
				.setParameter("t", telefono)
				.setParameter("e", email)
				.setParameter("ti", tipo)
				.setParameter("l", login)
				.setParameter("pas", password)
				.executeUpdate();



			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
	}

	public List<Usuario> lista() {
		List<Usuario> usuarios = new ArrayList<Usuario>(); 
		
		Session sesion = SessionProvider.getSession();
		try {
			sesion.beginTransaction();

			usuarios = sesion.createQuery("FROM Usuario u ")
					.list(); 

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
			// sf.close();
		}
		
		return usuarios;
	}

	public void borrar(int idUsuario) {
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			
			sesion.createSQLQuery("DELETE FROM Usuarios WHERE idUsuarios=:clave")
					.setParameter("clave", idUsuario)
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