<!-- directivas -->
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.ipartek.formacion.backoffice.pojo.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.ipartek.formacion.backoffice.modelo.DbConnection"%>
<%@include file="../includes/head.jsp" %>
<%@include file="../includes/nav.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Usuarios</h1>
                </div>
                <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-user fa-fw"></i> Usuarios inscritos
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="pages/add_user.jsp"><i class="fa fa-plus fa-fw"></i> A�adir Usuario</a>
                                        </li>
                                        <li><a href="pages/delete_user.jsp"><i class="fa fa-minus fa-fw"></i> Eliminar Usuario</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="fa fa-filter fa-fw"></i> Filtro</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        conectarnos bbdd
                        <!-- Escribimos un scriplet -->
                        <%
                        	//podemos escribir java
                        	//Para realizar los import:
                        		//Poner cursor al final del nombre de la clase
                        		//pulsar CTRL+SPACE (automaticamente se importan las clases en las jsp)
                        	
                        	//Crear conexion
                        	DbConnection conex= new DbConnection();
                        	//Crear la consulta
                        	String sql = "select * from persona";
                        	//Creamos la consulta
                        	PreparedStatement ps = conex.getConnection().prepareStatement(sql);
                        	//Ejecutar la consulta
                        	ResultSet rs = ps.executeQuery();
                        	
                        	//ArrayList<Persona>
                        	ArrayList<Persona> lista = new ArrayList<Persona>();
                        	Persona p = null;
                        	
                        	//Iterar sobre los resultados
                        	while (rs.next()){
                        		p = new Persona();
                        		p.setId( rs.getInt("id") );
                        		p.setNombre( rs.getString("nombre") );
                        		p.setEmail( rs.getString("email"));
                        		p.setFecha(rs.getDate("fecha_nacimiento"));
                        		lista.add(p);
                        	}
                        
                        	out.print(lista);
                        %>
                                                
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Nombre</th>
                                                    <th>Email</th>
                                                    <th>A�os</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <% for (Persona persona : lista ) { %>
                                            	<tr>
                                                    <td><%=persona.getId()%></td>
                                                    <td><%=persona.getNombre()%></td>
                                                    <td><%=persona.getEmail()%></td>
                                                    <td><%=persona.getEdad()%></td>
                                                </tr>
                                            <% } //end foreach %>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-8">
                                    <div id="morris-bar-chart"></div>
                                </div>
                                <!-- /.col-lg-8 (nested) -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
            </div>
        </div>
        <!-- /#page-wrapper -->

<%@include file="../includes/footer.jsp" %>
