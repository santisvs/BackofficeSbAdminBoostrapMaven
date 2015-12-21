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
       
	private static int operacion;
	
	private static Mensaje msj;
	
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
			msj = null;
			
			//determinar operacion a realizar
			if (request.getParameter("op") != null ){
				operacion = Integer.parseInt(request.getParameter("op"));
			}else{
				operacion = ControladorConstantes.OP_LISTAR;
			}
			
			//Realizar accion
			switch (operacion) {
			
			case ControladorConstantes.OP_LISTAR:
				listar(request);
				break;
				
			case ControladorConstantes.OP_DETALLE:
				detalle(request);
				break;
				
			case ControladorConstantes.OP_NUEVO:
				nuevo(request);
				break;

			case ControladorConstantes.OP_ELIMINAR:
				eliminar(request);
				break;
				
			case ControladorConstantes.OP_MODIFICAR:
				modificar(request);
				break;
			}
			
			request.setAttribute("msj", msj);
			
			//servir la JSP
			dispatch.forward(request, response);
			
		}catch (Exception e){
			//TODO mejor en un log
			e.printStackTrace();
			
			//TODO ir a página error 404.jsp o 500.jsp
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
	 * Los utilizamos para organizar el código del doGet y doPost
	 * @param request
	 * @throws SQLException 
	 */
	
	
	private void detalle(HttpServletRequest request) throws SQLException {
		
		pId = request.getParameter("id");
		
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
	
	
	/**
	 * Nos lleva a la vista del formulario para crear una persona
	 * @param request
	 */
	private void nuevo(HttpServletRequest request) {
		//Creamos una persona nueva
		Persona p = new Persona();
		
		//Guardar lista como atributo en request
		request.setAttribute("usuario", p);
				
		//Peticion interna a la JSP (llamada interna utilizando request)
		dispatch = request.getRequestDispatcher(VISTA_USUARIOS_DETALLE);
		
	}

	private void eliminar(HttpServletRequest request) throws SQLException {
		pId = request.getParameter("id");
		int id = Integer.parseInt(pId);
		
		if (daoPersona.delete(id)) {
			msj = new Mensaje("Registro eliminado con exito", Mensaje.TIPO_SUCCESS);
		}else{
			msj = new Mensaje("Error: Registro no eliminado", Mensaje.TIPO_DANGER);
		}
		
		listar(request);
		
	}

	/**
	 * Modifica o crea una nueva persona
	 * @param request
	 * @throws SQLException 
	 */
	private void modificar(HttpServletRequest request) throws SQLException {

		//recoger parametros del formulario
		pId = request.getParameter("id");
		int id = Integer.parseInt(pId);
		
		String pNombre = request.getParameter("nombre");
		String pEmail = request.getParameter("email");
		String pDni = request.getParameter("dni");
		String pPass = request.getParameter("pass");
		String pObservaciones = request.getParameter("observaciones");
		
		
		//construir persona
		Persona p = new Persona();
		p.setId(id);
		p.setNombre(pNombre);
		p.setEmail(pEmail);
		p.setDni(pDni);
		p.setPass(pPass);
		p.setObservaciones(pObservaciones);
		
		//persistir en la bbdd
		if( p.getId() == -1 ){
			if (daoPersona.insert(p) != -1) {
				msj = new Mensaje("Usuario creado con éxito", Mensaje.TIPO_SUCCESS);
			}else{
				msj = new Mensaje("Error: Usuario no creado", Mensaje.TIPO_DANGER);
			}
		}else{
			if (daoPersona.update(p)) {
				msj = new Mensaje("Usuario modificado con éxito", Mensaje.TIPO_SUCCESS);
			}else{
				msj = new Mensaje("Error: Usuario no modificado", Mensaje.TIPO_DANGER);
			}
		}
		
		//listar
		listar(request);
		
	}
	
	

}
