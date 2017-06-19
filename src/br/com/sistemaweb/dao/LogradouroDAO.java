package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.Logradouro;

public class LogradouroDAO {

	private Connection connection;

	public LogradouroDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public int totalDeRegistros(String pesquisa, String campoPesquisa) throws SQLException {
		String sql = "SELECT count(*) AS contaRegistros FROM logradouro WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%'";
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

	public List<Logradouro> getListaLogradourosPaginada(int pagina, String ordenacao, String pesquisa, String campoPesquisa)
			throws SQLException {
		int limit = 10;
		int offset = (limit * pagina) - limit;
		String sql = "SELECT * FROM logradouro WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%' ORDER BY " + ordenacao
				+ " LIMIT 10 OFFSET " + offset;
		List<Logradouro> lista = new ArrayList<Logradouro>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Logradouro logradouro = new Logradouro();
				logradouro.setId(rs.getInt("id"));
				logradouro.setDescricao(rs.getString("descricao"));
				lista.add(logradouro);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}
	
	public List<Logradouro> getListaLogradourosCombo()
			throws SQLException {
		String sql = "SELECT * FROM logradouro ORDER BY descricao";
		List<Logradouro> lista = new ArrayList<Logradouro>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Logradouro logradouro = new Logradouro();
				logradouro.setId(rs.getInt("id"));
				logradouro.setDescricao(rs.getString("descricao"));
				lista.add(logradouro);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public Logradouro getLogradouro(int id) throws SQLException {
		String sql = "SELECT * FROM logradouro WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Logradouro logradouro = new Logradouro();
				logradouro.setId(rs.getInt("id"));
				logradouro.setDescricao(rs.getString("descricao"));
				return logradouro;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return null;
	}

	public boolean excluirLogradouro(Logradouro logradouro) throws SQLException {
		String sql = "DELETE FROM logradouro WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, logradouro.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean alterarLogradouro(Logradouro logradouro) throws SQLException {
		String sql = "UPDATE logradouro SET descricao=? WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, logradouro.getDescricao());
			stmt.setInt(2, logradouro.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean novoLogradouro(Logradouro logradouro) throws SQLException {
		String sql = "INSERT INTO logradouro (descricao) VALUES (?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, logradouro.getDescricao());
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
