<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:set var="contador" value="${0}" />

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<tags:verificaSessao />

<h1 class="page-header">Alteração de Usuário</h1>

<form method="POST" action="AlterarUsuario">
	<div class="form-group">
		<label for="senha">Usuario</label> <input type="text" name="usuario" class="form-control" value="${usuario.getUsuario()}" readonly>
	</div>
	<div class="form-group">
		<label for="senha">Senha</label> <input type="password" name="senha" class="form-control" id="senha" placeholder="Nova Senha"
			value="${usuario.getSenha()}">
	</div>
	<div class="form-group">
		<label for="nivel">Nivel de Acesso</label> <input type="number" min="1" max="3" name="nivel" class="form-control" id="nivel"
			placeholder="Nivel de Acesso" value="${usuario.getNivel()}">
	</div>
	<div class="form-group">
		<label for="nomecompleto">Nome Completo</label> <input type="text" name="nomecompleto" class="form-control" id="nomecompleto"
			placeholder="Nome Completo" value="${usuario.getNomeCompleto()}">
	</div>
	<div class="form-group">
		<a href="ListarUsuarios" class="btn btn-default">Voltar</a>
		<button type="submit" class="btn btn-primary">Salvar Alteração</button>
	</div>
</form>

<c:import url="WEB-INF/partial/rodape.jsp" />