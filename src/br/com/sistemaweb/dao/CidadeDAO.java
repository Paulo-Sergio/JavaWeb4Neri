package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.Cidade;

public class CidadeDAO {

	private Connection connection;

	public CidadeDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public int totalDeRegistros(String pesquisa, String campoPesquisa) throws SQLException {
		String sql = "SELECT count(*) AS contaRegistros FROM cidade WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%'";
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

	public List<Cidade> getListaCidadesPaginada(int pagina, String ordenacao, String pesquisa, String campoPesquisa)
			throws SQLException {
		int limit = 10;
		int offset = (limit * pagina) - limit;
		String sql = "SELECT * FROM cidade WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%' ORDER BY " + ordenacao
				+ " LIMIT 10 OFFSET " + offset;
		List<Cidade> lista = new ArrayList<Cidade>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Cidade cidade = new Cidade();
				cidade.setId(rs.getInt("id"));
				cidade.setDescricao(rs.getString("descricao"));
				cidade.setUf(rs.getString("uf"));
				lista.add(cidade);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}
	
	public List<Cidade> getListaCidadesCombo()
			throws SQLException {
		String sql = "SELECT * FROM cidade ORDER BY descricao";
		List<Cidade> lista = new ArrayList<Cidade>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Cidade cidade = new Cidade();
				cidade.setId(rs.getInt("id"));
				cidade.setDescricao(rs.getString("descricao"));
				cidade.setUf(rs.getString("uf"));
				lista.add(cidade);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public Cidade getCidade(int id) throws SQLException {
		String sql = "SELECT * FROM cidade WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Cidade cidade = new Cidade();
				cidade.setId(rs.getInt("id"));
				cidade.setDescricao(rs.getString("descricao"));
				cidade.setUf(rs.getString("uf"));
				return cidade;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return null;
	}

	public boolean excluirCidade(Cidade cidade) throws SQLException {
		String sql = "DELETE FROM cidade WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, cidade.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean alterarCidade(Cidade cidade) throws SQLException {
		String sql = "UPDATE cidade SET descricao=?, uf=? WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, cidade.getDescricao());
			stmt.setString(2, cidade.getUf());
			stmt.setInt(3, cidade.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean novoCidade(Cidade cidaed) throws SQLException {
		String sql = "INSERT INTO cidade (descricao, uf) VALUES (?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, cidaed.getDescricao());
			stmt.setString(1, cidaed.getUf());
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
