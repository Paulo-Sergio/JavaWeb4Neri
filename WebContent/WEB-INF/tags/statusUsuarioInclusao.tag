<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty mensagemInclusao}">
	<br>
	<div class="alert alert-info text-center">${mensagemInclusao}</div>
</c:if>