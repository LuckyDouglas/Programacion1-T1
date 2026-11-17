package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import entidades.Proyecto;

@WebServlet("/ProyectoServlet")
public class ProyectoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Proyecto> listaProyectos = new ArrayList<>();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    try {
	        Proyecto proyecto = new Proyecto(
	            request.getParameter("nombre"),
	            request.getParameter("descripcion"),
	            request.getParameter("fechaInicio"),
	            request.getParameter("fechaFin"),
	            request.getParameter("asesorTecnico"),
	            request.getParameter("presupuesto")
	        );
	        listaProyectos.add(proyecto);

	    } catch (IllegalArgumentException e) {
	        request.setAttribute("error", e.getMessage());
	    }

	    request.setAttribute("proyectos", listaProyectos);
	    request.getRequestDispatcher("proyectos.jsp").forward(request, response);
	}

}
