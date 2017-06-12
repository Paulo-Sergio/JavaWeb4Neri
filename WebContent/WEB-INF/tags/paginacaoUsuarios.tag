<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Logica paginação -->
<%
	int limit = 10;
	Integer totalRegistros = (Integer) request.getAttribute("qtdTotalRegistros");
	int totalPaginas = totalRegistros / limit;
	if (totalRegistros % limit != 0) {
		totalPaginas++;
	}
	String numPagina = request.getParameter("num-pagina");
	if (numPagina == null) {
		numPagina = "1";
	}
	int paginaAtiva = Integer.parseInt(numPagina);
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
			href="ListarUsuarios?num-pagina=<%=i%>"><%=i%></a></li>
		<%
			}
		%>
	</ul>
</div>