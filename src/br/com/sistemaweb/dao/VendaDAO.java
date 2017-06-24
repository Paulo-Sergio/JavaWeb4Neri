package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.Venda;

public class VendaDAO {

	private Connection connection;

	public VendaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public int totalDeRegistros(String pesquisa, String campoPesquisa) throws SQLException {
		String sql = "SELECT count(*) AS contaRegistros FROM venda ";
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

	public List<Venda> getListaVendasPaginada(int pagina, String ordenacao, String pesquisa, String campoPesquisa)
			throws SQLException {
		int limit = 10;
		int offset = (limit * pagina) - limit;
		String sql = "SELECT * FROM venda "
				+ "INNER JOIN cliente ON cliente.id = venda.id_cliente "
				+ "INNER JOIN itens_venda ON itens_venda.id_venda = venda.id "
				+ "INNER JOIN produtos ON produtos.id = itens_venda.id_produto "
				+ "GROUP BY venda.id";
		List<Venda> lista = new ArrayList<Venda>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Venda venda = new Venda();
				venda.setId(rs.getInt("id"));
				venda.setIdCliente(rs.getInt("id_cliente"));
				venda.setData(rs.getDate("data"));
				venda.setValorTotal(rs.getDouble("valortotal"));
				venda.setClienteNome(rs.getString("nome"));
				venda.setProdutoDescricao(rs.getString("descricao"));
				lista.add(venda);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public List<Venda> getListaVendasCombo() throws SQLException {
		String sql = "SELECT * FROM venda ORDER BY descricao";
		List<Venda> lista = new ArrayList<Venda>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Venda venda = new Venda();
				venda.setId(rs.getInt("id"));
				venda.setIdCliente(rs.getInt("id_cliente"));
				venda.setData(rs.getDate("data"));
				venda.setValorTotal(rs.getDouble("valortotal"));
				lista.add(venda);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public Venda getVenda(int id) throws SQLException {
		String sql = "SELECT * FROM venda WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Venda venda = new Venda();
				venda.setId(rs.getInt("id"));
				venda.setIdCliente(rs.getInt("id_cliente"));
				venda.setData(rs.getDate("data"));
				venda.setValorTotal(rs.getDouble("valortotal"));
				return venda;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return null;
	}

	public boolean excluirVenda(Venda venda) throws SQLException {
		String sql = "DELETE FROM venda WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, venda.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean alterarVenda(Venda venda) throws SQLException {
		String sql = "UPDATE venda SET id_cliente=?, data=?, valortotal=? WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, venda.getIdCliente());
			stmt.setDate(2, new Date(venda.getData().getTime()));
			stmt.setDouble(3, venda.getValorTotal());
			stmt.setInt(4, venda.getId());
			System.out.println(stmt.toString());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public Integer novoVenda(Venda venda) throws SQLException {
		String sql = "INSERT INTO venda (id_cliente, data, valortotal) VALUES (?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, venda.getIdCliente());
			stmt.setDate(2, new Date(venda.getData().getTime()));
			stmt.setDouble(3, venda.getValorTotal());

			int linhasAfetadas = stmt.executeUpdate();
			if(linhasAfetadas == 0){
				throw new SQLException("Inserção de venda falhou, não houve linhas afetadas");
			}
			
			ResultSet rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return null;
	}
}
