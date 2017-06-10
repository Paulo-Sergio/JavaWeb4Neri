<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty mensagem}">
	<br>
	<div class="alert alert-warning text-center">${mensagem}</div>
</c:if>