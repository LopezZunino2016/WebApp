package es.altair.bean;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="articulos")
public class Articulo {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idArticulos; 
	private String nombre; 
	private String descripcion; 
	private byte[] foto; 
	private float precio; 
	private String codigo;
	
	public Articulo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Articulo(String nombre, String descripcion, byte[] foto, float precio, String codigo) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.foto = foto;
		this.precio = precio;
		this.codigo = codigo;
	}

	public int getIdArticulos() {
		return idArticulos;
	}

	public void setIdArticulos(int idArticulos) {
		this.idArticulos = idArticulos;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	@Override
	public String toString() {
		return "Articulo [idArticulos=" + idArticulos + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ ", foto=" + Arrays.toString(foto) + ", precio=" + precio + ", codigo=" + codigo + "]";
	} 
	
	
	
}
