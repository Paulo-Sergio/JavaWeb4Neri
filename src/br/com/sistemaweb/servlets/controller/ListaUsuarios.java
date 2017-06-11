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

@WebServlet("/ListaUsuarios")
public class ListaUsuarios extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UsuarioDAO usuDAO = new UsuarioDAO();
		try {
			List<Usuario> listaUsuarios = usuDAO.getListaUsuarios();
			req.setAttribute("listaUsuarios", listaUsuarios);
			req.getRequestDispatcher("listausuarios.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
