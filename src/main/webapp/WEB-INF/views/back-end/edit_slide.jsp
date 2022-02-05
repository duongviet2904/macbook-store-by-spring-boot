<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <div class="right__title">Báº£ng Äiá»u khiá»n</div>
                        <p class="right__desc"> Chá»nh sá»­a slide</p>
                        <div class="right__formWrapper">
                            <form action="" method="post">
                                <div class="right__inputWrapper">
                                    <label for="name">TÃªn slide</label>
                                    <input type="text" placeholder="TÃªn slide" value="This is the title">
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="url">Url</label>
                                    <input type="text" placeholder="Url" value="Url">
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="desc">MÃ´ táº£</label>
                                    <textarea name="" id="" cols="30" rows="10" placeholder="MÃ´ táº£">This is an article</textarea>
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="image">HÃ¬nh áº£nh</label>
                                    <input type="file">
                                </div>
                                <div class="right__inputImageReview"><img src="images/slide1.jpg" alt=""></div>
                                <button class="btn" type="submit">Cáº­p nháº­t</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/main.js"></script>
</body>
</html>