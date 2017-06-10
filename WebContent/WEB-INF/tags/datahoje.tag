<%@tag import="java.util.Date"%>
<%@tag body-content="empty"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:useBean id="dataatual" class="java.util.Date"/>

<fmt:formatDate value="${dataatual}" pattern="dd/MM/yyyy" type="date" />