package com.ipartek.formacion.backoffice.controladores;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.backoffice.modelo.PersonaDAO;
import com.ipartek.formacion.backoffice.pojo.Persona;

/**
 * Servlet implementation class UsuarioServlet
 */
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static PersonaDAO daoPersona;
	private static String pId; 	//parametro Identificador del Usuario
	private static RequestDispatcher dispatch;
	
	public static final String VISTA_USUARIOS_LISTAR = "pages/usuarios.jsp";
	public static final String VISTA_USUARIOS_DETALLE = "pages/usuarioDetalle.jsp";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			daoPersona = new PersonaDAO();
			//recoger parametros
			pId = request.getParameter("id");
			
			//Bifurcaci�n del diagrama de flujo (Determinar operacion)
			if(pId != null){
				detalle(request);	//funcion privada
			}else{
				listar(request);	//funcion privada
			}
			
			dispatch.forward(request, response);
			
		}catch (Exception e){
			//TODO mejor en un log
			e.printStackTrace();
			
			//TODO ir a p�gina error 404.jsp o 500.jsp
		}
		
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	
	/**
	 * METODOS PRIVADOS
	 * Los utilizamos para organizar el c�digo del doGet y doPost
	 * @param request
	 * @throws SQLException 
	 */
	private void detalle(HttpServletRequest request) throws SQLException {
		
		int id = Integer.parseInt(pId);
		//Llamar modelo para obtener la persona
		Persona p = daoPersona.getById(id);
		
		//Guardar lista como atributo en request
		request.setAttribute("usuario", p);
		
		//Peticion interna a la JSP (llamada interna utilizando request)
		dispatch = request.getRequestDispatcher(VISTA_USUARIOS_DETALLE);
		
	}

	private void listar(HttpServletRequest request) throws SQLException {
		//Llamar modelo para obtener listado
		ArrayList<Persona> listaUsuarios = (ArrayList<Persona>) daoPersona.getAll();
		
		//Guardar lista como atributo en request
		request.setAttribute("listaUsuarios", listaUsuarios);
		
		//Peticion interna a la JSP (llamada interna utilizando request)
		dispatch = request.getRequestDispatcher(VISTA_USUARIOS_LISTAR);
	}
	

}
