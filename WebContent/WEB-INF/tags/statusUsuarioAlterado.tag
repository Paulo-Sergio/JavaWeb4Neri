<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty mensagemAlteracao}">
	<br>
	<div class="alert alert-info text-center">${mensagemAlteracao}</div>
</c:if>