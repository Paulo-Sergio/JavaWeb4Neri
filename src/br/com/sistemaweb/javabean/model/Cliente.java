package br.com.sistemaweb.javabean.model;

import java.sql.Date;

public class Cliente {

	private int id;
	private int idBairro;
	private int idLogradouro;
	private int idCidade;
	private String nome;
	private String numero;
	private String complemento;
	private String cep;
	private String rg;
	private String cpf;
	private Date datanascimento;
	private Date datacadastro;
	private String fonecel;
	private String fone2;
	private String email;
	private String foto;
	private String sexo;
	private String obs;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdBairro() {
		return idBairro;
	}
	public void setIdBairro(int idBairro) {
		this.idBairro = idBairro;
	}
	public int getIdLogradouro() {
		return idLogradouro;
	}
	public void setIdLogradouro(int idLogradouro) {
		this.idLogradouro = idLogradouro;
	}
	public int getIdCidade() {
		return idCidade;
	}
	public void setIdCidade(int idCidade) {
		this.idCidade = idCidade;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public Date getDatanascimento() {
		return datanascimento;
	}
	public void setDatanascimento(Date datanascimento) {
		this.datanascimento = datanascimento;
	}
	public Date getDatacadastro() {
		return datacadastro;
	}
	public void setDatacadastro(Date datacadastro) {
		this.datacadastro = datacadastro;
	}
	public String getFonecel() {
		return fonecel;
	}
	public void setFonecel(String fonecel) {
		this.fonecel = fonecel;
	}
	public String getFone2() {
		return fone2;
	}
	public void setFone2(String fone2) {
		this.fone2 = fone2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public String getObs() {
		return obs;
	}
	public void setObs(String obs) {
		this.obs = obs;
	}
}
