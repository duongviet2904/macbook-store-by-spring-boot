<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/customer/common/css.jsp"></jsp:include>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/customer/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Thông tin cá nhân :</p>
                        <div class="right__formWrapper">
                            	<div class="right__inputWrapper">
									<label> Họ và tên : ${user.name }</label>
								</div>
                            	<div class="right__inputWrapper">
                                	<label>Tên đăng nhập : ${user.username }</label>
                                </div>
                            	
                                <div class="right__inputWrapper">
                                	<label>Email : ${user.email }</label>
                                </div>
                               
								
                                <div class="right__inputWrapper">
                                    <label>SDT : ${user.phone }</label>
                                </div>
                                
                                <div class="right__inputWrapper">
									<label>Địa chỉ : ${user.address }</label>
								</div>
                                
                                <a href="${pageContext.request.contextPath }/customer/${user.id}"><button class="btn">Cập nhật thông tin</button></a>
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