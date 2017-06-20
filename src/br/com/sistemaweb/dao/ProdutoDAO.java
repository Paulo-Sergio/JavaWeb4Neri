package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.Produto;

public class ProdutoDAO {

	private Connection connection;
	
	public ProdutoDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public int totalDeRegistros(String pesquisa, String campoPesquisa) throws SQLException {
		String sql = "SELECT count(*) AS contaRegistros FROM produtos WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%'";
		int totalRegistros = 0;
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				totalRegistros = rs.getInt("contaRegistros");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return totalRegistros;
	}

	public List<Produto> getListaProdutosPaginada(int pagina, String ordenacao, String pesquisa, String campoPesquisa)
			throws SQLException {
		int limit = 10;
		int offset = (limit * pagina) - limit;
		String sql = "SELECT * FROM produtos WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%' ORDER BY " + ordenacao
				+ " LIMIT 10 OFFSET " + offset;
		List<Produto> lista = new ArrayList<Produto>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setIdCategoria(rs.getInt("id_categoria"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setQtdEstoque(rs.getInt("descricao"));
				produto.setPrecoCusto(rs.getDouble("precocusto"));
				produto.setPercLucro(rs.getInt("preclucro"));
				produto.setPrecoVenda(rs.getDouble("precovenda"));
				produto.setDataCadastro(rs.getDate("datacadastro"));
				produto.setDataVenda(rs.getDate("datavenda"));
				
				lista.add(produto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}
	
	public List<Produto> getListaProdutosCombo()
			throws SQLException {
		String sql = "SELECT * FROM produtos ORDER BY descricao";
		List<Produto> lista = new ArrayList<Produto>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setIdCategoria(rs.getInt("id_categoria"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setQtdEstoque(rs.getInt("qtdEstoque"));
				produto.setPrecoCusto(rs.getDouble("precocusto"));
				produto.setPercLucro(rs.getInt("perclucro"));
				produto.setPrecoVenda(rs.getDouble("precovenda"));
				produto.setDataCadastro(rs.getDate("datacadastro"));
				produto.setDataVenda(rs.getDate("datavenda"));
				
				lista.add(produto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}
	
	public Produto getProduto(int id) throws SQLException {
		String sql = "SELECT * FROM produtos WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setIdCategoria(rs.getInt("id_categoria"));
				produto.setDescricao(rs.getString("descricao"));
				produto.setQtdEstoque(rs.getInt("descricao"));
				produto.setPrecoCusto(rs.getDouble("precocusto"));
				produto.setPercLucro(rs.getInt("preclucro"));
				produto.setPrecoVenda(rs.getDouble("precovenda"));
				produto.setDataCadastro(rs.getDate("datacadastro"));
				produto.setDataVenda(rs.getDate("datavenda"));
				return produto;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return null;
	}

	public boolean excluirProduto(Produto produto) throws SQLException {
		String sql = "DELETE FROM produtos WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, produto.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean alterarProduto(Produto produto) throws SQLException {
		String sql = "UPDATE produtos SET id_categoria=?, descricao=?, qtdestoque=?, precocusto=?, perclucro=?, precovenda=?, datacadastro=?, datavenda=? WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, produto.getIdCategoria());
			stmt.setString(2, produto.getDescricao());
			stmt.setInt(3, produto.getQtdEstoque());
			stmt.setDouble(4, produto.getPrecoCusto());
			stmt.setInt(5, produto.getPercLucro());
			stmt.setDouble(6, produto.getPrecoVenda());
			stmt.setDate(7, new Date(produto.getDataCadastro().getTime()));
			stmt.setDate(8, new Date(produto.getDataVenda().getTime()));
			stmt.setInt(9, produto.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean novoProduto(Produto produto) throws SQLException {
		String sql = "INSERT INTO produtos (descricao) VALUES (?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, produto.getIdCategoria());
			stmt.setString(2, produto.getDescricao());
			stmt.setInt(3, produto.getQtdEstoque());
			stmt.setDouble(4, produto.getPrecoCusto());
			stmt.setInt(5, produto.getPercLucro());
			stmt.setDouble(6, produto.getPrecoVenda());
			stmt.setDate(7, new Date(produto.getDataCadastro().getTime()));
			stmt.setDate(8, new Date(produto.getDataVenda().getTime()));
			stmt.setInt(9, produto.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}
}
