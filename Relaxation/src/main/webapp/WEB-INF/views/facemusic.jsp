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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<style>
a {
    color: black;
    text-decoration: none;
}
.file-label1 {
    margin-top: 100px;
    background-color: #5b975b;
    color: #fff;
    text-align: center;
    padding: 10px 0;
    width: 65%;
    border-radius: 6px;
    cursor: pointer;
    }
</style>
<body>


    <div id="loading" class="loader"></div>

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
                                    <li><a href="goAlbums">Albums</a></li>
                                    <li><a href="#">Face Music</a></li>
                                    <!--<li><a href="contact.html">Contact</a></li>-->
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center"></div>
                                    
                                    <ul>
                                        <li><a href="#">MENU</a>
                                            <ul class="dropdown">
                                            <c:if test="${!empty user }">
                                                <li><a href="goMypage">My page</a></li>
                                                <li><a href="userLogout">Logout</a></li>
                                            </c:if>
                                            <c:if test="${empty user }">
                                                <li><a href="goLogin">Login</a></li>
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
            <p>이럴 땐, 이런 음악!</p>
            <h2>Face Music</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-9">

                    <!-- Single Post Start -->
                 <form action="imgUpload" enctype="multipart/form-data" method="post">
                   
                    <div id="root">
                        <h2 class="title">File Upload</h2>
                        <hr>
                        <div class="contents">
                          <div class="upload-box">
                          
                            <div id="drop-file" class="drag-file">
                              <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
                              <p class="message">Drag files to upload</p>
                              <img src="" alt="미리보기 이미지" class="preview">
                            </div>
    		        
                            
                            <label class="file-label1" for="chooseFile1">사진 업로드</label>
                            <input class="file1" id="chooseFile1" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif" name="rfImg"></input>
                            <button id="openModal1" class="custom-button1">확인</button>
                 	</form>
                            <div id="myModal1" class="modal1">
                              <div class="modal-content1">
                                <span id="closeModal1" class="close1">&times;</span>
                                <h3>음악이 업로드 될때까지 잠시만 기다려 주세요</h3>
                                
                                <h5></h5>
        <div id="modalWrap2">
            <div id="modalBody2">
               <ul id="musicList2">
                <li class="musicItem2">

                </li>
               </ul>
         	</div>
        </div>
        <div class="checkbox-container">
            <div class="button-container">
                <button type="button" id="myBtn">리스트에 추가하기</button>
            </div>
        </div>
            

       




                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                    <!-- Single Post Start -->
                    <div class="single-blog-post mb-100 wow fadeInUp" data-wow-delay="100ms">
                        <!-- Post Thumb -->
                        <div class="blog-post-thumb mt-30">
                            <a href="#"><img src="./assets/img/face_music-img/츄.jpg" alt=""></a>
                            <!-- Post Date -->
                            <div class="post-date">
                               <span>9</span>
                                <span>November</span>
                            </div>
                        </div>

                        <!-- Blog Content -->
                        <div class="blog-content">
                            <!-- Post Title -->
                            <a href="#" class="post-title">츄 (CHUU) 1ST MINI ALBUM [Howl] 자켓 촬영 현장 비하인드</a>
                            <!-- Post Meta -->
                            <div class="post-meta d-flex mb-30">
                                <p class="post-author">By<a href="#"> Admin</a></p>
                                <p class="tags">in<a href="#"> Events</a></p>
                                <p class="tags"><a href="#">2 Comments</a></p>
                            </div>
                            <!-- Post Excerpt -->
                            <p>안녕하세요, 릴렉세이션 가족 여러분!


                                ‘츄 (CHUU)’가 첫 번째 미니 앨범 [Howl]로 솔로 데뷔했습니다!
                                <br>
                                
                                타이틀 곡 ‘Howl’의 자켓 촬영 비하인드 스토리를 지금 바로, 공개합니다.
                                <br>
                                
                                어디서도 볼 수 없었던 ‘츄’의 모습을 보러 함께 가보실까요?</p>
                        </div>
                    </div>

                    <!-- Single Post Start -->
                    <div class="single-blog-post mb-100 wow fadeInUp" data-wow-delay="100ms">
                        <!-- Post Thumb -->
                        <div class="blog-post-thumb mt-30">
                            <a href="#"><img src="./assets/img/face_music-img/선미.jpg" alt=""></a>
                            <!-- Post Date -->
                            <div class="post-date">
                                <span>9</span>
                                <span>November</span>
                            </div>
                        </div>

                        <!-- Blog Content -->
                        <div class="blog-content">
                            <!-- Post Title -->
                            <a href="#" class="post-title">선미 (SUNMI) DIGITAL SINGLE [STRANGER]</a>
                            <!-- Post Meta -->
                            <div class="post-meta d-flex mb-30">
                                <p class="post-author">By<a href="#"> Admin</a></p>
                                <p class="tags">in<a href="#"> Events</a></p>
                                <p class="tags"><a href="#">2 Comments</a></p>
                            </div>
                            <!-- Post Excerpt -->
                            <p>안녕하세요. 릴렉세이션 회원 여러분!
                                지난여름, ‘열이올라요 (Heart Burn)'로 대한민국에 뜨거운 여름을 선사했던 아티스트 선미가 
                                1년 4개월 만에 디지털 싱글 [STRANGER]와 함께 돌아왔습니다.
                                <br>
                                선미가 직접 작사, 작곡한 곡으로 가득 채워진 이번 앨범 [STRANGER]의 타이틀곡이자
                                선미만의 음악적 색깔과 치명적인 퍼포먼스가 돋보이는 ‘STRANGER’의 MV 촬영 현장으로 
                                릴렉세이션 회원 여러분들을 초대합니다!</p>
                        </div>
                    </div>

                  
                </div>

                <div class="col-12 col-lg-3">
                    <div class="blog-sidebar-area">

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <div class="widget-title">
                                <h5>Categories</h5>
                            </div>
                            <div class="widget-content">
                                <ul>
                                    <li><a href="#">Music</a></li>
                                    <li><a href="#">Face Music</a></li>
                                    <li><a href="#">Festivals</a></li>
                                    <li><a href="#">Lyfestyle</a></li>
                                    <li><a href="#">Uncategorized</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <div class="widget-title">
                                <h5>Archive</h5>
                            </div>
                            <div class="widget-content">
                                <ul>
                                    <li><a href="#">February 2023</a></li>
                                    <li><a href="#">March 2023</a></li>
                                    <li><a href="#">April 2023</a></li>
                                    <li><a href="#">May 2023</a></li>
                                    <li><a href="#">June 2023</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <div class="widget-title">
                                <h5>Tags</h5>
                            </div>
                            <div class="widget-content">
                                <ul class="tags">
                                    <li><a href="#">music</a></li>
                                    <li><a href="#">Faceid</a></li>
                                    <li><a href="#">artists</a></li>
                                    <li><a href="#">mp3</a></li>
                                    <li><a href="#">Categories</a></li>
                                    <li><a href="#">videos</a></li>
                                    <li><a href="#">content</a></li>
                                    <li><a href="#">performers</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <a href="#" class="image-link">
                                <img src="./assets/img/face_music-img/가을.gif" alt="">
                                <div class="play-button">
                                    <span class="icon-play-button"></span>
                                </div>
                            </a>
                            <div class="text-area mb-30" style="text-align:center;font-family:'Dotum'; ">
                                <p style="color:#5b975b; font-weight: bold;">오늘의 선곡</p>
                                <h6>추운 날씨엔 가을 한장🍁</h6>
                            </div>
                        </div>
                            
                        </div>
                        
                        <!-- Widget Area -->
                        <div class="single-widget-area mb-30">
                            <a href="#" class="image-link">
                                <img src="./assets/img/face_music-img/드라이브.gif" alt="">
                                <div class="play-button">
                                    <span class="icon-play-button"></span>
                                </div>
                            </a>
                            <div class="text-area mb-30" style="text-align:center;font-family:'Dotum'; ">
                                <p style="color:#5b975b; font-weight: bold;">오늘의 선곡</p>
                                <h6>차안에서 즐기는 드라이브 뮤직🚗</h6>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Blog Area End ##### -->

   
    <!-- ##### Contact Area End ##### -->

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
                            <li><a href="./assets/index.html">Home</a></li>
                            <li><a href="./assets/albums.html">Albums</a></li>
                            <li><a href="./assets/facemusic.html">Face Music</a></li>
                            <li><a href="./assets/mypage.html">My page</a></li>
                          <!--  <li><a href="#">Contact</a></li> -->
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
    <script src="./assets/js/facemusic.js"></script>
   <script type="text/javascript">
   
   var sec9 = document.querySelector('#root');
var inputFile = sec9.querySelector('input[type="file"]');
var uploadBox = sec9.querySelector('.drag-file');

uploadBox.addEventListener('dragenter', function(e) {
  console.log('dragenter');
});

uploadBox.addEventListener('dragover', function(e) {
  e.preventDefault();
  console.log('dragover');
  this.style.backgroundColor = 'skyblue';
});

uploadBox.addEventListener('dragleave', function(e) {
  console.log('dragleave');
  this.style.backgroundColor = 'white';
});
uploadBox.addEventListener('drop', function(e) {
	  e.preventDefault();
	  this.style.backgroundColor = 'white';
	  var files = e.dataTransfer.files;

	  if (files.length > 0) {
	    var file = files[0];
	    var reader = new FileReader();
	    reader.onloadend = function() {
	      var previewDiv = document.querySelector('.preview');
	      previewDiv.src = reader.result;
	      inputFile.files = files; // 이 부분이 추가되어야 합니다.
	    };
	    reader.readAsDataURL(file);
	  }
	});

uploadBox.addEventListener('dragover', function(e) {
  e.preventDefault();
  var valid = e.dataTransfer.types.indexOf('Files') >= 0;
  if (!valid) {
    this.style.backgroundColor = 'red';
  } else {
    this.style.backgroundColor = 'skyblue';
  }
});

inputFile.addEventListener('change', function(e) {
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onloadend = function() {
    var previewDiv = document.querySelector('.preview');
    previewDiv.src = reader.result;
  };
  reader.readAsDataURL(file);
});

$("#openModal1").click(function(e) {
    e.preventDefault();
    var formData = new FormData($('form')[0]);
    $.ajax({
      url: $('form').attr('action'),
      type: 'POST',
      data: formData,
      processData: false,  
      contentType: false,
      success: function(result){
  
    	  $('h3').text("이런 음악은 어때요?");
    	  $('h5').text(result.message);
    	  // 음악 리스트를 가져옵니다.
    	  var musicList = JSON.parse(result.goodMusicList);
    	  
    	// 모달에 음악 정보를 추가합니다.
    	    var container = $('#musicList2');
    	    for (var i = 0; i < musicList.length; i++) {
    	        var music = musicList[i];
    	        var musicItem = "<li class='musicItem2'>";
    	        musicItem += "<div class='musicItemWrapper2'>";
    	        musicItem += "<img src='" + music.rmuAlbumImg + "' alt='음악 이미지'>";
    	        musicItem += "<h6>" + music.rmuSinger + "</h6>";
    	        musicItem += "</div></li>";

    	        container.append(musicItem);
    	    }
        //window.location.href = "goImgEndToPlayList";
      },
      error: function(xhr, status, error){
        console.log("===========오류============")
        console.error(xhr.responseText);
        console.log("==========================")
      }
    });
});
   // 음악 추천받고 버튼 클릭시 재생목록으로 이동하는 코드
document.getElementById('myBtn').addEventListener('click', function () {
    window.location.href = 'goImgEndToPlayList';
});
   
   
   
</script>
   
</body>

</html>