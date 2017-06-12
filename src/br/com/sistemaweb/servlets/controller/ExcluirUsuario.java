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

@WebServlet("/ExcluirUsuario")
public class ExcluirUsuario extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usuario = req.getParameter("usuario");

		Usuario usu = new Usuario();
		usu.setUsuario(usuario);
		UsuarioDAO usuDAO = new UsuarioDAO();
		try {
			if (usuDAO.excluirUsuario(usu)) {
				req.setAttribute("mensagemExclusao", "Usuário " + usuario + " excluido com sucesso!");
				req.getRequestDispatcher("/ListarUsuarios").forward(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
