<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="left">
                    <span class="left__icon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                    <div class="left__content">
                        <div class="left__logo">DUONG.MAC</div>
                        <div class="left__profile">
                            <div class="left__image"><img src="${pageContext.request.contextPath}/assets/admin-avatar.jpg" alt=""></div>
                            <p class="left__name">${user.name }</p>
                            <p class="left__name">${user.email }</p>
                        </div>
                        <ul class="left__menu">
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath }/customer" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-dashboard.svg" alt="">Thông tin</a>
                            </li>
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath}/customer/my-orders" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-book.svg" alt="">Đon hàng</a>
                            </li>
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath}/" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-logout.svg" alt="">Trang chủ</a>
                            </li>
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath}/logout" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-logout.svg" alt="">Đăng Xuất</a>
                            </li>
                            
                        </ul>
                    </div>
                </div>