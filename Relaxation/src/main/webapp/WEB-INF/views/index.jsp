<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Relaxation</title>

<!-- Favicon -->
<link rel="icon" href="./assets/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="./assets/style.css">

<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
		crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
		<style>
		a {
    color: black;
    text-decoration: none;
}


		</style>

<body>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="lds-ellipsis">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>

	<!-- ##### Header Area Start ##### -->
	<header class="header-area">
		<!-- Navbar Area -->
		<div class="oneMusic-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">

					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="oneMusicNav">

						<!-- Nav brand -->
						<a href="goIndex" class="nav-brand"><img
							src="./assets/img/core-img/로고.png" alt=""></a>


						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>
						<form action="searchMusicAlbums" method="get">
						<div class="searchBox">
							<input class="searchInput" type="text" name="query"
								placeholder="검색어를 입력하세요.">
							<button class="searchButton">
								<i class="material-icons"> <img
									src="./assets/img/bg-img/돋보기.png">

								</i>
							</button>
						</div>
						</form>


						<!-- Menu -->
						<div class="classy-menu">

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- Nav Start -->

							<div class="classynav">
								<ul>
										<li><a href="goIndex">Home</a></li>
										<li><a href="goAlbums">Albums</a></li>
										<li><a href="goFacemusic">Face Music</a></li>
								
									<!--<li><a href="contact.html">Contact</a></li>-->
								</ul>

								<!-- Login/Register & Cart Button -->
								<div
									class="login-register-cart-button d-flex align-items-center"></div>

								<ul>
									<li><a href="#">MENU</a>
										<ul class="dropdown">
											<c:if test="${empty user}">
												<li><a href="goLogin">Login</a></li>
											</c:if>
											<c:if test="${!empty user}">
												<li><a href="goMypage">My page</a></li>
												<li><a href="userLogout">Logout</a></li>
											</c:if>
										</ul></li>
								</ul>
							</div>
							<!-- Nav End -->

						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ##### Header Area End ##### -->

	<!-- ##### Hero Area Start ##### -->
	<section class="hero-area">
		<div class="hero-slides owl-carousel">
			<!-- Single Hero Slide -->
			<div
				class="single-hero-slide d-flex align-items-center justify-content-center">
				<!-- Slide Img -->
				<div class="slide-img bg-img"
					style="background-image: url(./assets/img/bg-img/배경7.jpg);"></div>
				<!-- Slide Content -->
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="hero-slides-content text-center">
								<h6 data-animation="fadeInUp" data-delay="100ms">Latest
									album</h6>
								<h2 data-animation="fadeInUp" data-delay="300ms">
									Relaxation <span>Relaxation</span>
								</h2>
								<!--<a data-animation="fadeInUp" data-delay="500ms" href="#" class="btn oneMusic-btn mt-50">Discover <i class="fa fa-angle-double-right"></i></a> -->
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Hero Slide -->

		</div>
	</section>
	<!-- ##### Hero Area End ##### -->
	<!-- ##### Miscellaneous Area Start ##### -->
	<section class="miscellaneous-area section-padding-100-0">
		<div class="container">
			<div class="row">
				<!-- ***** Weeks Top ***** -->
				<div class="col-12 col-lg-4">
					<div class="new-hits-area mb-100">
						<div class="section-heading text-left mb-50 wow fadeInUp"
							data-wow-delay="50ms">
							<p>See what’s new</p>
							<h2>이번주 TOP 100</h2>
						</div>
						<%--맨왼쪽 테이블--%>
						<c:forEach var="artist" items="${findRandom7}" varStatus="status">
							<div
								class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
								data-wow-delay="${status.index * 50}ms">
								<div class="first-part d-flex align-items-center">
									<div class="thumbnail">
										<img src="${artist.rmuAlbumImg}" style="cursor: pointer"
											onclick="PopupCenter('goPlayer?img=${artist.rmuSeq}','asdfo8or');">
									</div>
									<div class="content-">
										<h6>${artist.rmuSinger}</h6>
										<p>${artist.rmuTitle}</p>
									</div>
								</div>
								<audio preload="auto" controls>
									<source src="audio/dummy-audio.mp3">
								</audio>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- ***** New Hits Songs ***** -->
				<div class="col-12 col-lg-4">
					<div class="new-hits-area mb-100">
						<div class="section-heading text-left mb-50 wow fadeInUp"
							data-wow-delay="50ms">
							<p>See what’s new</p>
							<h2>최신앨범</h2>
						</div>

						<c:forEach var="item" items="${findRandom7BySinger}"
							varStatus="status">
							<div
								class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
								data-wow-delay="100ms">
								<div class="first-part d-flex align-items-center">
									<div class="thumbnail">
										<img src="${item.rmuAlbumImg}" style="cursor: pointer"
											onclick="PopupCenter('?img=${item.rmuAlbumImg}');">
									</div>
									<div class="content-">
										<h6>${item.rmuAlbum}</h6>
										<p>${item.rmuTitle}</p>
									</div>
								</div>
								<audio preload="auto" controls>
									<source src="audio/dummy-audio.mp3">
								</audio>
							</div>
						</c:forEach>


					</div>
				</div>

				<!-- ***** Popular Artists ***** -->
				<div class="col-12 col-lg-4">
					<div class="popular-artists-area mb-100">
						<div class="section-heading text-left mb-50 wow fadeInUp"
							data-wow-delay="50ms">
							<p>See what’s new</p>
							<h2>Popular Artist</h2>
						</div>
						<c:forEach var="artist" items="${top7Artist}">
							<tr>
								<td>
									<div
										class="single-artists d-flex align-items-center wow fadeInUp"
										data-wow-delay="400ms">
										<div class="thumbnail">
											<img src="${artist[1]}" alt="">
										</div>
										<div class="content-">
											<p>${artist[0]}</p>
										</div>
									</div>
								</td>
								<td></td>
							</tr>
						</c:forEach>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!-- ##### Miscellaneous Area End ##### -->


	<!-- ##### Buy Now Area Start ##### -->
	<section
		class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="section-heading style-2">
						<p>인기 있어요</p>
						<h2>팬들이 좋아하는 아티스트</h2>
					</div>
				</div>
			</div>

			<div class="row">


				<c:forEach var="album" items="${find12}">
					<!-- Single Album Area -->
					<div class="col-12 col-sm-6 col-md-4 col-lg-2">
						<div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
							<div class="album-thumb">
								<img src="${album[1]}" alt="">

								<!-- Play Icon -->
								<div class="play-button">
										<a href="${album[2]}" target="_blank" class="video--play--btn">
											<span class="icon-play-button"> <img
												src="./assets/img/bg-img/재생button.png" alt="Play Button">
										</span>
										</a>
								</div>
							</div>
							<div class="album-info">
								<a href="">
									<h5>${album[0]}</h5>
								</a>
								<p></p>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>

	</section>
	<!-- ##### Buy Now Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area">
		<div class="container">
			<div class="row d-flex flex-wrap align-items-center">
				<div class="col-12 col-md-6">
					<a href="#"><img src="./assets/img/core-img/footer로고.PNG"
						alt=""></a>
					<p class="copywrite-text">
						<a href="goPlayer">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>document.write(new Date().getFullYear());</script>
							<a>스마트인재개발원 | 광주광역시 남구 송암로 60 | 대표이사 : 김준우 </a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

				<div class="col-12 col-md-6">
					<div class="footer-nav">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="goAlbums">Albums</a></li>
							<li><a href="goFacemusic">Face Music</a></li>
							<li><a href="goMypage">My page</a></li>
							<!--<li><a href="#">Contact</a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="back-to-top-wrapper">
  <img id="back-to-top" src="./assets/img/bg-img/귀염이.png" alt="Back to top">
</div>
	</footer>
	<!-- ##### Footer Area Start ##### -->

	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="./assets/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="./assets/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="./assets/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="./assets/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="./assets/js/active.js"></script>
	
	<script scr="./assets/js/main.js"></script>

	<script type="text/javascript">
         function fnImgPop(url){
          var img=new Image();
          img.src=url;
          var img_width=img.width;
          var win_width=img.width+25;
          var img_height=img.height;
          var win=img.height+30;
          var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
          OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
         }
        </script>
	<script type="text/javascript">
    function PopupCenter(url, title, w, h) {
        var left = (screen.width/2)-(w/2);
        var top = (screen.height/2)-(h/2);
        return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    } 
    </script>

<script>
$(document).ready(function(){
	  // 이미지를 기본적으로 숨김
	  $('#back-to-top').hide();

	  // 사용자가 스크롤할 때마다 실행
	  $(window).scroll(function(){
	    // 스크롤 위치가 100px 이상이면 이미지를 보임, 그렇지 않으면 이미지를 숨김
	    if ($(this).scrollTop() > 100) {
	      $('#back-to-top').fadeIn();
	    } else {
	      $('#back-to-top').fadeOut();
	    }
	  });

	  // 이미지를 클릭하면 페이지 맨 위로 천천히 이동
	  $('#back-to-top').click(function(){
	    $('html, body').animate({scrollTop: 0}, 'slow');
	    return false;
	  });
	});

</script>
	
</body>
<script type="text/javascript">
console.log('Access Token: ${sessionScope.accessToken}')
console.log('Token Type: ${sessionScope.tokenType}')
console.log('Scope: ${sessionScope.scope}')
console.log('Expires In: ${sessionScope.expiresIn}')
console.log('Refresh Token: ${sessionScope.refreshToken}')
</script>


</html>