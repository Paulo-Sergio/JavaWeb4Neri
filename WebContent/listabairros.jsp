<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:set var="contador" value="${0}" />
<c:set var="selecionar" value="${param.campopesquisa}"/>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<tags:verificaSessao />

<div class="row">
	<div class="col-md-12">
		<h1 class="page-header">Lista de Bairros</h1>
	</div>
</div>

<div class="row" style="margin-bottom: 25px">
	<div class="col-md-3">
		<a href="BairroServlet?acao=novo" class="btn btn-primary">Cadastrar Novo Bairro</a>
	</div>

	<div class="col-md-9 text-right">
		<form method="get" action="BairroServlet" class="form-inline">
			<input type="hidden" name="numpagina" value="1">
			<div class="form-group">
				<select class="form-control" name="campopesquisa">
					<option value="descricao" ${selecionar == 'descricao' ? 'selected="selected"' : ''}>Descri��o</option>
					<option value="id" ${selecionar == 'id' ? 'selected="selected"' : ''}>C�digo</option>
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
			<th width="32"><a href="BairroServlet?ordenacao=id&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}&campopesquisa=${param.campopesquisa}">C�digo</a></th>
			<th><a href="BairroServlet?ordenacao=descricao&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}&campopesquisa=${param.campopesquisa}">Descri��o</a></th>
			<th width="32">Alterar</th>
			<th width="32">Excluir</th>
		</tr>
		<c:forEach var="bairro" items="${listaBairros}">
			<tr>
				<td>${bairro.getId()}</td>
				<td>${bairro.getDescricao()}</td>
				<td>
					<a href="BairroServlet?acao=alterar&id=${bairro.getId()}"> 
						<img src="resources/imagens/edit.png" alt="editar" />
					</a>
				</td>
				<td>
					<a href="BairroServlet?acao=excluir&id=${bairro.getId()}"> 
						<img src="resources/imagens/delete.png" alt="excluir" />
					</a>
				</td>
			</tr>
			<c:set var="contador" value="${contador+1}" />
		</c:forEach>
		<tr>
			<td colspan="6">Listando ${contador}, de <b>${qtdTotalRegistros}</b> registros de usu�rios</td>
		</tr>
	</table>
		
	<tags:paginacaoBairros/>

</div>

<c:import url="WEB-INF/partial/rodape.jsp" />