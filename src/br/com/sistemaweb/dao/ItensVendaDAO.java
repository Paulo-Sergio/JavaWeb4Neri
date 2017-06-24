package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.ItensVenda;

public class ItensVendaDAO {

	private Connection connection;

	public ItensVendaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public List<ItensVenda> getListaItensDaVenda(int idVenda) throws SQLException {
		String sql = "SELECT * FROM itens_venda INNER JOIN produtos "
				+ "ON itens_venda.id_produto = produtos.id WHERE id_venda = ?";
		List<ItensVenda> lista = new ArrayList<ItensVenda>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, idVenda);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				ItensVenda itensVenda = new ItensVenda();
				itensVenda.setIdProduto(rs.getInt("id_produto"));
				itensVenda.setIdVenda(rs.getInt("id_venda"));
				itensVenda.setQuantidade(rs.getInt("quantidade"));
				itensVenda.setTotal(rs.getDouble("total"));
				itensVenda.setProdutoDescricao(rs.getString("descricao"));
				itensVenda.setPrecoUnitario(rs.getDouble("precovenda"));
				
				lista.add(itensVenda);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public boolean novoVenda(ItensVenda itensVenda) throws SQLException {
		String sql = "INSERT INTO itens_venda (id_produto, id_venda, quantidade, total) VALUES (?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, itensVenda.getIdProduto());
			stmt.setInt(2, itensVenda.getIdVenda());
			stmt.setInt(3, itensVenda.getQuantidade());

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
