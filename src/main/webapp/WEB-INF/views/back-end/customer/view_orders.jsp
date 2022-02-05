<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="com.devpro.entities.User"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.devpro.services.ProductService"%>
<%@page import="com.devpro.model.ProductSearch"%>
<%@page import="com.devpro.entities.Product"%>
<%!

	@Autowired
	private ProductService productService;

	public String getNameProduct(Integer id) {
		ProductSearch productSearch = new ProductSearch();
		productSearch.setId(id);
		Product pro = (Product) productService.search(productSearch);
		return pro.getTitle();
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/customer/common/css.jsp"></jsp:include>
    <link href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/customer/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Xem đơn hàng</p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table id="myTable">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Họ Đệm</th>
                                            <th>Tên</th>
                                            <th>Stt sp</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Giá tiền</th>
                                            <th>Ngày</th>
                                            <th>Tổng</th>
                                            <th>Trạng thái</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                       <c:forEach items="${orders }" var="order" varStatus="loop">
	                                        <tr>
	                                            <td data-label="STT" rowspan="${order.saleOrderProducts.size() + 1 }">${loop.index + 1}</td>
	                                            <td data-label="Họ Đệm" rowspan="${order.saleOrderProducts.size() + 1 }">${order.customerFirstName}</td>
	                                            <td data-label="Tên" rowspan="${order.saleOrderProducts.size() + 1 }">${order.customerLastName }</td>
	                                        </tr>
	                                        <tr>
		                                        	<td data-label="Stt sp">1</td>
		                                        	<td data-label="Tên sản phẩm">${order.saleOrderProducts.get(0).product.title}</td>
		                                            <td data-label="Số lượng">${order.saleOrderProducts.get(0).quality}</td>
		                                            <td data-label="Giá tiền">${order.saleOrderProducts.get(0).product.price}</td>
		                                            <td data-label="Ngày" rowspan="${order.saleOrderProducts.size() + 1 }">${order.createdDate}</td>
		                                            <td data-label="Tổng" rowspan="${order.saleOrderProducts.size() + 1 }">${order.total() }</td>
		                                            <td data-label="Trạng thái" rowspan="${order.saleOrderProducts.size() + 1 }">
		                                            <span id="status-${order.id }">
		                                                	<c:choose>
		                                                		<c:when test="${order.status}">
		                                                			<span class="badge badge-danger">Đã Thanh Toán</span>
		                                                		</c:when>
		                                                		<c:otherwise>
		                                                			<span class="badge badge-primary">Đang giao hàng</span>
		                                                		</c:otherwise>
		                                                	</c:choose>
	                                                	</span>
		                                            </td>
		                                        </tr>
	                                        <c:forEach varStatus="loop2" begin="1" end="${order.saleOrderProducts.size() - 1}" items="${order.saleOrderProducts }">
		                                        <tr>
		                                        	<td data-label="Stt sp">${loop2.index + 1}</td>
		                                        	<td data-label="Tên sản phẩm">${order.saleOrderProducts.get(loop2.index).product.title}</td>
		                                            <td data-label="Số lượng">${order.saleOrderProducts.get(loop2.index).quality}</td>
		                                            <td data-label="Giá tiền">${order.saleOrderProducts.get(loop2.index).product.price}</td>
		                                        </tr>
		                                     </c:forEach>
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
</body>
</html>