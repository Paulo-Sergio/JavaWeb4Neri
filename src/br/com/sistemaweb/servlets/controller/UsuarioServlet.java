package br.com.sistemaweb.servlets.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.sistemaweb.dao.UsuarioDAO;
import br.com.sistemaweb.javabean.model.Usuario;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");
		String nivel = request.getParameter("nivel");
		String nomecompleto = request.getParameter("nomecompleto");

		Usuario usu = new Usuario();
		usu.setUsuario(usuario);
		usu.setSenha(senha);
		if (nivel != null)
			usu.setNivel(Integer.parseInt(nivel));
		usu.setNomeCompleto(nomecompleto);

		UsuarioDAO usuDAO = new UsuarioDAO();

		RequestDispatcher dispatcher = null;

		// verificar qual é a ação
		String acao = request.getParameter("acao");
		if (acao == null)
			acao = "listar";

		if (acao.equals("listar")) {
			String numPagina = request.getParameter("num-pagina");
			if (numPagina == null) {
				numPagina = "1";
			}
			List<Usuario> listaUsuarios = new UsuarioDAO().getListaUsuariosPaginada(Integer.parseInt(numPagina));
			int qtdTotalRegistros = new UsuarioDAO().totalDeRegistros();
			request.setAttribute("listaUsuarios", listaUsuarios);
			request.setAttribute("qtdTotalRegistros", qtdTotalRegistros);
			dispatcher = request.getRequestDispatcher("/listausuarios.jsp");

		} else if (acao.equals("excluir")) {
			if (usuDAO.excluirUsuario(usu)) {
				request.setAttribute("mensagemExclusao", "Usuário " + usuario + " excluido com sucesso!");
				// dispatcher =
				// request.getRequestDispatcher("/UsuarioServlet?acao=listar");
				response.sendRedirect("UsuarioServlet");
			}

		} else if (acao.equals("alterar")) {
			if (request.getMethod().equals("GET")) {
				Usuario usuParaAlterar = new UsuarioDAO().getUsuario(usuario);
				request.setAttribute("usuario", usuParaAlterar);
				dispatcher = request.getRequestDispatcher("salvarusuario.jsp");

			} else if (request.getMethod().equals("POST")) {
				if (usuDAO.alterarUsuario(usu)) {
					request.setAttribute("mensagemAlteracao", "Usuário alterado com sucesso");
					// dispatcher =
					// request.getRequestDispatcher("/UsuarioServlet?acao=listar");
					response.sendRedirect("UsuarioServlet");
				}
			}

		} else if (acao.equals("novo")) {
			if (request.getMethod().equals("GET")) {
				dispatcher = request.getRequestDispatcher("salvarusuario.jsp");

			} else if (request.getMethod().equals("POST")) {
				if (usuDAO.novoUsuario(usu)) {
					request.setAttribute("mensagemInclusao", "Usuário " + usuario + " inserido com sucesso");
					// dispatcher =
					// request.getRequestDispatcher("/UsuarioServlet?acao=listar");
					response.sendRedirect("UsuarioServlet");
				}
			}
		}

		if (dispatcher != null)
			dispatcher.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
