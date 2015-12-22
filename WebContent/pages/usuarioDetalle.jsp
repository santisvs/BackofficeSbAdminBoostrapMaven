<!-- directivas -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.ipartek.formacion.backoffice.controladores.ControladorConstantes"%>
<%@page import="com.ipartek.formacion.backoffice.pojo.Persona"%>
<%@include file="../includes/head.jsp" %>
<%@include file="../includes/nav.jsp" %>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
        	<h1 class="page-header">Usuarios</h1>
        </div>
        <% 
        	//recoger "atributo" listado personas de la request
            //getAttribute(Key) = getAttribute("lista") 
            Persona usuario = (Persona) request.getAttribute("usuario");
            boolean isNew = (usuario.getId()==-1)?true:false;
        %>
        <form method="post" action="usuarios">
        	<div class="panel panel-default">
        		
        		<div class="panel-heading">
            	
                	<%if (isNew){ %>
                    	<i class="fa fa-user fa-fw"></i> Añadir Usuario
                        <div class="pull-right">
                        	<button type="submit" class="btn btn-default btn-xs">
                               	<i class="fa fa-plus fa-fw"></i> Crear Usuario          
                            </button>
                        </div><!-- <div class="pull-right"> -->
                	<%}else{%>
                    	<i class="fa fa-user fa-fw"></i> Usuario detalle
                        <div class="pull-right">
                         	<button type="submit" class="btn btn-default btn-xs">
                               	<i class="fa fa-pencil fa-fw"></i> Modificar Usuario          
                            </button>
                            <button type="button" class="btn btn-default btn-xs">
                               	<a href="usuarios?op=<%=ControladorConstantes.OP_ELIMINAR%>&id=<%=usuario.getId()%>" ><i class="fa fa-times fa-fw"></i> Eliminar Usuario</a>          
                            </button>
                        </div>
                     <%} %>
             	</div><!-- <div class="panel-heading"> -->
             
             	<div class="panel-body">
                    	<div class="row">
                        	
                        	<div class="col-lg-6"> 
                        			<div class="form-group">
                            			<label>Nombre</label>
                                			<input class="form-control" type="text" name="nombre" value="<%=usuario.getNombre()%>" placeholder="Escribe tu Nombre" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required >
                                		<br>
                                		<label>Email</label>
                                			<input class="form-control" type="email" name="email" value="<%=usuario.getEmail()%>" placeholder="Escribe tu email" required >
                                		<br>
                                		<label>Dni</label>
                                			<input class="form-control" type="text" name="dni" value="<%=usuario.getDni()%>" placeholder="Escribe tu dni" required >	
                                		<br>
                                		<label>Passw</label>
                                			<input class="form-control" type="text" name="pass" value="<%=usuario.getPass()%>" placeholder="Escribe tu password" required>	
    									<br>
                                		<label>Fecha nacimiento</label>
                                		<div class="row">
                                		<div class="col-lg-8">
            								<div class="input-group input-append date" id="dateRangePicker">
                								<input type="text" class="form-control" name="date" />
                									<span class="input-group-addon add-on"><span class="fa fa-calendar fa-fw"></span></span>
            								</div>
            								</div>
                                		</div>
                                		<script>
	$(document).ready(function() {
    $('#dateRangePicker')
        .datepicker({
            format: 'mm/dd/yyyy',
            startDate: '01/01/2010',
            endDate: '12/30/2020'
        })
        .on('changeDate', function(e) {
            // Revalidate the date field
            $('#dateRangeForm').formValidation('revalidateField', 'date');
        });

    $('#dateRangeForm').formValidation({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            date: {
                validators: {
                    notEmpty: {
                        message: 'The date is required'
                    },
                    date: {
                        format: 'MM/DD/YYYY',
                        min: '01/01/2010',
                        max: '12/30/2020',
                        message: 'The date is not a valid'
                    }
                }
            }
        }
    });
});
</script>
                                		
                                		
                                		
                            		</div>
                        	</div><!-- <div class="col-lg-8">  -->
                        	               			               		
                			<div class="col-lg-12"> 
                            	<label>Observaciones</label>
                        			<textarea class="form-control" rows="5" name="observaciones" >
                        				<%=usuario.getObservaciones()%>
                        			</textarea>
                			</div><!-- <div class="col-lg-12"> -->
                			
                			<input type="hidden" name="id" value="<%=usuario.getId()%>">
                			<input type="hidden" name="op" value="<%=ControladorConstantes.OP_MODIFICAR%>">
                			
                			
                		</div><!-- <div class="row"> -->
                </div><!-- <div class="panel-body"> -->
      		
      		</div><!-- <div class="panel panel-default"> -->  
        </form>                   
	</div><!-- <div class="row"> -->
</div><!-- <div id="page-wrapper"> --> 

<%@include file="../includes/footer.jsp" %>
