<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:set var="contador" value="${0}" />

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<tags:verificaSessao />

<div class="row">
<div class="col-md-12">
	<h1 class="page-header">Lista de Usuários</h1>
</div>
</div>

<div class="row" style="margin-bottom: 25px">
	<div class="col-md-3">
		<a href="UsuarioServlet?acao=novo" class="btn btn-primary">Cadastrar Novo Usuário</a>
	</div>

	<div class="col-md-9 text-right">
		<form method="get" action="UsuarioServlet" class="form-inline">
			<input type="hidden" name="numpagina" value="${param.numpagina == null ? '1' : param.numpagina}">
			<div class="form-group">
				<select class="form-control" name="campopesquisa">
					<option value="nomecompleto">Nome Completo</option>
					<option value="usuario">Usuário</option>
					<option value="nivel">Nível</option>
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
			<th><a href="UsuarioServlet?ordenacao=usuario&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}">Usuário</a></th>
			<th><a href="UsuarioServlet?ordenacao=nivel&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}">Nivel de Acesso</a></th>
			<th><a href="UsuarioServlet?ordenacao=nomecompleto&numpagina=${param.numpagina == null ? '1' : param.numpagina}&pesquisa=${param.pesquisa}">Nome Completo</a></th>
			<th width="32">Alterar</th>
			<th width="32">Excluir</th>
		</tr>
		<c:forEach var="usuario" items="${listaUsuarios}">
			<tr>
				<td>${usuario.getUsuario()}</td>
				<td>${usuario.getNivel()}</td>
				<td>${usuario.getNomeCompleto()}</td>
				<td>
					<a href="UsuarioServlet?acao=alterar&usuario=${usuario.getUsuario()}"> 
						<img src="resources/imagens/edit.png" alt="editar" />
					</a>
				</td>
				<td>
					<a href="UsuarioServlet?acao=excluir&usuario=${usuario.getUsuario()}"> 
						<img src="resources/imagens/delete.png" alt="excluir" />
					</a>
				</td>
			</tr>
			<c:set var="contador" value="${contador+1}" />
		</c:forEach>
		<tr>
			<td colspan="6">Listando ${contador}, de <b>${qtdTotalRegistros}</b> registros de usuários</td>
		</tr>
	</table>
		
	<tags:paginacaoUsuarios/>

</div>

<c:import url="WEB-INF/partial/rodape.jsp" />