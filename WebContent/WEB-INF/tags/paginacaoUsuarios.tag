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
	String numPagina = request.getParameter("num-pagina") == null ? "1" : request.getParameter("num-pagina");
	int paginaAtiva = Integer.parseInt(numPagina);
	
	// qual a ordenacao
	String ordenacao = request.getParameter("ordenacao") == null ? "nomecompleto" : request.getParameter("ordenacao");
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
			href="UsuarioServlet?ordenacao=<%=ordenacao%>&num-pagina=<%=i%>"><%=i%></a></li>
		<%
			}
		%>
	</ul>
</div>