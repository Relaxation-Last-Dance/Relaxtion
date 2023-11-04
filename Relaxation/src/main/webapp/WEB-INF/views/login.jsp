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
    <link rel="stylesheet" href="./assets/css/login.css">


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
                                    <li><a href="goAlbums">Albums</a></li>
                            
                                    <li><a href="goFacemusic">Face Music</a></li>
                                    <!--<li><a href="contact.html">Contact</a></li>-->
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center"></div>
                                    
                                    <ul>
                                        <li><a href="#">Login / Register</a>
                                            <ul class="dropdown">
                                                <li><a href="goMypage">My page</a></li>
                                                <li><a href="">Login</a></li>
                                                <li><a href="">Logout</a></li>
                                            
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
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(./assets/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Login</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome Back</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form action="#" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter E-mail">
                                    <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <button type="button" class="btn oneMusic-btn mt-30" id="signupButton">회원가입</button>
                                
                                <button type="submit" class="btn oneMusic-btn mt-30">로그인</button>
                               <img src="./assets/img/core-img/카카오로그인.png" alt="Login" class="image-button">
                            </form>
                        </div>
                    </div>
                    
                    <div class="modal-content">
                        <div class="wrapper">
                            <div class="title"><h1 style="font-size: 21px;">회원가입</h1></div>
                            
                            이메일 : <input type="text" name="str_email01" id="str_email01" style="width:100px"> @
                            <input type="text" name="str_email02" id="str_email02" style="width:100px;" disabled value="naver.com">
                            <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail">
                                 <option value="1">직접입력</option>
                                 <option value="naver.com" selected>naver.com</option>
                                 <option value="hanmail.net">hanmail.net</option>
                                 <option value="nate.com">nate.com</option>
                                 <option value="gmail.com">gmail.com</option>
                                 
                            </select>
                            
                            <div class="password" style="margin-top: 30px;">
                                <input id="password" type="password" placeholder="비밀번호를 입력해 주세요.">
                                <div id="passwordError" class="error"></div>
                            </div>
                            <div class="passwordCheck">
                                <input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
                                <div id="passwordCheckError" class="error"></div>
                            </div>
                            <div class="nick">
                                <input id="nick"  type="text" placeholder="닉네임을 입력해 주세요.">
                                <div id="nameError" class="error"></div>
                            </div>
                            <div class="name">
                                <input id="name"  type="text" placeholder="이름을 입력해 주세요.">
                                <div id="nameError" class="error"></div>
                            </div>
                            <div class="gender">
                                <input id="gender_man" type="radio" name="gender">남성  
                                <input id="gender_woman" type="radio" name="gender">여성
                                <div id="genderError" class="error"></div>
                            </div>
                            <div class="phone">
                                <input id="phone1" type="number"  maxlength="11" placeholder="전화번호를 입력해 주세요."> 
                               
                            </div>
                         
                           
                            <div class="line">
                                <hr>
                            </div>
                            <div class="signUp">
                                <button id="signUpButton" disabled onclick="signUpCheck()" style="margin-bottom: 10px;">가입하기</button>
                                <button id="closeButton" onclick="closeCheck()">나가기</button>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="img/core-img/footer로고.PNG" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script>  <a>스마트인재개발원 | 광주광역시 남구 송암로 60  | 대표이사 : 김준우  </a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>

                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <ul>
                            <li><a href="goIndex">Home</a></li>
                            <li><a href="#">Albums</a></li>
                            <li><a href="#">Face Music</a></li>
                            <li><a href="#">Events</a></li>
                        <!--   <li><a href="#">Contact</a></li> -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="signUpModal" class="modal">
            
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
    <script src="./assets/js/login.js"></script>

</body>

</html>