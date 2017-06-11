package br.com.sistemaweb.javabean.model;

public class Usuario {

	private String usuario;
	private String senha;
	private int nivel;
	private String nomeCompleto;

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public String getNomeCompleto() {
		return nomeCompleto;
	}

	public void setNomeCompleto(String nomecompleto) {
		this.nomeCompleto = nomecompleto;
	}
}
