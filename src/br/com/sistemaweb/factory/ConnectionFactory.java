package br.com.sistemaweb.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaweb4neri";
	private String usuario = "root";
	private String senha = "";

	public Connection getConnection() {
		try {
			
			Class.forName(this.driver);
			return DriverManager.getConnection(this.url, this.usuario, this.senha);
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
