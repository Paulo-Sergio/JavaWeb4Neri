<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<tags:verificaSessao />

<c:choose>
	<c:when test="${param.acao eq 'novo'}">
		<h1 class="page-header">Cadastro de Novo Usuário</h1>

		<form method="POST" action="UsuarioServlet?acao=novo">

			<div class="form-group">
				<label for="usuario">Usuario</label> <input type="text" id="usuario" name="usuario" class="form-control"
					placeholder="Informar nome para usuário" maxlength="10">
			</div>
			<div class="form-group">
				<label for="senha">Senha</label> <input type="password" name="senha" class="form-control" id="senha" placeholder="Senha">
			</div>
			<div class="form-group">
				<label for="repetirsenha">Repetir Senha</label> <input type="password" name="repetirsenha" class="form-control"
					id="repetirsenha" placeholder="Repetir a senha" onchange="validarSenha(this)">
			</div>
			<div class="form-group">
				<label for="nivel">Nivel de Acesso</label> <input type="number" min="1" max="3" name="nivel" class="form-control" id="nivel"
					placeholder="Nivel de Acesso de 1 a 3" maxlength="1">
			</div>
			<div class="form-group">
				<label for="nomecompleto">Nome Completo</label> <input type="text" name="nomecompleto" class="form-control" id="nomecompleto"
					placeholder="Nome completo">
			</div>
			<div class="form-group">
				<a href="ListarUsuarios" class="btn btn-default">Voltar</a>
				<button type="submit" class="btn btn-primary">Salvar Alteração</button>
			</div>
		</form>
	</c:when>

	<c:otherwise>
		<h1 class="page-header">Alteração de Usuário</h1>

		<form method="POST" action="UsuarioServlet?acao=alterar">
			<div class="form-group">
				<label for="usuario">Usuario</label> <input type="text" name="usuario" class="form-control" value="${usuario.getUsuario()}"
					readonly>
			</div>
			<div class="form-group">
				<label for="senha">Senha</label> <input type="password" name="senha" class="form-control" id="senha"
					value="${usuario.getSenha()}">
			</div>
			<div class="form-group">
				<label for="repetirsenha">Repetir Senha</label> <input type="password" name="repetirsenha" class="form-control"
					id="repetirsenha" placeholder="Repetir a senha" onchange="validarSenha(this)">
			</div>
			<div class="form-group">
				<label for="nivel">Nivel de Acesso</label> <input type="number" min="1" max="3" name="nivel" class="form-control" id="nivel"
					value="${usuario.getNivel()}">
			</div>
			<div class="form-group">
				<label for="nomecompleto">Nome Completo</label> <input type="text" name="nomecompleto" class="form-control" id="nomecompleto"
					value="${usuario.getNomeCompleto()}">
			</div>
			<div class="form-group">
				<a href="ListarUsuarios" class="btn btn-default">Voltar</a>
				<button type="submit" class="btn btn-primary">Salvar Alteração</button>
			</div>
		</form>
	</c:otherwise>
</c:choose>

<c:import url="WEB-INF/partial/rodape.jsp" />