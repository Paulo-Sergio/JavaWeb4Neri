package br.com.sistemaweb.servlets.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.sistemaweb.dao.UsuarioDAO;
import br.com.sistemaweb.javabean.model.Usuario;

@WebServlet("/ListarUsuarios")
public class ListarUsuarios extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String numPagina = req.getParameter("num-pagina");
		if (numPagina == null) {
			numPagina = "1";
		}
		
		try {
			List<Usuario> listaUsuarios = new UsuarioDAO().getListaUsuariosPaginada(Integer.parseInt(numPagina));
			int qtdTotalRegistros = new UsuarioDAO().totalDeRegistros();

			req.setAttribute("listaUsuarios", listaUsuarios);
			req.setAttribute("qtdTotalRegistros", qtdTotalRegistros);
			req.getRequestDispatcher("/listausuarios.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
