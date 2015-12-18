package com.ipartek.formacion.backoffice.modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ipartek.formacion.backoffice.pojo.Persona;

public class PersonaDAO implements Persistible<Persona>{

	/*
	 * (non-Javadoc)
	 * @see com.ipartek.formacion.backoffice.modelo.Persistible#getAll()
	 */
	
	@Override
	public List<Persona> getAll() throws SQLException {
		ArrayList<Persona> lista = new ArrayList<Persona>();
		
		//Crear conexion
    	DbConnection conn= new DbConnection();
    	//Crear la consulta
    	String sql = "select * from `persona` order by `id` desc limit 500;";
    	//Creamos la consulta
    	PreparedStatement pst = conn.getConnection().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS );
    	//Ejecutar la consulta
    	ResultSet rs = pst.executeQuery();
    	
    	while (rs.next()) {
			lista.add( mapeo(rs) );
		}
    	
    	//cerrar recursos en orden inversa
    	rs.close();
    	pst.close();
    	conn.desconectar();
		
		return lista;
	}

	/*
	 * (non-Javadoc)
	 * @see com.ipartek.formacion.backoffice.modelo.Persistible#getAll()
	 */
	
	@Override
	public Persona getById(int id) throws SQLException {
		Persona p = null;
		
		//Crear conexion
    	DbConnection conn= new DbConnection();
    	//Crear la consulta
    	String sql = "SELECT * FROM `persona` where `id`= ? ;";
    	//Creamos la consulta
    	PreparedStatement pst = conn.getConnection().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
    	pst.setInt(1, id);
    	//Ejecutar la consulta
    	ResultSet rs = pst.executeQuery();
    	while (rs.next()) {
    		p = mapeo(rs);
    	}
    	
    	//cerrar recursos en orden inversa
    	rs.close();
    	pst.close();
    	conn.desconectar();
		
		return p;
	}

	/*
	 * (non-Javadoc)
	 * @see com.ipartek.formacion.backoffice.modelo.Persistible#getAll()
	 */
	
	@Override
	public boolean delete(int id) throws SQLException {
		boolean resul = false;
		
		//Crear conexion
    	DbConnection conn= new DbConnection();
    	//Crear la consulta
    	String sql = "DELETE FROM `persona` WHERE `id` = ? ;";
    	//Creamos la consulta
    	PreparedStatement pst = conn.getConnection().prepareStatement(sql);
    	pst.setInt(1, id);
    	//Ejecutar la consulta
    	if ( pst.executeUpdate() == 1 ){
    		resul = true;
    	}
    	
    	//cerrar recursos en orden inversa
    	pst.close();
    	conn.desconectar();
    	
		return resul;
	}

	/*
	 * (non-Javadoc)
	 * @see com.ipartek.formacion.backoffice.modelo.Persistible#getAll()
	 */
	
	@Override
	public boolean update( Persona p) throws SQLException {
		boolean resul = false;
		
		if (p != null){
			//Crear conexion
	    	DbConnection conn= new DbConnection();
	    	//Crear la consulta
	    	String sql = "UPDATE `persona` SET `nombre`= ?, `dni`= ? WHERE  `id`= ? ;";
	    	//Creamos la consulta
	    	PreparedStatement pst = conn.getConnection().prepareStatement(sql);
	    	pst.setString(1, p.getNombre());
	    	pst.setString(2, p.getDni());
	    	pst.setInt(3, p.getId());
	    	//TODO Importante corregir el valor de id cuando incluyamos más valores
	    	
	    	//Ejecutar la consulta
	    	if ( pst.executeUpdate() == 1 ){
	    		resul = true;
	    	}
	    	
	    	//cerrar recursos en orden inversa
	    	pst.close();
	    	conn.desconectar();
		}
		return resul;
	}

	/*
	 * (non-Javadoc)
	 * @see com.ipartek.formacion.backoffice.modelo.Persistible#getAll()
	 */
	
	@Override
	public int insert(Persona p) throws SQLException {
		int resul = -1;
		
		//Crear conexion
    	DbConnection conn= new DbConnection();
    	//Crear la consulta
    	String sql = "INSERT INTO `persona` (`pass`, `nombre`, `dni`, `fecha_nacimiento`, `observaciones`, `email`) VALUES (?, ?, ?, ?, ?, ?);";
    	//Creamos la consulta
    	PreparedStatement pst = conn.getConnection().prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
    	pst.setString(1, p.getPass());
    	pst.setString(2, p.getNombre());
    	pst.setString(3, p.getDni());
    	pst.setTimestamp(4, p.getFecha());
    	pst.setString(5, p.getObservaciones());
    	pst.setString(6, p.getEmail());
    	
    	//Ejecutar la consulta
    	if ( pst.executeUpdate() == 1 ){
    		ResultSet generatedKeys = pst.getGeneratedKeys();
    		if (generatedKeys.next()){
    			p.setId(generatedKeys.getInt(1));
    			resul = p.getId();
    		}else{
    			throw new SQLException("Error al insertar la {@code Persona} p. El ID no se ha obtenido.");
    		}
    		
    	}
    	
    	//cerrar recursos en orden inversa
    	pst.close();
    	conn.desconectar();
		
		return resul;
	}

	
	/**
	 * Metodo propio de la clase.
	 * Mapear una fila de la entidad persona de la BBDD con un objeto {@code Persona}
	 * @param rs parametro de entrada ResultSet de una SQL SELECT
	 * @return Objeto {@code Persona}
	 * @throws SQLException
	 */
	Persona mapeo (ResultSet rs) throws SQLException{
		Persona p = new Persona();
		p.setId( rs.getInt("id") );
		p.setDni( rs.getString("dni") );
		p.setNombre( rs.getString("nombre") );
		p.setEmail( rs.getString("email"));
		//p.setFecha( rs.getTimestamp("fecha"));		//Error insertar TimeStamp
		p.setFecha(null);
		p.setPass( rs.getString("pass"));
		p.setObservaciones( rs.getString("observaciones") );
		return p;
		
	}
}
