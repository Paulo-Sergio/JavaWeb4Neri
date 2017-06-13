<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<c:set var="contador" value="${0}" />

<c:import url="WEB-INF/partial/cabecalho.jsp" />
<tags:verificaSessao />

<h1 class="page-header">Lista de Usuários</h1>

<a href="UsuarioServlet?acao=novo" class="btn btn-primary">Cadastrar Novo Usuário</a>
<br>
<br>

<tags:statusUsuarioExcluido />
<tags:statusUsuarioAlterado />
<tags:statusUsuarioInclusao />

<%
	String numPagina = request.getParameter("num-pagina") == null ? "1" : request.getParameter("num-pagina");
%>

<table class="table table-bordered table-striped">
	<tr>
		<th><a href="UsuarioServlet?ordenacao=usuario&num-pagina=<%=numPagina%>">Usuário</a></th>
		<th><a href="UsuarioServlet?ordenacao=nivel&num-pagina=<%=numPagina%>">Nivel de Acesso</a></th>
		<th><a href="UsuarioServlet?ordenacao=nomecompleto&num-pagina=<%=numPagina%>">Nome Completo</a></th>
		<th width="32">Alterar</th>
		<th width="32">Excluir</th>
	</tr>
	<c:forEach var="usuario" items="${listaUsuarios}">
		<tr>
			<td>${usuario.getUsuario()}</td>
			<td>${usuario.getNivel()}</td>
			<td>${usuario.getNomeCompleto()}</td>
			<td><a href="UsuarioServlet?acao=alterar&usuario=${usuario.getUsuario()}"> <img src="resources/imagens/edit.png"
					alt="editar" />
			</a></td>
			<td><a href="UsuarioServlet?acao=excluir&usuario=${usuario.getUsuario()}"> <img src="resources/imagens/delete.png"
					alt="excluir" />
			</a></td>
		</tr>
		<c:set var="contador" value="${contador+1}" />
	</c:forEach>
	<tr>
		<td colspan="6">Listando ${contador}, de <b>${qtdTotalRegistros}</b> registros de usuários
		</td>
	</tr>
</table>

<tags:paginacaoUsuarios/>

<c:import url="WEB-INF/partial/rodape.jsp" />