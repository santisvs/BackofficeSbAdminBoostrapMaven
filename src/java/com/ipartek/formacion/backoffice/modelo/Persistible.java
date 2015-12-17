package com.ipartek.formacion.backoffice.modelo;

import java.sql.SQLException;
import java.util.List;

/**
 * Interfaz para dar la habilidad de que sean Persistibles los DAO´s<br>
 * Se encarga de que se implementen las operaciones más básicas de CRUD
 * 
 * @param
 * 			<P>
 *            Clase generica la que luego sustituimos por nuestra clase
 *            concreta, por ejemplo la clase <code>Persona</code>.
 * 
 * @author Curso
 * 
 *
 */

public interface Persistible<P> {

	/**
	 * Listado de todos los objetos de la consulta ordenado por id descendente y
	 * limitado a 500.
	 * 
	 * @return {@code List<P>} si existen datos, en caso contrario {@code List}
	 *         inicializada
	 * @throws SQLException 
	 */
	List<P> getAll() throws SQLException;

	/**
	 * Busca un objeto en la tabla por su identificador
	 * 
	 * @param id
	 *            {@code int} indentificador del objeto
	 * @return Objeto generico, {@code null} si no existe
	 * @throws SQLException 
	 */
	P getById(int id) throws SQLException;

	/**
	 * Elimina objeto de la tabla
	 * 
	 * @param id
	 *            {@code int} indentificador del objeto
	 * @return true si elimina, false en caso contrario
	 * @throws SQLException 
	 */
	boolean delete(int id) throws SQLException;

	/**
	 * Modifica el objeto solicitado
	 * 
	 * @param persistable
	 *            {@code P} Objeto con valores a modificar
	 * @return true si modifica, false en caso contrario
	 * @throws SQLException 
	 */
	boolean update( P persistable) throws SQLException;

	/**
	 * Inserta un nuevo objeto
	 * 
	 * @param persistable
	 *            {@code P} Objeto a insertar
	 * @return {@code} identificador del objeto insertado, -1 en caso contrario
	 * @throws SQLException 
	 */
	int insert(P persistable) throws SQLException;
}
