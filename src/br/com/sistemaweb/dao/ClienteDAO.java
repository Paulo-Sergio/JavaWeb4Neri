package br.com.sistemaweb.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.sistemaweb.factory.ConnectionFactory;
import br.com.sistemaweb.javabean.model.Cliente;

public class ClienteDAO {

	private Connection connection;

	public ClienteDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	public List<Cliente> getListaClientesPaginada(int pagina, String ordenacao, String pesquisa, String campoPesquisa)
			throws SQLException {
		int limit = 10;
		int offset = (limit * pagina) - limit;
		String sql = "SELECT * FROM cliente WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%' ORDER BY " + ordenacao
				+ " LIMIT 10 OFFSET " + offset;
		List<Cliente> lista = new ArrayList<Cliente>();
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setIdBairro(rs.getInt("id_bairro"));
				cliente.setIdLogradouro(rs.getInt("id_logradouro"));
				cliente.setIdCidade(rs.getInt("id_cidade"));
				cliente.setNome(rs.getString("nome"));
				cliente.setNumero(rs.getString("numero"));
				cliente.setComplemento(rs.getString("complemento"));
				cliente.setCep(rs.getString("cep"));
				cliente.setRg(rs.getString("rg"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setDatanascimento(rs.getDate("datanascimento"));
				cliente.setDatacadastro(rs.getDate("datacadastro"));
				cliente.setFonecel(rs.getString("fonecel"));
				cliente.setFone2(rs.getString("fone2"));
				cliente.setEmail(rs.getString("email"));
				cliente.setFoto(rs.getString("foto"));
				cliente.setSexo(rs.getString("sexo"));
				cliente.setObs(rs.getString("obs"));

				lista.add(cliente);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return lista;
	}

	public int totalDeRegistros(String pesquisa, String campoPesquisa) throws SQLException {
		String sql = "SELECT count(*) AS contaRegistros FROM cliente WHERE " + campoPesquisa + " LIKE '%" + pesquisa + "%'";
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

	public Cliente getCliente(int id) throws SQLException {
		String sql = "SELECT * FROM cliente WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setIdBairro(rs.getInt("id_bairro"));
				cliente.setIdLogradouro(rs.getInt("id_logradouro"));
				cliente.setIdCidade(rs.getInt("id_cidade"));
				cliente.setNome(rs.getString("nome"));
				cliente.setNumero(rs.getString("numero"));
				cliente.setComplemento(rs.getString("complemento"));
				cliente.setCep(rs.getString("cep"));
				cliente.setRg(rs.getString("rg"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setDatanascimento(rs.getDate("datanascimento"));
				cliente.setDatacadastro(rs.getDate("datacadastro"));
				cliente.setFonecel(rs.getString("fonecel"));
				cliente.setFone2(rs.getString("fone2"));
				cliente.setEmail(rs.getString("email"));
				cliente.setFoto(rs.getString("foto"));
				cliente.setSexo(rs.getString("sexo"));
				cliente.setObs(rs.getString("obs"));

				return cliente;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}
		return null;
	}

	public boolean excluirCliente(Cliente cliente) throws SQLException {
		String sql = "DELETE FROM cliente WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, cliente.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean alterarCliente(Cliente cliente) throws SQLException {
		String sql = "UPDATE cliente SET id_bairro=?, id_logradouro=?, id_cidade=?, nome=?, numero=?, complemento=?, rg=?, cpf=?, datanascimento=?, datacadastro=?, fonecel=?, fone2=?, email=?, foto=?, sexo=?, obs=? WHERE id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, cliente.getIdBairro());
			stmt.setInt(2, cliente.getIdLogradouro());
			stmt.setInt(3, cliente.getIdCidade());
			stmt.setString(4, cliente.getNome());
			stmt.setString(5, cliente.getNumero());
			stmt.setString(6, cliente.getComplemento());
			stmt.setString(7, cliente.getRg());
			stmt.setString(8, cliente.getCpf());
			stmt.setDate(9, (Date) cliente.getDatanascimento());
			stmt.setDate(10, (Date) cliente.getDatacadastro());
			stmt.setString(11, cliente.getFonecel());
			stmt.setString(12, cliente.getFone2());
			stmt.setString(13, cliente.getEmail());
			stmt.setString(14, cliente.getFoto());
			stmt.setString(15, cliente.getSexo());
			stmt.setString(16, cliente.getObs());
			stmt.setInt(17, cliente.getId());
			stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.connection.close();
		}

		return false;
	}

	public boolean novoCliente(Cliente cliente) throws SQLException {
		String sql = "INSERT INTO cliente (id_bairro, id_logradouro, id_cidade, nome, numero, complemento, rg, cpf, datanascimento, datacadastro, fonecel, fone2, email, foto, sexo, obs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, cliente.getIdBairro());
			stmt.setInt(2, cliente.getIdLogradouro());
			stmt.setInt(3, cliente.getIdCidade());
			stmt.setString(4, cliente.getNome());
			stmt.setString(5, cliente.getNumero());
			stmt.setString(6, cliente.getComplemento());
			stmt.setString(7, cliente.getRg());
			stmt.setString(8, cliente.getCpf());
			stmt.setDate(9, (Date) cliente.getDatanascimento());
			stmt.setDate(10, (Date) cliente.getDatacadastro());
			stmt.setString(11, cliente.getFonecel());
			stmt.setString(12, cliente.getFone2());
			stmt.setString(13, cliente.getEmail());
			stmt.setString(14, cliente.getFoto());
			stmt.setString(15, cliente.getSexo());
			stmt.setString(16, cliente.getObs());
			stmt.setInt(17, cliente.getId());
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
