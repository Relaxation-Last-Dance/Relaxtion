<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Relaxation</title>

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
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">
                        
                        <!-- Nav brand -->
                        <a href="goIdex" class="nav-brand"><img src="./assets/img/core-img/로고.png" alt=""></a>
                        

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>
                       
                        <div class="searchBox">
                         <input class="searchInput"type="text" name="" placeholder="검색어를 입력하세요.">
                              <button class="searchButton" href="">
                <i class="material-icons">
                    <img src = "./assets/img/bg-img/돋보기.png">
                    
                </i>
            </button>
        </div>



                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
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
                                <div class="login-register-cart-button d-flex align-items-center"></div>
                                    
                                    <ul>
                                        <li><a href="#"></a>
                                            <ul class="dropdown">
                                            	<c:if test="${empty user}">
                                                	<li><a href="goLogin">Login</a></li>
                                                </c:if>
                                            	<c:if test="${!empty user}">
	                                                <li><a href="goMypage">My page</a></li>
	                                                <li><a href="userLogout">Logout</a></li>
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

    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">
            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(./assets/img/bg-img/배경7.jpg);"></div>
                <!-- Slide Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-slides-content text-center">
                                <h6 data-animation="fadeInUp" data-delay="100ms">Latest album</h6>
                                <h2 data-animation="fadeInUp" data-delay="300ms">Relaxation <span>Relaxation</span></h2>
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
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>이번주 TOP 100</h2>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="100ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="./assets/img/index-img/뉴진스.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=뉴진스.jpg','asdfo8or');">


                                
                            </div>
                            <div class="content-">
                                <h6>뉴진스</h6>
                                <p>hype boy</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="150ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="./assets/img/index-img/정국.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=정국.jpg');">

                            </div>
                            <div class="content-">
                                <h6>정국</h6>
                                <p>세븐</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="200ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/악동뮤지션.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=악동뮤지션.jpg');">

                            </div>

                            <div class="content-">
                                <h6>악뮤</h6>
                                <p>다이노소울</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="250ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/아이브.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=아이브.jpg');">

                            </div>
                            <div class="content-">
                                <h6>아이브</h6>
                                <p>유후아하</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="300ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/르세라핌.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=르세라핌.jpg');">

                            </div>
                            <div class="content-">
                                <h6>르세라핌</h6>
                                <p>르세라핌</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="350ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/임영웅.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=임영웅.jpg');">

                            </div>
                            <div class="content-">
                                <h6>임영웅</h6>
                                <p>사랑은 늘 도망가</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

            <!-- ***** New Hits Songs ***** -->
            <div class="col-12 col-lg-4">
                <div class="new-hits-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>최신앨범</h2>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="100ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/방탄소년단.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=방탄소년단.jpg');">

                            </div>
                            <div class="content-">
                                <h6>Sam Smith</h6>
                                <p>Underground</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="150ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/에스파.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=에스파.jpg','asdfo8or');">

                            </div>
                            <div class="content-">
                                <h6>Power Play</h6>
                                <p>In my mind</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="200ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/다듀.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=다듀.jpg','asdfo8or');">

                            </div>
                            <div class="content-">
                                <h6>Cristinne Smith</h6>
                                <p>My Music</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="250ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/라이즈.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=라이즈.jpg','asdfo8or');">

                            </div>
                            <div class="content-">
                                <h6>The Music Band</h6>
                                <p>Underground</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="300ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/스테이씨.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=스테이씨.jpg','asdfo8or');">

                            </div>
                            <div class="content-">
                                <h6>Creative Lyrics</h6>
                                <p>Songs and stuff</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="350ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="img/index-img/아이들.jpg"  style="cursor:pointer" onclick="PopupCenter('./assets/player.html?img=아이들.jpg','asdfo8or');">

                            </div>
                            <div class="content-">
                                <h6>The Culture</h6>
                                <p>Pop Songs</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

            <!-- ***** Popular Artists ***** -->
            <div class="col-12 col-lg-4">
                <div class="popular-artists-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>Popular Artist</h2>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                        <div class="thumbnail">
                            <img src="img/index-img/뉴진스.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Sam Smith</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="150ms">
                        <div class="thumbnail">
                            <img src="img/index-img/다듀.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>William Parker</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="200ms">
                        <div class="thumbnail">
                            <img src="img/index-img/라이즈.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Jessica Walsh</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="250ms">
                        <div class="thumbnail">
                            <img src="img/index-img/스테이씨.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Tha Stoves</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="300ms">
                        <div class="thumbnail">
                            <img src="img/index-img/방탄소년단.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>DJ Ajay</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="350ms">
                        <div class="thumbnail">
                            <img src="img/index-img/아이브.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Radio Vibez</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="400ms">
                        <div class="thumbnail">
                            <img src="img/index-img/에스파.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Music 4u</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Miscellaneous Area End ##### -->
  

    <!-- ##### Buy Now Area Start ##### -->
    <section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
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
                

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/뉴진스.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=jOTfBlKSQYY" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                           
                        </div>

                        <div class="album-info">
                            <a href="">
                                <h5>NewJeans</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/정국.jpg" alt="">
                            
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=Wgj9t0k94yQ" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>정국</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>





                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/악동뮤지션.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=EIz09kLzN9k" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>

                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>AKMU(악뮤)</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/아이브.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=Da4P2uT4mVc" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>아이브(IVE)</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="500ms">
                        <div class="album-thumb">
                            <img src="img/index-img/르세라핌.jpg" alt="">
                           
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=hLvWy2b857I" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>르세라핌</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/임영웅.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=tJut2wIsC1w" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>임영웅</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/방탄소년단.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=zrjqB0Bpf1E" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>방탄소년단</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/에스파.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=w92u4od6wxk" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>aespa</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="300ms">
                        <div class="album-thumb">
                            <img src="img/index-img/다듀.jpg" alt="">
                        
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=LqoP8Gg9yOs" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>다이나믹 듀오</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/라이즈.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=gJMheHHf4GQ" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>라이즈</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/스테이씨.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=3-ptVHZZdBg" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>STAYC</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="img/index-img/아이들.jpg" alt="">
                            
                            <!-- Play Icon -->
                            <div class="play-button">
                                <div class="play-icon">
                                    <a href="https://www.youtube.com/watch?v=Iewisp9KYRw" target="_blank" class="video--play--btn"><span class="icon-play-button"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>(여자)아이들</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

           
        </div>
    </section>
    <!-- ##### Buy Now Area End ##### -->

    
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="./assets/img/core-img/footer로고.PNG" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> <a>스마트인재개발원 | 광주광역시 남구 송암로 60  | 대표이사 : 김준우  </a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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

    <script scr = "./assets/js/main.js"></script>
    
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
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">  
</body>

</html>