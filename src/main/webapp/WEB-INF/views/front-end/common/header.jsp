<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">

			<%if(getEmailUserLogined().isEmpty()) {%>
			<a class="nav-link" href="${pageContext.request.contextPath}/login">ĐĂNG
				NHẬP </a>
			<%
				} else {
			%>
			<a class="nav-link" href="${pageContext.request.contextPath}/logout">ĐĂNG
				XUẤT</a>
			<%
				}
			%>
			<a href="#">FAQs</a>
            </div>
            <div class="offcanvas__top__hover">
                <select>
                    <option value="1">USD</option>
                    <option value="2">VND</option>
                </select>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="${pageContext.request.contextPath}/images/search.png" alt=""></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""></a>
			<a href="${pageContext.request.contextPath}/shopping-cart"><img src="${pageContext.request.contextPath}/images/cart.png" alt=""> <span id="soLuong">${SL_SP_GIO_HANG }</span></a>
            <div class="price">$${total }</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>Miễn phí vận chuyển và 1 đổi 1 trong vòng 12 tháng</p>
        </div>
    </div>
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 12-month return or refund guarantee.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <%if(getEmailUserLogined().isEmpty()) {%>
									<a class="nav-link" href="${pageContext.request.contextPath}/login">ĐĂNG
										NHẬP </a>
									<%
										} else {
									%>
									<a class="nav-link" href="${pageContext.request.contextPath}/logout">ĐĂNG
										XUẤT</a>
									<%
										}
									%>
                                <a href="#">FAQs</a>
                            </div>
                            <div class="header__top__hover">
                               <select>
                               		<option value="1">USD</option>
                               		<option value="2">VND</option>
                               </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                       <a href="${pageContext.request.contextPath}/">DUONG.MAC</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="${cate == 'home' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/" >Home</a></li>
                            <li class="${cate == 'shop' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/shop">Shop</a></li>
                            <li class="${cate == 'page' ? 'active' : '' }"><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                                    <li><a href="${pageContext.request.contextPath}/shopping-cart">Shopping Cart</a></li>
                                </ul>
                            </li>
                            <li class="${cate == 'blog' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/blog">Blog</a></li>
                            <li class="${cate == 'contact' ? 'active' : '' }"><a href="${pageContext.request.contextPath}/contact">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="${pageContext.request.contextPath}/images/search.png" alt=""></a>
                        	<sec:authorize access="hasAuthority('ADMIN')">
							<a href="${pageContext.request.contextPath}/admin"><img src="${pageContext.request.contextPath}/images/user-profile.png" alt=""></a>
							</sec:authorize>
							<sec:authorize access="hasAuthority('GUEST')">
								<a href="${pageContext.request.contextPath}/customer"><img src="${pageContext.request.contextPath}/images/user-profile.png" alt=""></a>
							</sec:authorize>
                        <a href="${pageContext.request.contextPath}/shopping-cart"><img src="${pageContext.request.contextPath}/images/cart.png" alt=""> <span>${SL_SP_GIO_HANG }</span></a>
                        <div class="price">$${total }</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><img src="${pageContext.request.contextPath}/Images/menu.png"></div>
        </div>
    </header>