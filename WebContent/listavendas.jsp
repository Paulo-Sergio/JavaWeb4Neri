<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:set var="contador" value="${0}" />
<c:set var="selecionar" value="${param.campopesquisa}"/>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<%-- <tags:verificaSessao /> --%>

<div class="row">
	<div class="col-md-12">
		<h1 class="page-header">Lista de Vendas Ralizadas</h1>
	</div>
</div>

<div class="row" style="margin-bottom: 25px">
	<div class="col-md-3">
		<a href="VendaServlet?acao=novo" class="btn btn-primary">Cadastrar Nova Venda</a>
	</div>

	<div class="col-md-9 text-right">
		<form method="get" action="VendaServlet" class="form-inline">
			<input type="hidden" name="numpagina" value="1">
			<div class="form-group">
				<select class="form-control" name="campopesquisa">
					<option value="descricao" ${selecionar == 'descricao' ? 'selected="selected"' : ''}>Descrição</option>
					<option value="id" ${selecionar == 'id' ? 'selected="selected"' : ''}>Código</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="pesquisa" placeholder="Pesquisar..." value="${param.pesquisa}">
			</div>
			<button class="btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</button>
		</form>
	</div>
</div>

<div class="row">
	<table class="table table-bordered table-striped">
		<tr>
			<th><a href="VendaServlet?ordenacao=id&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}&campopesquisa=${param.campopesquisa}">Código</a></th>
			<th><a href="VendaServlet?ordenacao=descricao&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}&campopesquisa=${param.campopesquisa}">Cliente</a></th>
			<th>Data</th>
		</tr>
		<c:forEach var="venda" items="${listaVendas}">
			<tr>
				<td>${venda.getId()}</td>
				<td>${venda.getClienteNome()}</td>
				<td><fmt:formatDate value="${venda.getData()}" pattern="dd/MM/yyyy" type="date" /></td>
			</tr>
			<c:set var="contador" value="${contador+1}" />
		</c:forEach>
		<tr>
			<td colspan="6">Listando ${contador}, de <b>${qtdTotalRegistros}</b> registros de usuários</td>
		</tr>
	</table>
		
	<tags:paginacaoBairros/>

</div>

<c:import url="WEB-INF/partial/rodape.jsp" />