package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.Usuario;

public class UsuarioDAO {

	private Connection connection;

	public UsuarioDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public boolean verificaUsuario(Usuario usuario) throws SQLException {
		String sql = "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getUsuario());
			stmt.setString(2, usuario.getSenha());

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public Usuario getUsuario(String usuario, String senha) throws SQLException {
		String sql = "SELECT * FROM usuarios WHERE usuario = ? AND senha = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario);
			stmt.setString(2, senha);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Usuario usu = new Usuario();
				usu.setUsuario(rs.getString("usuario"));
				usu.setSenha(rs.getString("senha"));
				usu.setNivel(rs.getInt("nivel"));
				usu.setNomeCompleto(rs.getString("nomecompleto"));
				return usu;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return null;
	}

	public Usuario getUsuario(String usuario) throws SQLException {
		String sql = "SELECT * FROM usuarios WHERE usuario = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Usuario usu = new Usuario();
				usu.setUsuario(rs.getString("usuario"));
				usu.setSenha(rs.getString("senha"));
				usu.setNivel(rs.getInt("nivel"));
				usu.setNomeCompleto(rs.getString("nomecompleto"));
				return usu;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return null;
	}

	public List<Usuario> getListaUsuarios() throws SQLException {
		String sql = "SELECT * FROM usuarios";
		List<Usuario> lista = new ArrayList<Usuario>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usu = new Usuario();
				usu.setUsuario(rs.getString("usuario"));
				usu.setSenha(rs.getString("senha"));
				usu.setNivel(rs.getInt("nivel"));
				usu.setNomeCompleto(rs.getString("nomecompleto"));
				lista.add(usu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public int totalDeRegistros(String pesquisa, String campoPesquisa) throws SQLException {
		String sql = "SELECT count(*) AS contaRegistros FROM usuarios WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%'";
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

	public List<Usuario> getListaUsuariosPaginada(int pagina, String ordenacao, String pesquisa, String campoPesquisa)
			throws SQLException {
		int limit = 10;
		int offset = (limit * pagina) - limit;
		String sql = "SELECT * FROM usuarios WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%' ORDER BY " + ordenacao
				+ " LIMIT 10 OFFSET " + offset;
		List<Usuario> lista = new ArrayList<Usuario>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Usuario usu = new Usuario();
				usu.setUsuario(rs.getString("usuario"));
				usu.setSenha(rs.getString("senha"));
				usu.setNivel(rs.getInt("nivel"));
				usu.setNomeCompleto(rs.getString("nomecompleto"));
				lista.add(usu);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public boolean excluirUsuario(Usuario usuario) throws SQLException {
		String sql = "DELETE FROM usuarios WHERE usuario = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getUsuario());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean alterarUsuario(Usuario usuario) throws SQLException {
		String sql = "UPDATE usuarios SET senha=?, nivel=?, nomecompleto=? WHERE usuario = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getSenha());
			stmt.setInt(2, usuario.getNivel());
			stmt.setString(3, usuario.getNomeCompleto());
			stmt.setString(4, usuario.getUsuario());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean novoUsuario(Usuario usuario) throws SQLException {
		String sql = "INSERT INTO usuarios (usuario, senha, nivel, nomecompleto) VALUES (?,?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, usuario.getUsuario());
			stmt.setString(2, usuario.getSenha());
			stmt.setInt(3, usuario.getNivel());
			stmt.setString(4, usuario.getNomeCompleto());
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
