<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty mensagemExclusao}">
	<br>
	<div class="alert alert-warning text-center">${mensagemExclusao}</div>
</c:if>