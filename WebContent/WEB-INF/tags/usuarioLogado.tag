<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${not empty sessaoUsuario}">
		${sessaoUsuario.getUsuario()}
	</c:when>
	<c:otherwise>
		Usuario não logado
	</c:otherwise>
</c:choose>