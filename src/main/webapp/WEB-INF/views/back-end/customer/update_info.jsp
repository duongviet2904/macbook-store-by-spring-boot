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
                            
                            <form:form action="${pageContext.request.contextPath}/customer-update" method="post" modelAttribute="user" >
                            	<form:hidden path="id"/>
                            	
                            	<div class="right__inputWrapper">
									<label> Họ và tên :</label>
									<form:input type="text" class="form-control" path="name"/>
								</div>
                            	<div class="right__inputWrapper">
                                	<label>Tên đăng nhập :</label>
									<form:input type="text" class="form-control" path="username"/>
                                </div>
                            	
                                <div class="right__inputWrapper">
                                	<label>Email :</label>
									<form:input type="text" class="form-control" path="email"/>
                                </div>
                               
								
                                <div class="right__inputWrapper">
                                    <label>SDT :</label>
									<form:input type="text" class="form-control" path="phone"/>
                                </div>
                                
                                <div class="right__inputWrapper">
									<label>Địa chỉ :</label>
									<form:input type="text" class="form-control" path="address"/>
								</div>
								
								<div class="right__inputWrapper">
									<label>Địa chỉ :</label>
									<form:input type="password" class="form-control" path="password"/>
								</div>
                                
                                <button class="btn" type="submit">Lưu</button>
                                
                            </form:form>
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