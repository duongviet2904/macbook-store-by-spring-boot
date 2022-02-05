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
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
    <style>
    .checkBox{
    	display:inline-block;
    	font-size: 25px;
    }
    
    .checkBox span{
    	margin-right: 20px;
    	padding-right: 20px;
    	
    }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="dashboard">
                <jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
                <div class="right">
                    <div class="right__content">
                        <div class="right__title">Bảng điều khiển</div>
                        <p class="right__desc">Chèn danh mục</p>
                        <div class="right__formWrapper">
                            
                            <form:form action="${pageContext.request.contextPath}/admin/product-add" method="post" modelAttribute="product" enctype="multipart/form-data">
                            	<form:hidden path="id"/>
                            	
                            	<div class="right__inputWrapper">
									<label>Tiêu đề</label>
									<form:input type="text" class="form-control" path="title"/>
									<small id="emailHelp" class="form-text text-muted">
											Tối đa 15 kí tự.
									</small>
								</div>
                            	
                                <div class="right__inputWrapper">
                                	<label>Danh mục</label>
									<form:select class="form-control form-control-line" path="category.id"> <!-- product.getCategory().setId() -->
										<form:options items="${categories}" itemValue="id" itemLabel="name"/>
									</form:select>
                                </div>
                               
                                <div class="right__inputWrapper">
                                    <label>Ảnh</label>
                                    <input type="file" name="product_images" class="form-control" multiple="multiple">
                                </div>
                                
                                <div>
									<form:checkbox path="ishot"  class="checkBox"/><span>Hot</span>
									<form:checkbox path="issale" class="checkBox"/><span>Sale</span>
									<form:checkbox path="isnew" class="checkBox"/><span>New</span>
								</div>
                                
                                <div class="right__inputWrapper">
									<label>Giá cũ</label>
									<form:input type="text" class="form-control" path="price_old"/>
									<small id="emailHelp" class="form-text text-muted">
											Tối đa 15 kí tự.
									</small>
								</div>
								
								<div class="right__inputWrapper">
									<label>Giá bán</label>
									<form:input type="text" class="form-control" path="price"/>
									<small id="emailHelp" class="form-text text-muted">
											Tối đa 15 kí tự.
									</small>
								</div>
								
                                <div class="right__inputWrapper">
                                    <label>Nhãn sản phẩm</label>
                                    <select name="">
                                        <option disabled selected>Nhãn sản phẩm</option>
                                        <option value="new">Mới</option>
                                        <option value="sale">Giảm giá</option>
                                    </select>
                                </div>
                                
                                <div class="right__inputWrapper">
									<label>Mô tả nhanh</label>
									<form:input type="text" class="form-control" path="short_description"/>
										<small id="emailHelp" class="form-text text-muted">
											Sẽ hiển thị tại màn hình danh sách sản phẩm.
										</small>
								</div>
                               
                                <div class="right__inputWrapper">
                                    <label>Mô tả</label>
									<form:textarea id="txtDetailDescription" class="form-control" path="detail_description"/>
                                </div>
                                
                                <button class="btn" type="submit">Thêm</button>
                                
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
    <jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
    <script>

	$('#txtDetailDescription').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
</body>
</html>