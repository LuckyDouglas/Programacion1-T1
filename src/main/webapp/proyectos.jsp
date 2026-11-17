	<%@page import="entidades.Proyecto"%>
	<%@page import="java.util.List"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="es">
	<head>
	    <meta charset="UTF-8">
	    <title>Registrar Proyectos de Inversión Pública</title>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    <style>
	        body { background-color: #f5f6f7;}
	        .card { border-radius: 10px; }
	        .btn-group-custom button { margin-right: 5px; }
	    </style>
	</head>
	<body>
	
	<div class="container mt-5">
	    <div class="row">
			
	        <!-- FORMULARIO -->
	        <div class="col-md-4">
	            <div class="card p-4 shadow-sm">
	                <h4 class="mb-3">Registrar Proyectos</h4>
	                
					<!-- MENSAJE DE ERROR -->
					<% String error = (String) request.getAttribute("error");
   					if(error != null) { %>
   					<div class="alert alert-danger" role="alert">
      				  <%= error %>
  					  </div>
					<% } %>
					<!-- ---------------- -->
					
	                <form method="post" action="ProyectoServlet">
	                    <div class="mb-3">
	                        <label class="form-label">Nombre del Proyecto</label>
	                        <input name="nombre" type="text" class="form-control">
	                    </div>
	
	                    <div class="mb-3">
	                        <label class="form-label">Descripción técnica del Proyecto (Opcional)</label>
	                        <textarea name="descripcion" class="form-control"></textarea>
	                    </div>
	
	                    <div class="mb-3">
	                        <label class="form-label">Fecha inicio del Proyecto</label>
	                        <input name="fechaInicio" type="date" class="form-control">
	                    </div>
	
	                    <div class="mb-3">
	                        <label class="form-label">Fecha de culminación del Proyecto</label>
	                        <input name="fechaFin" type="date" class="form-control">
	                    </div>
	
						<div class="mb-3">
	                        <label class="form-label">Asesor técnico del Proyecto(Nombre y apellidos)</label>
	                        <input name="asesorTecnico" type="text" class="form-control">
	                    </div>
	
						<div class="mb-3">
	                        <label class="form-label">Presupuesto asignado</label>
	                        <input name="presupuesto" type="number" step="0.01" class="form-control">
	                    </div>
	
	                    <div class="btn-group-custom">
	                        <button type="submit" class="btn btn-primary">Registrar</button>
	                        <button type="button" class="btn btn-primary">Actualizar</button>
	                        <button type="button" class="btn btn-warning">Listar</button>
	                        <button type="button" class="btn btn-danger">Eliminar</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	
	        <!-- TABLA -->
	        <div class="col-md-8">
	            <div class="card p-4 shadow-sm">
	                <h4 class="mb-3">Proyectos Disponibles</h4>
	
	                <table class="table table-hover">
	                    <thead class="table-light">
	                        <tr>
	                            <th>Id</th>
	                            <th>Nombre del Proyecto</th>
	                            <th>Inicio</th>
	                            <th>Fin</th>
	                            <th>Asesor Técnico</th>
	                            <th>Presupuesto</th>
	                            <th>Acciones</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    
	                    <% 
	                    
	                    List<Proyecto> lista = (List<Proyecto>) request.getAttribute("proyectos");
	                    if(lista != null && !lista.isEmpty()) {
	                    		int contador = 1;
	                    		for(Proyecto s : lista) {
	                    %>
	                        <tr>
	                            <td><%= contador++ %></td>
	                            <td><%= s.getNombre() %></td>
	                            <td><%= s.getFechaInicio() %></td>
	                            <td><%= s.getFechaFin() %></td>
	                            <td><%= s.getAsesorTecnico() %></td>
	                            <td><%= s.getPresupuestoFormateado() %></td>
	                            <td>
	                                <button class="btn btn-sm btn-info">Información</button>
	                                <button class="btn btn-sm btn-danger">Eliminar</button>
	                            </td>
	                        </tr>
	                    <% 
	                    		}
	                    }
	                    %>
	                        
	                    </tbody>
	                </table>
	            </div>
	        </div>
	
	    </div>
	</div>
	
	</body>
	</html>