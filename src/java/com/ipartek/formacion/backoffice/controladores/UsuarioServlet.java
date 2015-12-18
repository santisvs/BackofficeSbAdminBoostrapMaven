package com.ipartek.formacion.backoffice.controladores;

import java.io.IOException;
import java.util.ArrayList;

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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			//Llamar modelo para obtener listado
			daoPersona = new PersonaDAO();
			ArrayList<Persona> listaUsuarios = (ArrayList<Persona>) daoPersona.getAll();
			
			//Guardar lista como atributo en request
			request.setAttribute("listaUsuarios", listaUsuarios);
			
			//Peticion interna a la JSP (llamada interna utilizando request)
			request.getRequestDispatcher("pages/usuarios.jsp").forward(request, response);
			
			
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

}
