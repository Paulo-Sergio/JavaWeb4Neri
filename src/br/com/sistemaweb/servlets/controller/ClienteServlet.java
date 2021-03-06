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

import br.com.sistemaweb.dao.BairroDAO;
import br.com.sistemaweb.dao.CidadeDAO;
import br.com.sistemaweb.dao.ClienteDAO;
import br.com.sistemaweb.dao.LogradouroDAO;
import br.com.sistemaweb.javabean.model.Bairro;
import br.com.sistemaweb.javabean.model.Cidade;
import br.com.sistemaweb.javabean.model.Cliente;
import br.com.sistemaweb.javabean.model.Logradouro;

/**
 * Servlet implementation class ClienteServlet
 */
@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException, ParseException {
		String id = request.getParameter("id");
		String idBairro = request.getParameter("idBairro");
		String idLogradouro = request.getParameter("idLogradouro");
		String idCidade = request.getParameter("idCidade");
		String nome = request.getParameter("nome");
		String numero = request.getParameter("numero");
		String complemento = request.getParameter("complemento");
		String cep = request.getParameter("cep");
		String rg = request.getParameter("rg");
		String cpf = request.getParameter("cpf");
		String dataNascimento = request.getParameter("dataNascimento");
		String dataCadastro = request.getParameter("dataCadastro");
		String fonecel = request.getParameter("fonecel");
		String fone2 = request.getParameter("fone2");
		String email = request.getParameter("email");
		String foto = request.getParameter("foto");
		String sexo = request.getParameter("sexo");
		String obs = request.getParameter("obs");

		DateFormat fomatoData = new SimpleDateFormat("dd/MM/yyyy");

		Cliente cliente = new Cliente();
		if (id != null)
			cliente.setId(Integer.parseInt(id));
		if (idBairro != null)
			cliente.setIdBairro(Integer.parseInt(idBairro));
		if (idLogradouro != null)
			cliente.setIdLogradouro(Integer.parseInt(idLogradouro));
		if (idCidade != null)
			cliente.setIdCidade(Integer.parseInt(idCidade));
		cliente.setNome(nome);
		cliente.setNumero(numero);
		cliente.setComplemento(complemento);
		cliente.setCep(cep);
		cliente.setRg(rg);
		cliente.setCpf(cpf);
		if (dataNascimento != null) {
			Date dataNascimentoFomatada = fomatoData.parse(dataNascimento);
			cliente.setDataNascimento(dataNascimentoFomatada);
		}
		if (dataCadastro != null) {
			Date dataCadastroFomatada = fomatoData.parse(dataCadastro);
			cliente.setDataCadastro(dataCadastroFomatada);
		}
		cliente.setFonecel(fonecel);
		cliente.setFone2(fone2);
		cliente.setEmail(email);
		cliente.setFoto(foto);
		cliente.setSexo(sexo);
		cliente.setObs(obs);

		ClienteDAO clienteDAO = new ClienteDAO();

		RequestDispatcher dispatcher = null;

		// verificar qual � a a��o
		String acao = request.getParameter("acao");
		if (acao == null)
			acao = "listar";

		if (acao.equals("listar")) {
			String pOrdenacao = request.getParameter("ordenacao");
			String pNumPagina = request.getParameter("numpagina");
			String pPesquisa = request.getParameter("pesquisa");
			String pCampoPesquisa = request.getParameter("campopesquisa");

			String numPagina = pNumPagina == null || pNumPagina == "" ? "1" : pNumPagina;
			String ordenacao = pOrdenacao == null ? "nome" : pOrdenacao;
			String pesquisa = pPesquisa == null ? "" : pPesquisa;
			String campoPesquisa = pCampoPesquisa == null || pCampoPesquisa == "" ? "nome" : pCampoPesquisa;

			List<Cliente> listaClientes = new ClienteDAO().getListaClientesPaginada(Integer.parseInt(numPagina), ordenacao,
					pesquisa, campoPesquisa);
			int qtdTotalRegistros = new ClienteDAO().totalDeRegistros(pesquisa, campoPesquisa);
			
			request.setAttribute("listaClientes", listaClientes);
			request.setAttribute("qtdTotalRegistros", qtdTotalRegistros);
			dispatcher = request.getRequestDispatcher("/listaclientes.jsp");

		} else if (acao.equals("excluir")) {
			if (clienteDAO.excluirCliente(cliente)) {
				request.setAttribute("mensagemExclusao", "Cliente " + nome + " excluido com sucesso!");
				response.sendRedirect("ClienteServlet");
			}

		} else if (acao.equals("alterar")) {
			if (request.getMethod().equals("GET")) {
				Cliente clienteParaAlterar = new ClienteDAO().getCliente(Integer.parseInt(id));
				preencherCombosBox(request);
				request.setAttribute("cliente", clienteParaAlterar);
				dispatcher = request.getRequestDispatcher("salvarcliente.jsp");

			} else if (request.getMethod().equals("POST")) {
				if (clienteDAO.alterarCliente(cliente)) {
					request.setAttribute("mensagemAlteracao", "Cliente alterado com sucesso");
					response.sendRedirect("ClienteServlet");
				}
			}

		} else if (acao.equals("novo")) {
			if (request.getMethod().equals("GET")) {
				preencherCombosBox(request);
				dispatcher = request.getRequestDispatcher("salvarcliente.jsp");
				
			} else if (request.getMethod().equals("POST")) {
				if (clienteDAO.novoCliente(cliente)) {
					request.setAttribute("mensagemInclusao", "Cliente " + nome + " inserido com sucesso");
					response.sendRedirect("ClienteServlet");
				}
			}
		}

		if (dispatcher != null)
			dispatcher.forward(request, response);
	}

	private void preencherCombosBox(HttpServletRequest request) throws SQLException {
		List<Logradouro> listaLogradourosCombo = new LogradouroDAO().getListaLogradourosCombo();
		List<Bairro> listaBairrosCombo = new BairroDAO().getListaBairrosCombo();
		List<Cidade> listaCidadesCombo = new CidadeDAO().getListaCidadesCombo();
		
		request.setAttribute("listaLogradourosCombo", listaLogradourosCombo);
		request.setAttribute("listaBairrosCombo", listaBairrosCombo);
		request.setAttribute("listaCidadesCombo", listaCidadesCombo);
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
