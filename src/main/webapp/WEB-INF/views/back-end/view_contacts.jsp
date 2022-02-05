<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
    <link href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Xem phản hồi :</p>
                   
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table id="myTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">STT</th>
                                            <th scope="col">Họ tên</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Nội dung</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                        <c:forEach items="${contacts }" var="contact" varStatus="loop">
	                                        <tr>
	                                            <td data-label="STT" scope="row">${loop.index + 1}</td>
	                                            <td data-label="Họ tên">${contact.name }</td>
	                                            <td data-label="Email">${contact.email }</td>
	                                            <td data-label="Nội dung">${contact.message }</td>
	                                        </tr>
                                        </c:forEach>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script>
	$(document).ready( function () {
	    $('#myTable').DataTable();
	} );
	</script>
</body>
</html>