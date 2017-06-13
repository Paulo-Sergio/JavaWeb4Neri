package br.com.sistemaweb.servlets.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.sistemaweb.dao.UsuarioDAO;
import br.com.sistemaweb.javabean.model.Usuario;

@WebServlet("/LogarServlet")
public class LogarServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usuarioNome = req.getParameter("usuario");
		String senha = req.getParameter("senha");

		UsuarioDAO usuDAO = new UsuarioDAO();

		try {
			Usuario usuario = usuDAO.getUsuario(usuarioNome, senha);
			if (usuario != null) {
				HttpSession sessao = req.getSession();
				sessao.setAttribute("sessaoUsuario", usuario);
				req.getRequestDispatcher("/index.jsp").forward(req, resp);
			} else {
				req.setAttribute("mensagem", "Usuário/Senha Incorretos");
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
