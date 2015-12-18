package com.ipartek.formacion.backoffice.modelo;

import static org.junit.Assert.*;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;

import com.ipartek.formacion.backoffice.pojo.Persona;

public class PersonaDAOTest {

	static DbConnection db;
	static Connection conn;
	static PersonaDAO dao;
	static Persona pMock;
	static int id; // identificador de la última operacion realizada en el DAO

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		db = new DbConnection();
		conn = db.getConnection();
		conn.setAutoCommit(false);
		dao = new PersonaDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		conn.rollback();
		db.desconectar();
		db = null;
		dao = null;
	}

	@Before
	public void setUp() throws Exception {
		pMock = new Persona();
		pMock.setNombre("mock");
		pMock.setPass("999999");
		pMock.setDni("67786757G");
		pMock.setEmail("pMock@gmail.com");
		//pMock.setFecha(new Timestamp(new Date().getTime())); //Fecha inicializada en el constructor
		pMock.setObservaciones("Esto es una prueba");

		id = dao.insert(pMock);
		//pMock.setId(id);	//No hace falta esta operación porque esta implementada en el insert
		assertTrue("No se ha realizado la insercion", pMock.getId() > 0);
	}

	@After
	public void tearDown() throws Exception {
		assertTrue("No se pudo eliminar la persona insertada", dao.delete(id));
	}

	@Ignore
	public void testGetAll() {

		try{
			ArrayList<Persona> personas = (ArrayList<Persona>) dao.getAll();
			assertTrue("Deberia recuperar al menos una persona", personas.size() > 0);
		}catch(SQLException e){
			fail("Tenemos una cagada en la implementacion de nuestro DAO getAll: "+e.getMessage());
		}
	}

	@Test
	public void testGetById() {

		try {
			Persona p = dao.getById(id);
			assertTrue("No tienen los mismos atributos", pMock.equals(p));
		} catch (SQLException e) {
			fail("Tenemos una cagada en la implementacion de nuestro DAO getById: "+e.getMessage());
		}
		
		try {
			assertNull("No deberías existir",dao.getById(0));
		} catch (SQLException e) {
			fail("Tenemos una cagada en la implementacion de nuestro DAO getById: "+e.getMessage());
		}
		
	}

	@Ignore
	public void testDelete() {
		
		try {
			// comprobar caso de Id inexistente
			assertFalse("No se puede eliminar lo que no existe", dao.delete(0));
		} catch (SQLException e) {
			fail("Ha borrado un elemento con id = 0 delete: "+e.getMessage());
		}
	}

	@Ignore
	public void testUpdate() {
		String nombreNuevo = "pMockkk";
		//Modificamos el nombre del objeto pMock para actualizarlo en BBDD
		pMock.setNombre(nombreNuevo);
		try {
			assertTrue("el nombre de la persona no se ha modificado en BBDD", dao.update(pMock));
		} catch (SQLException e) {
			fail("Tenemos una cagada en la implementacion de nuestro DAO update: "+e.getMessage());
		}
		
		assertEquals(nombreNuevo, pMock.getNombre());
		
		//test null
		try {
			assertFalse("No modifica persona NULL",dao.update(null));
		} catch (Exception e) {
			fail("Tenemos una cagada en la implementacion de nuestro DAO update: "+e.getMessage());
		}
		
		//test no existe persona a modificar
		Persona pNoInsertada = new Persona();
		try {
			assertFalse("No modifica una persona que no existe", dao.update(pNoInsertada));
		} catch (SQLException e) {
			fail("Tenemos una cagada en la implementacion de nuestro DAO update: "+e.getMessage());
		}
		
	}

	@Ignore
	public void testInsert() {
		fail("Not yet implemented");
	}

}
