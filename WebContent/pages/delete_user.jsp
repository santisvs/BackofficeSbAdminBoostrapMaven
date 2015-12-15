<%@include file="../includes/head.jsp" %>
<%@include file="../includes/nav.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Usuarios</h1>
                </div>
                <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-minus fa-fw"></i><i class="fa fa-user fa-fw"></i> Eliminar Usuario
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="pages/add_user.jsp"><i class="fa fa-plus fa-fw"></i> Añadir Usuario</a>
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
                        <!-- /.panel-heading -->
                        
                                          
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-8">
                                
	                                <div class="dataTables_length" id="dataTables-example_length">
		                                <label>Show 
		                                	<select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
				                                <option value="10">10</option>
				                                <option value="25">25</option>
				                                <option value="50">50</option>
				                                <option value="100">100</option>
		                                	</select> entries
		                                </label>
	                                </div>
	                                
	                                <div id="dataTables-example_filter" class="dataTables_filter">
	                                	<label>Search:
	                                		<input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example">
	                                	</label>
	                                </div>
                                
                                	<div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Nombre</th>
                                                    <th>Apellido</th>
                                                    <th>Curso</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Santiago</td>
                                                    <td>Vallejo</td>
                                                    <td>Java J2EE</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Santiago</td>
                                                    <td>Vallejo</td>
                                                    <td>Java J2EE</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>Santiago</td>
                                                    <td>Vallejo</td>
                                                    <td>Java J2EE</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>Santiago</td>
                                                    <td>Vallejo</td>
                                                    <td>Java J2EE</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>Santiago</td>
                                                    <td>Vallejo</td>
                                                    <td>Java J2EE</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                	</div><!-- /.table-responsive -->
                                    
                            </div><!-- /.col-lg-8 (nested) -->
                                
                            <div class="col-sm-6">
                            	<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
                            		Showing 1 to 57 of 57 entries
                            	</div>
                            </div>
                                
                                
                            <div class="col-sm-6">
                            	<div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                	<ul class="pagination">
                                		<li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                			<a href="#">Previous</a>
                                		</li>
                                		<li class="paginate_button active" aria-controls="dataTables-example" tabindex="0">
                                			<a href="#">1</a>
                                		</li>
                                		<li class="paginate_button next disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                			<a href="#">Next</a>
                                		</li>
                                	</ul>
                                </div>
                            </div><!-- /.col-sm-6 -->
                                
                                
                       		<div class="col-lg-8">
                            	<div id="morris-bar-chart"></div>
                            </div><!-- /.col-lg-8 (nested) -->
                    	</div><!-- /.row -->
                	</div><!-- /.panel-body -->
            	</div><!-- /panel panel-default -->
            </div>
        </div>
        

<%@include file="../includes/footer.jsp" %>
