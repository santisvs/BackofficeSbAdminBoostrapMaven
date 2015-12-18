<!-- directivas -->
<%@page import="com.ipartek.formacion.backoffice.pojo.Persona"%>
<%@include file="../includes/head.jsp" %>
<%@include file="../includes/nav.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Usuarios Detalle</h1>
                </div>
                <% 
                	//recoger "atributo" listado personas de la request
                    //getAttribute(Key) = getAttribute("lista") 
                    Persona usuario = (Persona) request.getAttribute("usuario");
                    if ( usuario == null ) {
                    	usuario = new Persona();
                    }
                %>
                <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-user fa-fw"></i><label><%=usuario.getNombre()%></label>
                            <div class="pull-right">
                            	
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="pages/add_user.jsp"><i class="fa fa-pencil fa-fw"></i> Modificar</a>
                                        </li>
                                        <li><a href="pages/delete_user.jsp"><i class="fa fa-times fa-fw"></i> Eliminar Usuario</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                                                
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                	<div class="form-group">
                                            <label>Dni</label><p class="form-control-static"><%=usuario.getDni()%></p>
                                            <label>Email</label><p class="form-control-static"><%=usuario.getEmail()%></p>
                                    </div>
                                	<div class="panel panel-default">
                        				<div class="panel-heading">
                            			<label>Observaciones</label>
                        				</div><!-- /.panel-heading -->
                        				<div class="panel-body">
                            				<p><%=usuario.getObservaciones()%></p>
                            		    </div><!-- /.panel-body -->
                    				</div>                    
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
