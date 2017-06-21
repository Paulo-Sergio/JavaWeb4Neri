package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.ItensVenda;

public class ItensVendaDAO {

	private Connection connection;

	public ItensVendaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public boolean novoVenda(ItensVenda itensVenda) throws SQLException {
		String sql = "INSERT INTO itens_venda (id_produto, id_venda, quantidade, total) VALUES (?,?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, itensVenda.getIdProduto());
			stmt.setInt(2, itensVenda.getIdVenda());
			stmt.setInt(3, itensVenda.getQuantidade());

			return stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}
}
