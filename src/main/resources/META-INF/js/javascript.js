 $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

$('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });


$(".hero__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: false,
        nav: true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,

    });

$('.collapse').on('shown.bs.collapse', function () {
        $(this).prev().addClass('active');
    });

    $('.collapse').on('hidden.bs.collapse', function () {
        $(this).prev().removeClass('active');
    });

$(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").on('click', function () {
        $(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").removeClass('active');
        $(this).addClass('active');

    });

$(".nice-scroll").niceScroll({
        cursorcolor: "#0d0d0d",
        cursorwidth: "5px",
        background: "#e5e5e5",
        cursorborder: "",
        autohidemode: true,
        horizrailenabled: false
    });

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    if(mm == 12) {
        mm = '01';
        yyyy = yyyy + 1;
    } else {
        mm = parseInt(mm) + 1;
        mm = String(mm).padStart(2, '0');
    }
    var timerdate = mm + '/' + dd + '/' + yyyy;

$("#countdown").countdown(timerdate, function (event) {
        $(this).html(event.strftime("<div class='cd-item'><span>%D</span> <p>Days</p> </div>" + "<div class='cd-item'><span>%H</span> <p>Hours</p> </div>" + "<div class='cd-item'><span>%M</span> <p>Minutes</p> </div>" + "<div class='cd-item'><span>%S</span> <p>Seconds</p> </div>"));
    });

$('.filter__controls li').on('click', function () {
            $('.filter__controls li').removeClass('active');
            $(this).addClass('active');
        });
if ($('.product__filter').length > 0) {
            var containerEl = document.querySelector('.product__filter');
            var mixer = mixitup(containerEl);
    }

    $(".canvas__open").on('click', function () {
        $(".offcanvas-menu-wrapper").addClass("active");
        $(".offcanvas-menu-overlay").addClass("active");
    });

    $(".offcanvas-menu-overlay").on('click', function () {
        $(".offcanvas-menu-wrapper").removeClass("active");
        $(".offcanvas-menu-overlay").removeClass("active");
    });

 $('.search-switch').on('click', function () {
        $('.search-model').fadeIn(400);
    });

    $('.search-close-switch').on('click', function () {
        $('.search-model').fadeOut(400, function () {
            $('#search-input').val('');
        });
    });

 // $("select").niceSelect();


//   $('.service__applecare').slick({
//   infinite: false,
//   speed: 300,
//   slidesToShow: 4,
//   slidesToScroll: 1,
//   responsive: [
//     {
//       breakpoint: 1024,
//       settings: {
//         slidesToShow: 3,
//         slidesToScroll: 3,
//         infinite: true,
//         dots: true
//       }
//     },
//     {
//       breakpoint: 600,
//       settings: {
//         slidesToShow: 2,
//         slidesToScroll: 2
//       }
//     },
//     {
//       breakpoint: 480,
//       settings: {
//         slidesToShow: 1,
//         slidesToScroll: 1
//       }
//     }
//   ]
// });

  function showM(obj){
    if(obj.find('.edit-child').hasClass('show')){
        obj.find('.edit-child').removeClass('show');
    }else{
        obj.find('.edit-child').addClass('show');
    }
  }

  function toggleSidebar(){
    event.stopPropagation();
    $('.sidebar').addClass('show');
  }

  $('html, body').on('click',function(){
    if($('.sidebar').hasClass('show')){
        $('.sidebar').removeClass('show');
    }
  })
  
  var contact = {
		
		/**
		 * https://www.w3schools.com/js/js_json_syntax.asp
		 */
		saveContact: function() {
			var data = {};
			data["name"] = $("#name").val();
			data["email"] = $("#email").val();
			data["message"] = $("#message").val();
			
			$.ajax({
				url: "/save-contact-with-ajax",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if(jsonResult.status == 200) {
						alert("Gui phan hoi thanh cong");
						$("#name").val("");
						$("#email").val("");
						$("#message").val("");
					} else {
						alert('loi');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		}
	};
	
	var notification = {
		
		/**
		 * https://www.w3schools.com/js/js_json_syntax.asp
		 */
		saveEmail: function() {
			var data = {};
			data["email"] = $("#email").val();
			
			$.ajax({
				url: "/save-notification-email",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if(jsonResult.status == 200) {
						alert("Dang ki nhan thong bao thanh cong!");
						$("#email").val("");
					} else {
						alert('Lỗi !');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		}
	};
var cart = {

	choose_product_to_cart: function(maSanPham, soluong) {
			var data = {};
			data["maSanPham"] = maSanPham;
			data["soluong"] = soluong;
			
			$.ajax({
				url: "/choose-product-to-cart",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if(jsonResult.status == 200) {
						$("#soLuong").html(jsonResult.data);
						alert("Them san pham vao gio hang thanh cong!");
					} else {
						alert('loi');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		}
};


 
 