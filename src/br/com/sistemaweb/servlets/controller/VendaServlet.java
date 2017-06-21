package br.com.sistemaweb.servlets.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.sistemaweb.dao.ClienteDAO;
import br.com.sistemaweb.dao.ProdutoDAO;
import br.com.sistemaweb.dao.VendaDAO;
import br.com.sistemaweb.javabean.model.Cliente;
import br.com.sistemaweb.javabean.model.Produto;
import br.com.sistemaweb.javabean.model.Venda;

/**
 * Servlet implementation class VendaServlet
 */
@WebServlet("/VendaServlet")
public class VendaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, ParseException {
		String id = request.getParameter("id");
		String idCliente = request.getParameter("idCliente");
		String data = request.getParameter("data");
		String valorTotal = request.getParameter("valorTotal");

		Venda venda = new Venda();
		if (id != null && id != "")
			venda.setId(Integer.parseInt(id));
		if (idCliente != null)
			venda.setIdCliente((Integer.parseInt(idCliente)));

		DateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
		if (data != null) {
			Date dtData = formatoData.parse(data);
			venda.setData(dtData);
		}
		if (valorTotal != null)
			venda.setValorTotal(Double.parseDouble(valorTotal));

		VendaDAO vendaDAO = new VendaDAO();

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

			List<Venda> listaVendas = new VendaDAO().getListaVendasPaginada(Integer.parseInt(numPagina), ordenacao, pesquisa,
					campoPesquisa);
			int qtdTotalRegistros = new VendaDAO().totalDeRegistros(pesquisa, campoPesquisa);
			request.setAttribute("listaVendas", listaVendas);
			request.setAttribute("qtdTotalRegistros", qtdTotalRegistros);
			dispatcher = request.getRequestDispatcher("/listavendas.jsp");

		} else if (acao.equals("excluir")) {
			if (vendaDAO.excluirVenda(venda)) {
				request.setAttribute("mensagemExclusao", "Venda " + id + " excluido com sucesso!");
				response.sendRedirect("VendaServlet");
			}

		} else if (acao.equals("alterar")) {
			preencherComboBox(request);
			if (request.getMethod().equals("GET")) {
				Venda vendaParaAlterar = new VendaDAO().getVenda(Integer.parseInt(id));

				request.setAttribute("venda", vendaParaAlterar);
				dispatcher = request.getRequestDispatcher("salvarvenda.jsp");

			} else if (request.getMethod().equals("POST")) {
				if (vendaDAO.alterarVenda(venda)) {
					request.setAttribute("mensagemAlteracao", "Venda alterada com sucesso");
					response.sendRedirect("VendaServlet");
				}
			}

		} else if (acao.equals("novo")) {
			preencherComboBox(request);
			if (request.getMethod().equals("GET")) {
				dispatcher = request.getRequestDispatcher("salvarvenda.jsp");

			} else if (request.getMethod().equals("POST")) {
				Integer idVenda = vendaDAO.novoVenda(venda);
				if (idVenda != null) {
					venda.setId(idVenda);
					request.setAttribute("venda", venda);
					dispatcher = request.getRequestDispatcher("salvarvenda.jsp");
				}
			}
		}

		if (dispatcher != null)
			dispatcher.forward(request, response);
	}

	private void preencherComboBox(HttpServletRequest request) throws SQLException {
		List<Cliente> listaClientesCombo = new ClienteDAO().getListaClientesCombo();
		List<Produto> listaProdutosCombo = new ProdutoDAO().getListaProdutosCombo();

		request.setAttribute("listaClientesCombo", listaClientesCombo);
		request.setAttribute("listaProdutosCombo", listaProdutosCombo);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

}
