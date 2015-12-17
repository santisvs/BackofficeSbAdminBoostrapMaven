package com.ipartek.formacion.backoffice.pojo;

import java.sql.SQLData;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Persona {

	private int id;
	private String nombre;
	private String email;
	private String dni;
	private Timestamp fecha;
	private String pass;
	private String observaciones;
	
	/**
	 * Constructor Persona
	 * Inicializa todos los campos a blanco excepto:
	 * {@code Fecha} = {@code null}
	 * {@code id} = -1
	 */
	public Persona() {
		super();
		this.id = -1;
		this.nombre = "";
		this.email = "";
		this.dni = "";
		this.fecha = null;
		this.pass = "";
		this.observaciones = "";
	}
	
	
	
	public String getPass() {
		return pass;
	}



	public void setPass(String pass) {
		this.pass = pass;
	}



	public String getObservaciones() {
		return observaciones;
	}



	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}



	public  Timestamp getFecha() {
		return fecha;
	}
	

	public void setFecha( Timestamp fecha ) {
		this.fecha = fecha;
	}



	public String getDni() {
		return dni;
	}



	public void setDni(String dni) {
		this.dni = dni;
	}



	public String getEmail() {
		return email;
	}

	


	public void setEmail(String email) {
		this.email = email;
	}




	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getEdad(){
		
		return fecha.getYear() - Calendar.YEAR;
	}

	@Override
	public String toString() {
		return "Persona [id=" + id + ", nombre=" + nombre + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Persona other = (Persona) obj;
		if (dni == null) {
			if (other.dni != null)
				return false;
		} else if (!dni.equals(other.dni))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (fecha == null) {
			if (other.fecha != null)
				return false;
		} else if (!fecha.equals(other.fecha))
			return false;
		if (id != other.id)
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
	
	
	
	
}
