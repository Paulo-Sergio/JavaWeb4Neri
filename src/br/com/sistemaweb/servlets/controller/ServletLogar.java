package br.com.sistemaweb.servlets.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.sistemaweb.javabean.model.Usuario;

@WebServlet("/ServletLogar")
public class ServletLogar extends HttpServlet {

	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usuarioNome = req.getParameter("usuario");
		String senha = req.getParameter("senha");

		Usuario usu = new Usuario();
		usu.setUsuario(usuarioNome);
		usu.setSenha(senha);

		if (usu.verifica()) {
			HttpSession sessao = req.getSession();
			sessao.setAttribute("sessaoUsuario", usuarioNome);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		} else {
			req.setAttribute("mensagem", "Usuário/senha incorretos");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

}
