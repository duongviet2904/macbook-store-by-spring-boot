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
                        <p class="right__desc">ChÃ¨n admin</p>
                        <div class="right__formWrapper">
                            <form action="" method="post">
                                <div class="right__inputWrapper">
                                    <label for="name">TÃªn admin</label>
                                    <input type="text" placeholder="TÃªn admin" value="dangthimydung">
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="email">Email</label>
                                    <input type="text" placeholder="Email" value="dangthimydung@gmail.com">
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="password">Máº­t kháº©u</label>
                                    <input type="text" placeholder="Máº­t kháº©u">
                                </div>
                                <div class="right__inputWrapper">
                                    <label for="image">HÃ¬nh áº£nh</label>
                                    <input type="file">
                                </div>
                                <div class="right__inputImageReview"><img src="assets/profile1.jpg" alt=""></div>
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