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

@WebServlet("/AlterarUsuario")
public class AlterarUsuario extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usuarioNome = req.getParameter("usuario");
		try {
			Usuario usuario = new UsuarioDAO().getUsuario(usuarioNome);
			req.setAttribute("usuario", usuario);
			req.getRequestDispatcher("alterarusuario.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usuario = req.getParameter("usuario");
		String senha = req.getParameter("senha");
		String nivel = req.getParameter("nivel");
		String nomecompleto = req.getParameter("nomecompleto");

		Usuario usu = new Usuario();
		usu.setUsuario(usuario);
		usu.setSenha(senha);
		usu.setNivel(Integer.parseInt(nivel));
		usu.setNomeCompleto(nomecompleto);

		UsuarioDAO usuDAO = new UsuarioDAO();
		try {
			if (usuDAO.alterarUsuario(usu)) {
				req.setAttribute("mensagemAlteracao", "Usu�rio alterado com sucesso");
				req.getRequestDispatcher("/ListarUsuarios").forward(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}

}
