package es.altair.dao;

import java.util.List;

import es.altair.bean.Usuario;

public interface UsuarioDAO {

	Usuario comprobarUsuario(String login, String password);
	int insertar(Usuario usu);
	boolean validarEmail(Usuario usu);
	boolean validarlogin(Usuario usu);
	Usuario obtenerUsuarioPorLogin(String login);
	void actualizar(String nombre, String apellido, String telefono, String email, int tipo, String login, String password );
	List<Usuario> lista();
	void borrar(int idUsuario); 
}
