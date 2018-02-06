package es.altair.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="compra")
 public class Compra implements Serializable{
 
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 private int idcompra; 
	 
	 @Temporal(TemporalType.DATE)
	 private Date fecha;
	 private int cantidad; 
	 private float precio; 
	 
	 @ManyToOne(cascade=CascadeType.ALL)
	 @JoinColumn(name="idUsuario")
	 private Usuario usuario; 
	 
	 @ManyToOne(cascade=CascadeType.ALL)
	 @JoinColumn(name="idArticulo")
	 private Articulo articulo;

	public Compra() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Compra(Date fecha, int cantidad, float precio, Usuario usuario, Articulo articulo) {
		super();
		this.fecha = fecha;
		this.cantidad = cantidad;
		this.precio = precio;
		this.usuario = usuario;
		this.articulo = articulo;
	}

	public int getIdcompra() {
		return idcompra;
	}

	public void setIdcompra(int idcompra) {
		this.idcompra = idcompra;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Articulo getArticulo() {
		return articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	} 
	 
	 
}
