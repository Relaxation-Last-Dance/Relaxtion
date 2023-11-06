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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(./assets/img/bg-img/.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2> Albums</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Album Catagory Area Start ##### -->
    <section class="album-catagory section-padding-100-0">
        <div class="container">
          
            <div class="row oneMusic-albums">

                <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-ballad">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/광화문에서_규현.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>광화문에서</h5>
                            </a>
                            <p>규현</p>
                        </div>
                    </div>
                </div>
                
                   <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-rnb">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/나였으면_나윤권.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>나였으면</h5>
                            </a>
                            <p>나윤권</p>
                        </div>
                    </div>
                </div>
                
                  <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/술이야_바이브.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>술이야</h5>
                            </a>
                            <p>바이브</p>
                        </div>
                    </div>
                </div>

                   <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t g u">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/두사람_성시경.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>두사람</h5>
                            </a>
                            <p>성시경</p>
                        </div>
                    </div>
                </div>

                  <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item d h v">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/마음을 드려요_아이유.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>마음을 드려요</h5>
                            </a>
                            <p>아이유</p>
                        </div>
                    </div>
                </div>

                   <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t i x">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/밤편지_아이유.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>밤편지</h5>
                            </a>
                            <p>아이유</p>
                        </div>
                    </div>
                </div>

                   <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item b j y">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/별 보러 가자_적재.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>별 보러 가자</h5>
                            </a>
                            <p>적재</p>
                        </div>
                    </div>
                </div>

                  <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item a k z">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/사랑합니다_팀.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>사랑합니다</h5>
                            </a>
                            <p>팀</p>
                        </div>
                    </div>
                </div>

                  <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item w l number">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/안아줘_정준일.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>안아줘</h5>
                            </a>
                            <p>정준일</p>
                        </div>
                    </div>
                </div>

                 <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item d m">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/오르막길_윤종신.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>오르막길</h5>
                            </a>
                            <p>윤종신</p>
                        </div>
                    </div>
                </div>

                   <!-- 발라드 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t n">
                    <div class="single-album">
                        <img src="./assets/img/album_img/발라드/화장을 고치고_왁스.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>화장을 고치고</h5>
                            </a>
                            <p>왁스</p>
                        </div>
                    </div>
                </div>

                <!-- 댄스 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item b o">
                    <div class="single-album">
                        <img src="img/album_img/댄스/cookie_뉴진스.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>cookie</h5>
                            </a>
                            <p>뉴진스</p>
                        </div>
                    </div>
                </div>

                  <!-- 댄스 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/댄스/dynamite_방탄.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>dynamite</h5>
                            </a>
                            <p>방탄소년단</p>
                        </div>
                    </div>
                </div>

                  <!-- 댄스 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/댄스/spicy_에스파.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Spicy</h5>
                            </a>
                            <p>에스파</p>
                        </div>
                    </div>
                </div>

                  <!-- 댄스 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/댄스/teddy bear_스테이씨.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>teddy bear</h5>
                            </a>
                            <p>스테이씨</p>
                        </div>
                    </div>
                </div>


                  <!-- 댄스 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/댄스/거짓말_빅뱅.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>거짓말</h5>
                            </a>
                            <p>빅뱅</p>
                        </div>
                    </div>
                </div>


                  <!-- 댄스 -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/댄스/비행기_거북이.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>비행기</h5>
                            </a>
                            <p>거북이</p>
                        </div>
                    </div>
                </div>
                 
                <!-- 댄스 -->

                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/댄스/스물셋_아이유.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>스물셋</h5>
                            </a>
                            <p>아이유</p>
                        </div>
                    </div>
                </div>


                <!-- R&B -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/R&B/square_백예린.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>square</h5>
                            </a>
                            <p>백예린</p>
                        </div>
                    </div>
                </div>

                <!-- R&B -->    
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/R&B/trip_릴러말즈.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>trip</h5>
                            </a>
                            <p>릴러말즈</p>
                        </div>
                    </div>
                </div>

                 <!-- R&B -->   
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/R&B/목요일 밤_어반자카파.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>목요일 밤</h5>
                            </a>
                            <p>어반자카파</p>
                        </div>
                    </div>
                </div>


                <!-- R&B -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/R&B/벌써일년_브라운 아이즈.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>벌써 일년</h5>
                            </a>
                            <p>브라운 아이즈</p>
                        </div>
                    </div>
                </div>


                <!-- R&B -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/R&B/비도 오고 그래서_헤이즈.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h6>비도 오고 그래서</h6>
                            </a>
                            <p>헤이즈</p>
                        </div>
                    </div>
                </div>


                <!-- R&B -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/R&B/와르르_콜드.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>와르르</h5>
                            </a>
                            <p>콜드</p>
                        </div>
                    </div>
                </div>


                <!--디스코-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/디스코/dancing Queen_아바.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Dancing Queen</h5>
                            </a>
                            <p>ABBA</p>
                        </div>
                    </div>
                </div>

                <!--디스코-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/디스코/get lucky_daftpunk.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Get Lucky</h5>
                            </a>
                            <p>daftpunk</p>
                        </div>
                    </div>
                </div>


                <!--디스코-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/디스코/rock with you_마이클잭슨.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Rock With you</h5>
                            </a>
                            <p>마이클잭슨</p>
                        </div>
                    </div>
                </div>


                <!--디스코-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/디스코/uptownFunk_markRonson.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Uptown Funk</h5>
                            </a>
                            <p>Mark Ronson</p>
                        </div>
                    </div>
                </div>


                    <!--디스코-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/디스코/whenwedisco_박진영.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>When We Disco  </h5>
                            </a>
                            <p>박진영</p>
                        </div>
                    </div>
                </div>


                <!--락-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/락/Back in black_acdc.png" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Back in black</h5>
                            </a>
                            <p>AC/DC</p>
                        </div>
                    </div>
                </div>


                <!--락-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/락/endless_플라워.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Endless</h5>
                            </a>
                            <p>플라워</p>
                        </div>
                    </div>
                </div>

                <!--락-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/락/발걸음_에메랄드캐슬.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>발걸음</h5>
                                

                            </a>
                            <p>에메랄드캐슬</p>
                        </div>
                    </div>
                </div>

                <!--락-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/락/Never Ending Story_부활.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h6>Never Ending Story</h6>
                            </a>
                            <p>부활</p>
                        </div>
                    </div>
                </div>

                 <!--락-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/락/oh, Pretty Woman_roy.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h6>oh, Pretty Woman</h6>
                            </a>
                            <p>Roy</p>
                        </div>
                    </div>
                </div>

                <!--트로트-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/트로트/둥지_진성.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>둥지</h5>
                            </a>
                            <p>진성</p>
                        </div>
                    </div>
                </div>

                <!--트로트-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/album_img/트로트/바람의 노래_조용필.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>바람의 노래</h5>
                            </a>
                            <p>조용필</p>
                        </div>
                    </div>
                </div>

                <!--트로트-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/트로트/무조건_박상철.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>무조건</h5>
                            </a>
                            <p>박상철</p>
                        </div>
                    </div>
                </div>

                <!--트로트-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/트로트/아모르파티_김연자.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>아모르파티</h5>
                            </a>
                            <p>김연자</p>
                        </div>
                    </div>
                </div>

                <!--트로트-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/트로트/안동역에서_진성.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>안동역에서</h5>
                            </a>
                            <p>진성</p>
                        </div>
                    </div>
                </div>

                <!--트로트-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/트로트/초혼_장윤정.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>초혼</h5>
                            </a>
                            <p>장윤정</p>
                        </div>
                    </div>
                </div>

                <!--힙합-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/힙합/EMpire state of mind_jay_z.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h6>Empire State of mind</h6>
                            </a>
                            <p>Jay-Z</p>
                        </div>
                    </div>
                </div>

                 <!--힙합-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/힙합/not sorry_이영지.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Not sorry</h5>
                            </a>
                            <p>이영지</p>
                        </div>
                    </div>
                </div>

                 <!--힙합-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/힙합/oasis_크러쉬.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Oasis</h5>
                            </a>
                            <p>크러쉬</p>
                        </div>
                    </div>
                </div>


                 <!--힙합-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/힙합/offically Missing you_긱스.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h6>offically Missing you</h6>
                            </a>
                            <p>긱스</p>
                        </div>
                    </div>
                </div>


                 <!--힙합-->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/힙합/예쁘잖아_기리보이.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>예쁘잖아</h5>
                            </a>
                            <p>기리보이</p>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/POP/dangerously_찰리푸스.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Dangerously</h5>
                            </a>
                            <p>찰리푸스</p>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/POP/l'm not the only one_샘스미스.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h6>i'm not the only one</h6>
                            </a>
                            <p>샘스미스</p>
                        </div>
                    </div>
                </div>


                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item category-dance">
                    <div class="single-album">
                        <img src="img/album_img/POP/Unholy_샘스미스.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Unholy</h5>
                            </a>
                            <p>샘스미스</p>
                        </div>
                    </div>
                </div>

            </div>
            </div>


    </section>



    <!-- ##### Album Catagory Area End ##### -->

    

   

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="./assets/img/core-img/footer로고.PNG" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script>  <a>스마트인재개발원 | 광주광역시 남구 송암로 60  | 대표이사 : 김준우  </a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    
</body>

</html>