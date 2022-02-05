<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Bảng điều khiển</p>
                        <div class="right__cards">
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/products">
                                <div class="right__cardTitle">Sản Phẩm</div>
                                <div class="right__cardNumber">${qualityOfProduct }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/customers">
                                <div class="right__cardTitle">Khách Hàng</div>
                                <div class="right__cardNumber">${qualityOfUser }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/categories">
                                <div class="right__cardTitle">Danh Mục</div>
                                <div class="right__cardNumber">${qualityOfCategory }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/orders">
                                <div class="right__cardTitle">Đơn Hàng</div>
                                <div class="right__cardNumber">${qualityOfSaleOrder }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                        </div>
                        <div class="row">
                        	<canvas id="buyers" width="600" height="400">hihi : </canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/8.1.2/es-modules/parts/Chart.min.js"></script>
	
</body>
</html>