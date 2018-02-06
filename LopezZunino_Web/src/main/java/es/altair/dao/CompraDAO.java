package es.altair.dao;

import java.util.List;

import es.altair.bean.Compra;
import es.altair.bean.Usuario;

public interface CompraDAO {
	void insertar(Compra c);
	List<Compra> listarPorUsu(Usuario u);
	void borrar(int idArticulo);
}
