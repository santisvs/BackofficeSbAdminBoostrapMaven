package com.ipartek.formacion.backoffice.pojo;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Persona {

	private int id;
	private String nombre;
	private String email;
	private String dni;
	private Date fecha;
	
	
	public Persona() {
		super();
		this.id = -1;
		this.nombre = "";
		this.email = "";
		this.dni = "";
		this.fecha = new java.util.Date();
	}
	
	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
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
	
	
	
	
}
