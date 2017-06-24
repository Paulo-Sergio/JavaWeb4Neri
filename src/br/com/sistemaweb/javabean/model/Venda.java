package br.com.sistemaweb.javabean.model;

import java.util.Date;

public class Venda implements Cloneable{

	private int id;
	private int idCliente;
	private Date data;
	private double valorTotal;
	
	private String clienteNome;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public double getValorTotal() {
		return valorTotal;
	}
	public void setValorTotal(double valorTotal) {
		this.valorTotal = valorTotal;
	}
	public String getClienteNome() {
		return clienteNome;
	}
	public void setClienteNome(String clienteNome) {
		this.clienteNome = clienteNome;
	}
	
	@Override
    public Venda clone() throws CloneNotSupportedException {
        return (Venda) super.clone();
    }
	
	
}
