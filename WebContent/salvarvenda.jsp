<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<%-- <tags:verificaSessao /> --%>

<div class="row">
	<c:choose>
		<c:when test="${param.acao eq 'novo'}">
			<h1 class="page-header">Nova Venda</h1>
		</c:when>
		<c:otherwise>
			<h1 class="page-header">Editar Venda</h1>
		</c:otherwise>
	</c:choose>

	<form method="POST" action="VendaServlet?acao=${param.acao}">
		<div class="form-group">
			<label for="id">Código</label>
			<input type="text" readonly="readonly" name="id" class="form-control" id="id" value="${venda.getId()}">
		</div>
		<div class="form-group">
			<label for="cliente">Cliente</label>
			<select name="idCliente" class="form-control" id="cliente">
				<c:forEach var="cliente" items="${listaClientesCombo}">
					<option value="${cliente.getId()}" ${venda.getIdCliente() == cliente.getId() ? 'selected="selected"' : ''}>${cliente.getNome()}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="data">Data</label> 
			<input type="text" name="data" class="form-control" id="data" placeholder="dd/mm/aaaa" onkeypress="formata_mascara(this, '##/##/####'); return Numero(event)" value="<fmt:formatDate value='${venda.getData()}' pattern='dd/MM/yyyy' type='date' />">
		</div>
		<div class="form-group">
			<label for="valorTotal">Valor Total</label> 
			<input type="text" name="valorTotal" class="form-control" id="valorTotal" placeholder="total: 195.50" value="${venda.getValorTotal()}">
		</div>
		
		<div class="form-group">
			<a href="VendaServlet" class="btn btn-default">Voltar</a>
			<button type="submit" class="btn btn-primary">Gerar Venda e Inserir Intes na Nota</button>
		</div>
	</form>
	
	<h1 class="page-header" style="margin-top: 50px">Mercadorias da Venda</h1>
	
	<form method="POST" action="VendaServlet?acao=novoItemVenda">
		<input type="hidden" readonly="readonly" name="idVenda" class="form-control" id="idVenda" value="${venda.getId()}">
		<div class="form-group">
			<label for="idProduto">Produto</label>
			<select name="idProduto" class="form-control" id="idProduto">
				<c:if test="${param.acao eq 'novo'}">
					<option value="">-- Selecionar Produto --</option>
				</c:if>
				<c:forEach var="produto" items="${listaProdutosCombo}">
					<option value="${produto.getId()}">${produto.getDescricao()}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="quantidade">Quantidade</label> 
			<input type="number" name="quantidade" class="form-control" id="quantidade">
		</div>
		<div class="form-group">
			<a href="VendaServlet" class="btn btn-default">Voltar</a>
			<button type="submit" class="btn btn-primary">Itens da Venda</button>
		</div>
	</form>
</div>

<c:import url="WEB-INF/partial/rodape.jsp" />