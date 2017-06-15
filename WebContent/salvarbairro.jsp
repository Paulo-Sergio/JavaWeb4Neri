<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<tags:verificaSessao />

<c:choose>
	<c:when test="${param.acao eq 'novo'}">
		<h1 class="page-header">Cadastro de Novo Bairro</h1>

		<form method="POST" action="BairroServlet?acao=novo">

			<div class="form-group">
				<label for="descricao">Descrição</label> <input type="text" id="descricao" name="descricao" class="form-control"
					placeholder="Informar nome do Bairro" maxlength="45">
			</div>
			<div class="form-group">
				<a href="BairroServlet" class="btn btn-default">Voltar</a>
				<button type="submit" class="btn btn-primary">Salvar Bairro</button>
			</div>
		</form>
	</c:when>

	<c:otherwise>
		<h1 class="page-header">Alteração do Bairro</h1>

		<form method="POST" action="BairroServlet?acao=alterar">
			<div class="form-group">
				<label for="id">Código</label> <input type="text" name="id" value="${bairro.getId()}" class="form-control" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="descricao">Descrição</label> <input type="text" name="descricao" class="form-control" value="${bairro.getDescricao()}">
			</div>
			<div class="form-group">
				<a href="BairroServlet" class="btn btn-default">Voltar</a>
				<button type="submit" class="btn btn-primary">Salvar Alteração</button>
			</div>
		</form>
	</c:otherwise>
</c:choose>

<c:import url="WEB-INF/partial/rodape.jsp" />