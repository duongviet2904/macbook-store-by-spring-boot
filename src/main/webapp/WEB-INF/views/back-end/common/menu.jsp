<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="com.devpro.entities.User"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
    
<%!
	public String getEmailUserLogined() {
		String email = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			email = ((User)principal).getEmail();
		}
		return email;
	}
%>
    
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
                            <p class="left__name">Duong Viet</p>
                            <p class="left__name">(<%= getEmailUserLogined() %>)</p>
                            
                        </div>
                        <ul class="left__menu">
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath }/admin" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-dashboard.svg" alt="">Dashboard</a>
                            </li>
                            <li class="left__menuItem">
                                <div class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-tag.svg" alt="">Sản Phẩm<img class="left__iconDown" src="${pageContext.request.contextPath}/assets/arrow-down.svg" alt=""></div>
                                <div class="left__text">
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/product-add">Thêm Sản Phẩm</a>
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/products">Xem Sản Phẩm</a>
                                </div>
                            </li>
                            <li class="left__menuItem">
                                <div class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-edit.svg" alt="">Danh Mục SP<img class="left__iconDown" src="${pageContext.request.contextPath}/assets/arrow-down.svg" alt=""></div>
                                <div class="left__text">
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/category-add">Thêm Danh Mục</a>
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/categories">Xem Danh Mục</a>
                                </div>
                            </li>
                            <li class="left__menuItem">
                                <div class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-settings.svg" alt="">Slide<img class="left__iconDown" src="${pageContext.request.contextPath}/assets/arrow-down.svg" alt=""></div>
                                <div class="left__text">
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/slide-add">Thêm Slide</a>
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/slides">Xem Slide</a>
                                </div>
                            </li>
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath}/admin/customers" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-users.svg" alt="">Khách Hàng</a>
                            </li>
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath}/admin/orders" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-book.svg" alt="">Đơn Đặt Hàng</a>
                            </li>
                            <li class="left__menuItem">
                                <a href="${pageContext.request.contextPath}/admin/contacts" class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-pencil.svg" alt="">Phản hồi</a>
                            </li>
                            <li class="left__menuItem">
                                <div class="left__title"><img src="${pageContext.request.contextPath}/assets/icon-user.svg" alt="">Admin<img class="left__iconDown" src="${pageContext.request.contextPath}/assets/arrow-down.svg" alt=""></div>
                                <div class="left__text">
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/decentralization-add">Thêm Admin</a>
                                    <a class="left__link" href="${pageContext.request.contextPath}/admin/decentralization">Xem Admins</a>
                                </div>
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