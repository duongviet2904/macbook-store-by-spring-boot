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
                        <p class="right__desc">Xem sản phẩm</p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table id="myTable">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Địa chỉ</th>
                                            <th>Tên đăng nhập</th>
                                            <th>Xoá</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                        <c:forEach items="${ users}" var="user" varStatus="loop">
                                        <tr>
                                            <td data-label="STT">${loop.index + 1 }</td>
                                            <td data-label="Tên">${user.name }</td>
                                            <td data-label="Email">${user.email }</td>
                                            <td data-label="Phone">${user.phone }</td>
                                            <td data-label="Địa chỉ">${user.address }</td>
                                            <td data-label="Tên đăng nhập">${user.username }</td>
                                            <td data-label="Xoá" class="right__iconTable"><a onclick="myFunction(${user.id})"><img src="${pageContext.request.contextPath}/assets/icon-trash-black.svg" alt=""></a></td>
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
		function myFunction(id){
			  var r = confirm("Bạn có muốn xoá người dùng này ?");
			  if (r == true) {
			    window.location = "${pageContext.request.contextPath }/admin/customer-delete/" + id;
			  } else {
			    window.location = "${pageContext.request.contextPath }/admin/customers";
			  }
		};
		
		$(document).ready( function () {
		    $('#myTable').DataTable();
		} );
	</script>
</body>
</html>