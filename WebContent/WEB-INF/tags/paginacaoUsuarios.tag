<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	// Logica paginação 	
	int limit = 10;
	Integer totalRegistros = (Integer) request.getAttribute("qtdTotalRegistros");
	int totalPaginas = totalRegistros / limit;
	if (totalRegistros % limit != 0) {
		totalPaginas++;
	}

	// qual a pagina ativa
	String numPagina = request.getParameter("numpagina") == null ? "1" : request.getParameter("numpagina");
	int paginaAtiva = Integer.parseInt(numPagina);
	
	// qual a ordenacao
	String ordenacao = request.getParameter("ordenacao") == null ? "nomecompleto" : request.getParameter("ordenacao");
	
	// qual a pesquisa que foi feita
	String pesquisa = request.getParameter("pesquisa") == null ? "" : request.getParameter("pesquisa");
%>
<div class="page-nation">
	<ul class="pagination pagination-large">
		<%
			for (int i = 1; i <= totalPaginas; i++) {
				String active = "";
				if (i == paginaAtiva) {
					active = "active";
				}
		%>
		<li class="<%=active%>"><a
			href="UsuarioServlet?ordenacao=<%=ordenacao%>&pesquisa=<%=pesquisa%>&numpagina=<%=i%>"><%=i%></a></li>
		<% } %>
	</ul>
</div>