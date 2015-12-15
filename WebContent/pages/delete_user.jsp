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
                    </div><!-- /.panel-heading -->
                        
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                	
                                	<div class="row">
                                		<div class="col-sm-6">
                                			<div class="dataTables_length" id="dataTables-example_length">
                                				<label>Show entries</label>
                                					<select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
                                						<option value="10">10</option>
                                						<option value="25">25</option>
                                						<option value="50">50</option>
                                						<option value="100">100</option>
                                					</select> 
                                			</div>
                                		</div>
                                		<div class="col-sm-6">
                                			<div id="dataTables-example_filter" class="dataTables_filter">
                                				<label>Search:
                                					<input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example">
                                				</label>
                                			</div>
                                		</div>
                                	</div><!-- row -->
                                	
                                	<div class="row">
                                		<div class="col-sm-12">
                                			<table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid" aria-describedby="dataTables-example_info">
                                    			
                                    			<thead>
                                        			<tr role="row">
                                        				<th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column descending" style="width: 154px;" aria-sort="ascending">
                                        					Nombre
                                        				</th>
                                        				<th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 183px;">
                                        					Apellido
                                        				</th>
                                        				<th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 166px;">
                                        					Correo
                                        				</th>
                                        				<th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 133px;">
                                        					Cursos
                                        				</th>
                                        				
                                        			</tr>
                                    			</thead>
                                    			
                                    			<tbody>
                                    				<tr class="gradeA odd" role="row">
                                            			<td class="sorting_1">Santiago</td>
                                            			<td>Vallejo</td>
                                            			<td>santi07@gmail.com</td>
                                            			<td class="center">JAVA EE</td>
                                            			<td class="center">
                                                    			<input type="checkbox" value="">
                                            			</td>
                                        			</tr>
                                        			<tr class="gradeA odd" role="row">
                                            			<td class="sorting_1">Santiago</td>
                                            			<td>Vallejo</td>
                                            			<td>santi07@gmail.com</td>
                                            			<td class="center">JAVA EE</td>
                                            			<td class="center">A</td>
                                        			</tr>
                                        			<tr class="gradeA odd" role="row">
                                            			<td class="sorting_1">Santiago</td>
                                            			<td>Vallejo</td>
                                            			<td>santi07@gmail.com</td>
                                            			<td class="center">JAVA EE</td>
                                            			<td class="center">A</td>
                                        			</tr>
                                        			<tr class="gradeA odd" role="row">
                                            			<td class="sorting_1">Santiago</td>
                                            			<td>Vallejo</td>
                                            			<td>santi07@gmail.com</td>
                                            			<td class="center">JAVA EE</td>
                                            			<td class="center">A</td>
                                        			</tr>
                                        			<tr class="gradeA odd" role="row">
                                            			<td class="sorting_1">Santiago</td>
                                            			<td>Vallejo</td>
                                            			<td>santi07@gmail.com</td>
                                            			<td class="center">JAVA EE</td>
                                            			<td class="center">A</td>
                                        			</tr>
                                        		</tbody>
                                			</table>
                                		</div><!-- col-sm-12 -->
                                	</div><!-- row -->
                                	
                                	<div class="row">
                                		<div class="col-sm-6">
                                			<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">
                                				Showing 1 to 10 of 57 entries
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
                                					<li class="paginate_button " aria-controls="dataTables-example" tabindex="0">
                                						<a href="#">2</a>
                                					</li>
                                					<li class="paginate_button " aria-controls="dataTables-example" tabindex="0">
                                						<a href="#">3</a>
                                					</li>
                                					<li class="paginate_button " aria-controls="dataTables-example" tabindex="0">
                                						<a href="#">4</a>
                                					</li>
                                					<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                						<a href="#">Next</a>
                                					</li>
                                				</ul>
                                			</div>
                                		</div>
                                	</div><!-- row -->
                                	
                                </div><!-- dataTables-example_wrapper -->
                            </div><!-- dataTable_wrapper -->
                		</div><!-- panel-body -->  
            	</div><!-- panel panel-default -->
        	</div><!-- row -->
        

<%@include file="../includes/footer.jsp" %>
