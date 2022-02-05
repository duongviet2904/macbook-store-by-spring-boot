<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
<h2>Sorry, you do not have permission to view this page.</h2>

Click <a href="<c:url value="${pageContext.request.contextPath}/logout" /> ">here</a>
to go back to the Homepage.
</body>