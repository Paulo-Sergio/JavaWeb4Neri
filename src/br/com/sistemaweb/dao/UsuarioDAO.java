package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.Usuario;

public class UsuarioDAO {

	private Connection connection;

	public UsuarioDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public boolean verificaUsuario(Usuario usuario) {
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
			// this.connection.close();
		}

		return false;
	}

	public Usuario getUsuario(String usuario, String senha) {
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
				usu.setNomecompleto(rs.getString("nomecompleto"));
				return usu;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// this.connection.close();
		}
		return null;
	}
}
