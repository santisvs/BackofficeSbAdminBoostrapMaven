<%@page import="com.ipartek.formacion.backoffice.controladores.Mensaje"%>
<%
	Mensaje msg = (Mensaje)request.getAttribute("msj");
    if (msg != null) {
%>
<div class="row">
	<div class="alert alert-<%=msg.getTipo()%> alert-dismissible" role="alet">
    	<button type="button" class="close" data-dismiss="alert">&times;</button>
  			<strong><%=msg.getTexto()%></strong>
		</div>
    </div>
<%
	}
%>