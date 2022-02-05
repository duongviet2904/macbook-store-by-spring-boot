<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   
<!DOCTYPE html>
<html>
<head>
    <title>Cửa hàng</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    <style>
	    .shop__sidebar__categories .active{
	    	color:black;
	    }
    </style>
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
                            <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                            <img src="${pageContext.request.contextPath}/images/right-arrow.png">
                            <span>Cửa hàng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="/shop" method="post">
                                <input type="text" placeholder="Search..." name="keyword">
                                <button type="submit"><img src="${pageContext.request.contextPath}/images/search.png"></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Danh mục
                                        <img src="${pageContext.request.contextPath}/images/arrow-down.png"></a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
	                                                <c:forEach var = "category" items = "${categories }">
														<li><a href="${pageContext.request.contextPath}/shop/${category.seo}" class="${currentCategorySeo==category.seo ? 'active' : '' }"> ${category.name }</a></li>
													</c:forEach>
												</ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">Lọc giá sản phẩm
                                        <img src="${pageContext.request.contextPath}/images/arrow-down.png"></a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?priceBegin=${'0.00'}&priceEnd=${'100.00'}">$0.00 - $100.00</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?priceBegin=${'100.00'}&priceEnd=${'1000.00'}">$100.00 - $1000.00</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?priceBegin=${'1000.00'}&priceEnd=${'1500.00'}">$1000.00 - $1500.00</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?priceBegin=${'1500.00'}&priceEnd=${'2000.00'}">$1500.00 - $2000.00</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?priceBegin=${'2000.00'}&priceEnd=${'2500.00'}">$2000.00 - $2500.00</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?priceBegin=${'2500.00'}">2500.00+</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Kích thước
                                        <img src="${pageContext.request.contextPath}/images/arrow-down.png"></a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="13inches">13 inches
                                                    <input type="radio" id="xs">
                                                </label>
                                                <label for="15inches">15 inches
                                                    <input type="radio" id="sm">
                                                </label>
                                                <label for="12inches">12 inches
                                                    <input type="radio" id="md">
                                                </label>
                                                <label for="11inches">11 inches
                                                    <input type="radio" id="md">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseSix">Thẻ
                                        <img src="${pageContext.request.contextPath}/images/arrow-down.png"></a>
                                    </div>
                                    <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__tags">
                                                <a href="${pageContext.request.contextPath}/shop/search-by/${'Macbook Pro' }">Macbook pro</a>
                                                <a href="${pageContext.request.contextPath}/shop/search-by/${'Macbook Air' }">Macbook Air</a>
                                                <a href="${pageContext.request.contextPath}/shop/search-by/${'Mouse' }">Mouse</a>
                                                <a href="${pageContext.request.contextPath}/shop/search-by/${'Keyboard' }">Keyboard</a>
                                                <a href="${pageContext.request.contextPath}/shop/search-by/${'Touch Pad' }">Touch Pad</a>
                                                <a href="${pageContext.request.contextPath}/shop/search-by/${'USB Hub' }">USB Hub</a>
                                                <a href="${pageContext.request.contextPath}/shop/search-by/${'Service' }">Service</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>Hiển thị ${products.size()} / ${size } kết quả</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sắp xếp giá:</p>
                                    <select onchange="location = this.value;" style="width:20px;">
                                    	<option></option>
                                        <option value="${pageContext.request.contextPath}/shop/${currentCategorySeo}?value=${'asc'}">Thấp đến cao</option>
                                        <option value="${pageContext.request.contextPath}/shop/${currentCategorySeo}?value=${'desc'}">Cao đến thấp</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="product" items="${products }">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
			                    <div class="product__item">
				                    <c:choose>
										<c:when test = "${empty product.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
												<c:if test="${product.ishot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${product.isnew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${product.issale == true }">
													<span class="label">Sale</span>
												</c:if>
												<ul class="product__hover">
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${product.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${product.productImages.get(0).path }">
											<c:if test="${product.ishot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${product.isnew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${product.issale == true }">
													<span class="label">Sale</span>
												</c:if>
											<ul class="product__hover">
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
				                                <li><a href="${pageContext.request.contextPath}/shop-details/${product.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
				                            </ul>
				                        </div>
										</c:otherwise>
									</c:choose>
			                        <div class="product__item__text">
			                            <h6>${product.title }</h6>
			                            <a href="javascript:void(0)" class="add-cart" onclick="cart.choose_product_to_cart(${product.id}, 1)">+ Thêm vào giỏ hàng</a>
			                            <div class="rating">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                            </div>
			                            <h5>$${product.price } <span style="text-decoration:line-through; font-size:14px; color:grey;">${product.price_old }</span></h5>
			                            <div class="product__color__select">
			                                <label class="silver" for="pc-1">
			                                    <input type="radio" id="pc-1">
			                                </label>
			                                <label class="active grey" for="pc-2">
			                                    <input type="radio" id="pc-2">
			                                </label>
			                            </div>
			                        </div>
			                    </div>
			                 </div>
                        </c:forEach>
                    </div>
                     
                    <div class="row">
                        <div class="col-lg-12">
                            	
								  <div class="product__pagination">
									  	<c:if test="${currentPage == 1 && totalPage > 1}">
									  		<c:forEach begin="1" end="${totalPage}" varStatus="loop"> 
									  			<c:if test="${loop.index == currentPage }">
									  			<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${loop.index}" class="active"><button type="button" class="btn btn-outline-dark">${loop.index }</button></a>
									  			</c:if>
									  			<c:if test="${currentPage != loop.index }">
									  			<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${loop.index}"><button type="button" class="btn btn-outline-dark">${loop.index }</button></a>
									  			</c:if>
									  		</c:forEach>
										  	<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${currentPage + 1}"><button type="button" class="btn btn-outline-dark">&raquo;</button></a>
									  	</c:if>
									  	<c:if test="${currentPage == totalPage && totalPage > 1}">
									  	<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${currentPage - 1}"><button type="button" class="btn btn-outline-dark">&laquo;</button></a>
									  		<c:forEach begin="1" end="${totalPage}" varStatus="loop"> 
									  			<c:if test="${loop.index == currentPage }">
									  			<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${loop.index}" class="active"><button type="button" class="btn btn-outline-dark">${loop.index }</button></a>
									  			</c:if>
									  			<c:if test="${currentPage != loop.index }">
									  			<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${loop.index}"><button type="button" class="btn btn-outline-dark">${loop.index }</button></a>
									  			</c:if>
									  		</c:forEach>
									  	</c:if>
									  	<c:if test="${currentPage < totalPage  && currentPage > 1 && totalPage > 1}">
										  	<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${currentPage - 1}"><button type="button" class="btn btn-outline-dark">&laquo;</button></a>
										  	<c:forEach begin="1" end="${totalPage}" varStatus="loop"> 
									  			<c:if test="${loop.index == currentPage }">
									  			<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${loop.index}" class="active"><button type="button" class="btn btn-outline-dark">${loop.index }</button></a>
									  			</c:if>
									  			<c:if test="${currentPage != loop.index }">
									  			<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${loop.index}"><button type="button" class="btn btn-outline-dark">${loop.index }</button></a>
									  			</c:if>
									  		</c:forEach>
										  	<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=${currentPage + 1}"><button type="button" class="btn btn-outline-dark">&raquo;</button></a>
									  	</c:if>
									  	<c:if test="${totalPage == 1}">
										  	<a href="${pageContext.request.contextPath}/shop/${currentCategorySeo}?page=1" class="active"><button type="button" class="btn btn-outline-dark">1</button></a>
										  	
									  	</c:if>
                            	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/page.js"></script>
    <jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</body>
</html>