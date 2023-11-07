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
<title>One Music - Modern Music HTML5 Template</title>

<!-- Favicon -->
<link rel="icon" href="./assets/img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="./assets/style.css">

</head>

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
	<header class="header-area another-header">
  <!-- Navbar Area -->
  <div class="oneMusic-main-menu">
    <div class="classy-nav-container breakpoint-off">
      <div class="container">
        <!-- Menu -->
        <nav class="classy-navbar justify-content-between" id="oneMusicNav">
          <!-- Nav brand -->
          <a href="goIndex" class="nav-brand"><img src="./assets/img/core-img/로고.png" alt=""></a>
          <!-- Navbar Toggler -->
          <div class="classy-navbar-toggler">
            <span class="navbarToggler"><span></span><span></span><span></span></span>
          </div>
          <div class="searchBox">
            <input class="searchInput" type="text" id="search-input" placeholder="검색어를 입력하세요.">
            <button class="searchButton" id="search-button">
              <i class="material-icons"> <img src="./assets/img/bg-img/돋보기.png"></i>
            </button>
          </div>
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
                <li><a href="#">Albums</a></li>
                <li><a href="goFacemusic">Face Music</a></li>
                <!--<li><a href="contact.html">Contact</a></li>-->
              </ul>
              <!-- Login/Register & Cart Button -->
              <div class="login-register-cart-button d-flex align-items-center"></div>
              <ul>
                <li><a href="#">MENU</a>
                  <ul class="dropdown">
                    <c:if test="${empty user }">
                      <li><a href="goLogin">Login</a></li>
                    </c:if>
                    <c:if test="${!empty user }">
                      <li><a href="goMypage">My page</a></li>
                      <li><a href="">Logout</a></li>
                    </c:if>
                  </ul>
                </li>
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

	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(./assets/img/bg-img/.jpg);">
		<div class="bradcumbContent">
			<p>See what’s new</p>
			<h2>Albums</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Album Catagory Area Start ##### -->
<section class="album-catagory section-padding-100-0">
  <div class="container">
    <div class="row oneMusic-albums">
      <!-- Single Album Item -->
      <c:forEach var="album" items="${findRandom48}">
        <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-ballad">
          <div class="single-album">
            <a href="#">
              <img src="${album.rmuAlbumImg}">
            </a>
            <div class="album-info">
              <h5>${album.rmuTitle}</h5>
              <p>${album.rmuSinger}</p>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>
	<!-- ##### Album Catagory Area End ##### -->

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area">
		<div class="container">
			<div class="row d-flex flex-wrap align-items-center">
				<div class="col-12 col-md-6">
					<a href="#"><img src="./assets/img/core-img/footer로고.PNG"
						alt=""></a>
					<p class="copywrite-text">
						<a href="#">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script>
							<a>스마트인재개발원 | 광주광역시 남구 송암로 60 | 대표이사 : 김준우 </a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

				<div class="col-12 col-md-6">
					<div class="footer-nav">
						<ul>
							<li><a href="goIndex">Home</a></li>
							<li><a href="#">Albums</a></li>
							<li><a href="goFacemusic">Face Music</a></li>
							<li><a href="goMypage">My page</a></li>
							<!-- <li><a href="#">Contact</a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area Start ##### -->

	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="./assets/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="./assets/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js 
    <script src="js/bootstrap/bootstrap.min.js"></script>-->
	<!-- All Plugins js -->
	<script src="./assets/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="./assets/js/active.js"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
		crossorigin="anonymous">

<script type="text/javascript">
  let totalElements = 0;
  let totalPages = 0;
  let page = 0;
  let size = 48;
  let searchQuery = '';

  // 스크롤 이벤트 핸들러를 함수로 정의합니다.
  function onScroll() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      loadMore();
    }
  }

  function loadMore() {
	  $.ajax({
	    url: 'searchAlbums',
	    type: 'GET',
	    data: {
	      'Text': searchQuery,
	      'page': page,
	      'size': size
	    },
	    dataType: 'json',
	    success: function(res) {
	      console.log('검색 성공');

	      let container = $('.oneMusic-albums'); // 변경된 부분
	      let results = res.content; 

	      totalElements = res.totalElements;
	      totalPages = res.totalPages;

	      if (results.length === 0 && page === 0) {
	        container.html('<div>검색 결과가 없습니다.</div>');
	        return;
	      } else if (results.length === 0 && page > 0) {
	        if (page >= totalPages) {
	          $(window).off('scroll', onScroll);
	          return;
	        }
	      }

	      for (let i = 0; i < results.length; i++) {
	        let albumDiv = "<div class='col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-ballad'>";
	        albumDiv += "<div class='single-album'>";
	        albumDiv += "<a href='musicAlbumsInfo?rmuSeq=" + results[i].rmuSeq + "'>";
	        albumDiv += "<img src='" + results[i].rmuAlbumImg + "' alt='Album Image " + (i + 1) + "'>";
	        albumDiv += "</a>";
	        albumDiv += "<div class='album-info'>";
	        albumDiv += "<h5>" + results[i].rmuTitle + "</h5>";
	        albumDiv += "<p>" + results[i].rmuSinger + "</p>";
	        albumDiv += "</div></div></div>";

	        container.append(albumDiv);
	      }

	      page++;
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      console.log('요청 실패');
	      console.log('HTTP status code:', jqXHR.status);
	      console.log('Response text:', jqXHR.responseText);
	    }
	  });
	}
//검색 버튼 클릭
  $('#search-button').click(function() {
    searchQuery = $('#search-input').val();
    let container = $('.oneMusic-albums'); // 변경된 부분
    container.html('');
    page = 0;
    // 스크롤 이벤트 핸들러를 다시 등록합니다.
    $(window).scroll(onScroll);
    loadMore();
  });

  // 스크롤 이벤트 감지
  $(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      loadMore();
    }
  });
</script>
</body>

</html>