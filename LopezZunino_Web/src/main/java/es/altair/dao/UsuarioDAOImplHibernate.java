package es.altair.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

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
}