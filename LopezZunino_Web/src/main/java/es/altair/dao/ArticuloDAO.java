package es.altair.dao;

import java.io.ByteArrayOutputStream;
import java.util.List;

import es.altair.bean.Articulo;

public interface ArticuloDAO {
	
	List<Articulo> listar();
	byte[] obtenerPortadaPorId(int idArticulo);
	void borrar(String codigo);
	Articulo obtenerArticuloPorCodigo(String codigo);
	void actualizar(String nombre, String descripcion, float precio, ByteArrayOutputStream os, String codigo);
	void insertar(Articulo a);
}
