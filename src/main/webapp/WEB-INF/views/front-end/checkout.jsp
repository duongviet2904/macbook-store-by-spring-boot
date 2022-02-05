<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<title>Check out</title>
<jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Cửa hàng</h4>
						<div class="breadcrumb__links">
							<a href="${pageContext.request.contextPath}/">Trang chủ</a> <img
								src="${pageContext.request.contextPath}/images/right-arrow.png">
							<span>Hoá đơn</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form action="${pageContext.request.contextPath}/save-cart" method="post">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<h6 class="coupon__code">
								<img src="${pageContext.request.contextPath}/images/icon4.png">
								Bạn đã có mã giảm giá <a href="#">bấm vào đây</a> để nhận
							</h6>
							<h6 class="checkout__title">Chi tiết hoá đơn</h6>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Họ đệm<span>*</span>
										</p>
										<input type="text" name="firstName">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Tên<span>*</span>
										</p>
										<input type="text" name="lastName">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									Địa chỉ<span>*</span>
								</p>
								<input type="text"
									placeholder="Apartment, suite, unite ect (optinal)"
									name='address'>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Sđt<span>*</span>
										</p>
										<input type="text" name='phone'>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Email<span>*</span>
										</p>
										<input type="text" name="email">
									</div>
								</div>
							</div>

							<div class="checkout__input__checkbox">
								<label for="diff-acc"> Lưu ý về đơn hàng của bạn, đặc
									biệt là địa chỉ giao hàng <input type="checkbox" id="diff-acc">
									<span class="checkmark"></span>
								</label>
							</div>
							<div class="checkout__input">
								<p>
									Ghi chú<span>*</span>
								</p>
								<input type="text"
									placeholder="Notes about your order, e.g. special notes for delivery."
									name="note">
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="checkout__order">
								<h4 class="order__title">Đơn hàng</h4>
								<table class="table table-striped">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">Tên sản phẩm</th>
											<th scope="col">Số lượng</th>
											<th scope="col">Đơn giá</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${CART.cartItems }" var="item" varStatus="loop">
											<tr>
												<th scope="row">${loop.index + 1}</th>
												<td>${item.tenSanPham }</td>
												<td>${item.soluong }</td>
												<td>${item.giaban }</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
								<ul class="checkout__total__all">
									<li>Tổng <span>$${total }</span></li>
								</ul>
								<div class="checkout__input__checkbox">
									<label for="acc-or"> Tạo tài khoản mới? <input
										type="checkbox" id="acc-or"> <span class="checkmark"></span>
									</label>
								</div>
								<p>Lựa chọn phương thức thanh toán.</p>
								<div class="checkout__input__checkbox">
									<label for="payment"> Thẻ tín dụng <input
										type="checkbox" id="payment"> <span class="checkmark"></span>
									</label>
								</div>
								<div class="checkout__input__checkbox">
									<label for="paypal"> Trả khi nhận hàng <input
										type="checkbox" id="paypal"> <span class="checkmark"></span>
									</label>
								</div>
								<button type="submit" class="site-btn">Đặt mua</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</body>
</html>