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

import br.com.sistemaweb.dao.BairroDAO;
import br.com.sistemaweb.javabean.model.Bairro;

/**
 * Servlet implementation class BairroServlet
 */
@WebServlet("/BairroServlet")
public class BairroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String id = request.getParameter("id");
		String descricao = request.getParameter("descricao");

		Bairro bairro = new Bairro();
		if (id != null)
			bairro.setId(Integer.parseInt(id));
		bairro.setDescricao(descricao);

		BairroDAO bairroDAO = new BairroDAO();

		RequestDispatcher dispatcher = null;

		// verificar qual é a ação
		String acao = request.getParameter("acao");
		if (acao == null)
			acao = "listar";

		if (acao.equals("listar")) {
			String pOrdenacao = request.getParameter("ordenacao");
			String pNumPagina = request.getParameter("numpagina");
			String pPesquisa = request.getParameter("pesquisa");
			String pCampoPesquisa = request.getParameter("campopesquisa");

			String numPagina = pNumPagina == null || pNumPagina == "" ? "1" : pNumPagina;
			String ordenacao = pOrdenacao == null ? "descricao" : pOrdenacao;
			String pesquisa = pPesquisa == null ? "" : pPesquisa;
			String campoPesquisa = pCampoPesquisa == null || pCampoPesquisa == "" ? "descricao" : pCampoPesquisa;

			List<Bairro> listaBairros = new BairroDAO().getListaBairrosPaginada(Integer.parseInt(numPagina), ordenacao, pesquisa,
					campoPesquisa);
			int qtdTotalRegistros = new BairroDAO().totalDeRegistros(pesquisa, campoPesquisa);
			request.setAttribute("listaBairros", listaBairros);
			request.setAttribute("qtdTotalRegistros", qtdTotalRegistros);
			dispatcher = request.getRequestDispatcher("/listabairros.jsp");

		} else if (acao.equals("excluir")) {
			if (bairroDAO.excluirBairro(bairro)) {
				request.setAttribute("mensagemExclusao", "Bairro " + id + " excluido com sucesso!");
				response.sendRedirect("BairroServlet");
			}

		} else if (acao.equals("alterar")) {
			if (request.getMethod().equals("GET")) {
				Bairro bairroParaAlterar = new BairroDAO().getBairro(Integer.parseInt(id));
				request.setAttribute("bairro", bairroParaAlterar);
				dispatcher = request.getRequestDispatcher("salvarbairro.jsp");

			} else if (request.getMethod().equals("POST")) {
				if (bairroDAO.alterarBairro(bairro)) {
					request.setAttribute("mensagemAlteracao", "Bairro alterado com sucesso");
					response.sendRedirect("BairroServlet");
				}
			}

		} else if (acao.equals("novo")) {
			if (request.getMethod().equals("GET")) {
				dispatcher = request.getRequestDispatcher("salvarbairro.jsp");

			} else if (request.getMethod().equals("POST")) {
				if (bairroDAO.novoBairro(bairro)) {
					request.setAttribute("mensagemInclusao", "Usuário " + id + " inserido com sucesso");
					response.sendRedirect("BairroServlet");
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
