<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:set var="contador" value="${0}" />
<c:set var="selecionar" value="${param.campopesquisa}"/>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<%-- <tags:verificaSessao /> --%>

<div class="row">
	<div class="col-md-12">
		<h1 class="page-header">Lista de Clientes</h1>
	</div>
</div>

<div class="row" style="margin-bottom: 25px">
	<div class="col-md-3">
		<a href="ClienteServlet?acao=novo" class="btn btn-primary">Cadastrar Novo Cliente</a>
	</div>

	<div class="col-md-9 text-right">
		<form method="get" action="ClienteServlet" class="form-inline">
			<input type="hidden" name="numpagina" value="1">
			<div class="form-group">
				<select class="form-control" name="campopesquisa">
					<option value="nome" ${selecionar == 'nome' ? 'selected="selected"' : ''}>Nome</option>
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

<tags:statusUsuarioExcluido />
<tags:statusUsuarioAlterado />
<tags:statusUsuarioInclusao />

<div class="row">
	<table class="table table-bordered table-striped">
		<tr>
			<th><a href="ClienteServlet?ordenacao=id&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}&campopesquisa=${param.campopesquisa}">ID</a></th>
			<th><a href="ClienteServlet?ordenacao=nome&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}&campopesquisa=${param.campopesquisa}">Nome</a></th>
			<th>CPF</th>
			<th>RG</th>
			<th>Nascimento</th>
			<th>Cadastrado</th>
			<th>Celular</th>
			<th>E-mail</th>
			<th>Sexo</th>
			<th>Alterar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach var="cliente" items="${listaClientes}">
			<tr>
				<td>${cliente.getId()}</td>
				<td>${cliente.getNome()}</td>
				<td>${cliente.getCpf()}</td>
				<td>${cliente.getRg()}</td>
				<td><fmt:formatDate value="${cliente.getDataNascimento()}" pattern="dd/MM/yyyy" type="date" /></td>
				<td><fmt:formatDate value="${cliente.getDataCadastro()}" pattern="dd/MM/yyyy" type="date"/></td>
				<td>${cliente.getFonecel()}</td>
				<td>${cliente.getEmail()}</td>
				<td>${cliente.getSexo()}</td>
				<td>
					<a href="ClienteServlet?acao=alterar&id=${cliente.getId()}">
						<img src="resources/imagens/edit.png" alt="editar" />
					</a>
				</td>
				<td>
					<a href="ClienteServlet?acao=excluir&id=${cliente.getId()}">
						<img src="resources/imagens/delete.png" alt="excluir" />
					</a>
				</td>
			</tr>
			<c:set var="contador" value="${contador+1}" />
		</c:forEach>
		<tr>
			<td colspan="12">Listando ${contador}, de <b>${qtdTotalRegistros}</b> registros de usuários</td>
		</tr>
	</table>
		
	<tags:paginacaoClientes/>

</div>

<c:import url="WEB-INF/partial/rodape.jsp" />