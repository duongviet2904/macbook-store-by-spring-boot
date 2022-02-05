<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
                        <p class="right__desc">Xem slides</p>
                        <div class="right__slidesWrapper">
                            <div class="right__slides">
                                <div class="right__slide">
                                    <div class="right__slideTitle">This is the title</div>
                                    <div class="right__slideImage"><img src="images/slide1.jpg" alt=""></div>
                                    <div class="right__slideIcons">
                                        <a class="right__slideIcon" href="edit_slide.html"><img src="assets/icon-pencil.svg" alt=""></a>
                                        <a class="right__slideIcon" href=""><img src="assets/icon-trash.svg" alt=""></a>
                                    </div>
                                </div>
                                <div class="right__slide">
                                    <div class="right__slideTitle">This is the title</div>
                                    <div class="right__slideImage"><img src="images/slide2.jpg" alt=""></div>
                                    <div class="right__slideIcons">
                                        <a class="right__slideIcon" href="edit_slide.html"><img src="assets/icon-pencil.svg" alt=""></a>
                                        <a class="right__slideIcon" href=""><img src="assets/icon-trash.svg" alt=""></a>
                                    </div>
                                </div>
                                <div class="right__slide">
                                    <div class="right__slideTitle">This is the title</div>
                                    <div class="right__slideImage"><img src="images/slide3.jpg" alt=""></div>
                                    <div class="right__slideIcons">
                                        <a class="right__slideIcon" href="edit_slide.html"><img src="assets/icon-pencil.svg" alt=""></a>
                                        <a class="right__slideIcon" href=""><img src="assets/icon-trash.svg" alt=""></a>
                                    </div>
                                </div>
                                <div class="right__slide">
                                    <div class="right__slideTitle">This is the title</div>
                                    <div class="right__slideImage"><img src="images/slide4.jpg" alt=""></div>
                                    <div class="right__slideIcons">
                                        <a class="right__slideIcon" href="edit_slide.html"><img src="assets/icon-pencil.svg" alt=""></a>
                                        <a class="right__slideIcon" href=""><img src="assets/icon-trash.svg" alt=""></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
</body>
</html>