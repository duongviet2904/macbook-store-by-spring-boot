<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ</title>
    <jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css" rel="stylesheet">
	<style>
	.slick-arrow{
		color:black;
		background-color:black;
		border-radius: 50%;
	}
	
	.slick-arrow:hover{
		color:black;
		background-color:black;
		border-radius: 50%;
	}
	
	.slick-arrow:focus{
		color:black;
		background-color:black;
		border-radius: 50%;
	}
	
	.product__item{
	 margin-right: 15px;
	 margin-left:15px;
	}
	
	.hihi{
		margin-top:45px;
	}
	.product__service__more a{
		color:black;
	}
	
	.product__service__more a:hover{
		color:black;
	}
	
	.inhome{
		text-align: center;
		font-size: 30px;
		font-weight: bolder;
		color: black;
		margin-top:30px;
		padding-bottom: 20px;
		border-bottom: 2px solid black;
	}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath}/images/our-blog8.jpeg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>MacBook Pro 16 inches 2019</h6>
                                <h2>Hoàn hiện tới từng chi tiết.</h2>
                                <p>Thiết kế sang trọng cùng với hiệu năng được tối ưu hoá sẽ mang đến cho bạn trải nghiệm tốt nhất!</p>
                                <a href="${pageContext.request.contextPath}/shop-details/mvvj2-mvvl2-macbook-pro-16-inch-2019-i7-2-6-16gb-512gb-1607678405370" class="primary-btn">Mua ngay
                                </a>
                                <div class="hero__social">
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/facebook.png"></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/twitter.png"></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/pinterest.png"></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/instagram.png"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath}/images/slide-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>MacBook Pro 13 inches 2020</h6>
                                <h2>Sự trở lại của magic keyboard.</h2>
                                <p>Mang lại bàn phím với thiết kế mới giúp đột phá trong trải nghiệm người dùng!</p>
                                <a href="${pageContext.request.contextPath}/shop-details/myd92-mydc2-macbook-pro-13-inch-2020-m1-8-core-cpu-8-core-gpu-512gb-ssd-1607679273222" class="primary-btn">Mua ngay
                                </a>
                                <div class="hero__social">
                                   	<a href="#"><img src="${pageContext.request.contextPath}/images/facebook.png"></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/twitter.png"></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/pinterest.png"></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/images/instagram.png"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

     <section class="product__service container">
    	<div class="inhome">
    		Sản phẩm bán chạy
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${productsHot}" var="item">
    			<div>
    			<div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
													<span class="label">Hot</span>
												<ul class="product__hover">
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
													<span class="label">Hot</span>
											<ul class="product__hover">
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
				                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
				                            </ul>
				                        </div>
										</c:otherwise>
									</c:choose>
			                        <div class="product__item__text">
			                            <h6>${item.title }</h6>
			                            <a href="javascript:void(0)" class="add-cart" onclick="cart.choose_product_to_cart(${item.id}, 1)">+ Thêm vào giỏ hàng</a>
			                            <div class="rating d-flex">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                            </div>
			                            <h5>$${item.price } <span style="text-decoration:line-through; font-size:14px; color:grey;">${item.price_old }</span></h5>
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
    </section>
    <section class="product__service container">
    	<div class="inhome">
    		Sản phẩm mới
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${productsNew}" var="item">
    			<div>
    			<div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
													<span class="label">New</span>
												<ul class="product__hover">
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
													<span class="label">New</span>
											<ul class="product__hover">
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
				                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
				                            </ul>
				                        </div>
										</c:otherwise>
									</c:choose>
			                        <div class="product__item__text">
			                            <h6>${item.title }</h6>
			                            <a href="javascript:void(0)" class="add-cart" onclick="cart.choose_product_to_cart(${item.id}, 1)">+ Thêm vào giỏ hàng</a>
			                            <div class="rating d-flex">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                            </div>
			                            <h5>$${item.price } <span style="text-decoration:line-through; font-size:14px; color:grey;">${item.price_old }</span></h5>
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
    </section>
    <section class="product__service container">
    	<div class="inhome">
    		Giảm giá
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${productsSale}" var="item">
    			<div>
    			<div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
													<span class="label">Sale</span>
												<ul class="product__hover">
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
													<span class="label">Sale</span>
											<ul class="product__hover">
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
				                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
				                            </ul>
				                        </div>
										</c:otherwise>
									</c:choose>
			                        <div class="product__item__text">
			                            <h6>${item.title }</h6>
			                            <a href="javascript:void(0)" class="add-cart" onclick="cart.choose_product_to_cart(${item.id}, 1)">+ Thêm vào giỏ hàng</a>
			                            <div class="rating d-flex">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                            </div>
			                            <h5>$${item.price } <span style="text-decoration:line-through; font-size:14px; color:grey;">${item.price_old }</span></h5>
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
    </section>
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2><span>MacBook Pro</span> <br />Ram 64Gb / SSD 8Tb</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="${pageContext.request.contextPath}/images/macbook16.jpg" alt="">
                        <div class="hot__deal__sticker">
                            <span>Giảm giá</span>
                            <h5>$4500</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>Ưu đãi cực lớn!</span>
                        <h2>MacBook Pro 16 inches</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Ngày</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Giờ</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Phút</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Giây</p>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/shop-details/mvvk2-mvvm2-macbook-pro-16-inch-2019-i9-2-3-64gb-8tb-1609917082161" class="primary-btn">Mua ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <c:forEach items="${categories}" var="category">
    	<c:if test="${category.products.size() >= 4 }">
    	<section class="product__service container">
    	<div class="product__service__bar">
    		<div class="product__service__name">${category.name }</div>
    		<div class="product__service__more"><a href="${pageContext.request.contextPath}/shop/${category.seo}">Xem thêm</a></div>
    	</div>
    	<div class="row hihi">
    		<c:forEach items="${products}" var="item">
    			<c:if test="${item.category.seo == category.seo}">
    			<div>
    			<div class="product__item">
				                    <c:choose>
										<c:when test = "${empty item.productImages }">
											<div class="product__item__pic set-bg" data-setbg="http://placehold.it/700x400">
												<c:if test="${item.ishot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${tem.isnew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${item.issale == true }">
													<span class="label">Sale</span>
												</c:if>
												<ul class="product__hover">
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
					                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
					                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
					                            </ul>
					                        </div>
										</c:when>
										<c:otherwise>
											<div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/file/upload/${item.productImages.get(0).path }">
											<c:if test="${item.ishot == true }">
													<span class="label">Hot</span>
												</c:if>
												<c:if test="${item.isnew == true }">
													<span class="label">Mới</span>
												</c:if>
												<c:if test="${item.issale == true }">
													<span class="label">Sale</span>
												</c:if>
											<ul class="product__hover">
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/heart.png" alt=""><span>Yêu thích</span></a></li>
				                                <li><a href="#"><img src="${pageContext.request.contextPath}/images/compare.png" alt=""><span>So sánh</span></a></li>
				                                <li><a href="${pageContext.request.contextPath}/shop-details/${item.seo}"><img src="${pageContext.request.contextPath}/images/search.png" alt=""><span>Chi tiết</span></a></li>
				                            </ul>
				                        </div>
										</c:otherwise>
									</c:choose>
			                        <div class="product__item__text">
			                            <h6>${item.title }</h6>
			                            <a href="javascript:void(0)" class="add-cart" onclick="cart.choose_product_to_cart(${item.id}, 1)">+ Thêm vào giỏ hàng</a>
			                            <div class="rating d-flex">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                                <img width="15px" src="${pageContext.request.contextPath}/images/grey-star.png">
			                            </div>
			                            <h5>$${item.price } <span style="text-decoration:line-through; font-size:14px; color:grey;">${item.price_old }</span></h5>
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
    			</c:if>
    		</c:forEach>
    	</div>
    </section>
    </c:if>
    </c:forEach>
    <section class="blog__section">
    	<div class="site__section" id="blog__section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <h3 class="section__sub__title">Tin tức</h3>
            <h2 class="section__title mb-3">Bài viết</h2>
          </div>
        </div>

        <div class="row">
          <div class="blog__section__item col-md-6 col-lg-4 mb-4 mb-lg-4">
            <div class="h-entry">
              <img src="${pageContext.request.contextPath}/images/blog-section1.jpg" alt="Image" class="img-fluid">
              <h2 class="font__size__regular"><a href="#" class="text-black">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a></h2>
              <div class="meta mb-4">Ham Brook <span class="mx-2">&bullet;</span> Jan 18, 2019<span class="mx-2">&bullet;</span> <a href="#">News</a></div>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus eligendi nobis ea maiores sapiente veritatis reprehenderit suscipit quaerat rerum voluptatibus a eius.</p>
              <p><a href="#">Continue Reading...</a></p>
            </div> 
          </div>
          <div class="blog__section__item col-md-6 col-lg-4 mb-4 mb-lg-4">
            <div class="h-entry">
              <img src="${pageContext.request.contextPath}/images/blog-section2.jpg" alt="Image" class="img-fluid">
              <h2 class="font__size__regular"><a href="#" class="text-black">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a></h2>
              <div class="meta mb-4">Ham Brook <span class="mx-2">&bullet;</span> Jan 18, 2019<span class="mx-2">&bullet;</span> <a href="#">News</a></div>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus eligendi nobis ea maiores sapiente veritatis reprehenderit suscipit quaerat rerum voluptatibus a eius.</p>
              <p><a href="#">Continue Reading...</a></p>
            </div> 
          </div>
          <div class="blog__section__item col-md-6 col-lg-4 mb-4 mb-lg-4">
            <div class="h-entry">
              <img src="${pageContext.request.contextPath}/images/blog-section3.jpg" alt="Image" class="img-fluid">
              <h2 class="font__size__regular"><a href="#" class="text-black">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a></h2>
              <div class="meta mb-4">Ham Brook <span class="mx-2">&bullet;</span> Jan 18, 2019<span class="mx-2">&bullet;</span> <a href="#">News</a></div>
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus eligendi nobis ea maiores sapiente veritatis reprehenderit suscipit quaerat rerum voluptatibus a eius.</p>
              <p><a href="#">Continue Reading...</a></p>
            </div> 
          </div>
        </div>
      </div>
    </div>
    </section>
    <jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include><script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js">
	</script> 
	<script>
	$('.hihi').slick({
		  infinite: true,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  slidesToShow: 4,
		  slidesToScroll: 1,
		  centerPadding: '60px',
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 4,
		        slidesToScroll: 1,
		        centerPadding: '60px',
		        infinite: true
		      }
		    },
		    {
		      breakpoint: 850,
		      settings: {
		        slidesToShow: 3,
		        centerPadding: '40px',
		        slidesToScroll: 1
		      }
		    },
		    {
			      breakpoint: 620,
			      settings: {
			        slidesToShow: 2,
			        centerPadding: '30px',
			        slidesToScroll: 1
			      }
			    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        centerPadding: '20px',
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ]
		});
	</script>
</body>
</html>