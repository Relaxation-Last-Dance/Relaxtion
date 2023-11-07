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

    <!-- Title -->
    <title>Relaxation</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="./assets/style.css">
    <link rel="stylesheet" href="./assets/css/mypage.css">

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
                                    <li><a href="./assets/index.html">Home</a></li>
                                    <li><a href="./assets/albums.html">Albums</a></li>
                            
                                    <li><a href="./assets/facemusic.html">Face Music</a></li>
                                    <!--<li><a href="contact.html">Contact</a></li>-->
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center"></div>
                                    
                                    <ul>
                                        <li><a href="#">MENU</a>
                                            <ul class="dropdown">
                                            	<c:if test="${!empty user }">
                                               		<li><a href="#">My page</a></li>
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
    <div class="sidebar" style="position: absolute; left: 0; top: 385px; width: 200px; height: 470px; background-color: white; padding: 20px; z-index: 15; box-shadow:2px 0 5px -2px gray;">
        <img src="https://mblogthumb-phinf.pstatic.net/MjAyMDEyMjBfMjU4/MDAxNjA4NDUxOTk3Mjk2.W88f9Phe4d6mo48vpWuZQ9e9R4CvARFvZEoBW9irbXYg.UWAbicHtrZc1hrgYt38Fp79LOnbMhQ6_hcttqmEu79gg.JPEG.goodmanddo/%EC%9B%83%EA%B8%B4_%EC%B9%B4%ED%86%A1%ED%94%84%EC%82%AC_%EA%B8%B0%EB%B3%B8.jpg?type=w800" alt="Profile Picture" style="width: 100px; height: 100px; border-radius: 50%; margin-top: 50px; margin-left: 30px;">
        <h5>${user.rmNick}</h5>
        <h6>${user.rmEmail}</h6>
    </div>
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            
            <p>See what’s new</p>
            <h2>My page</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

  

    <div class="listContainer" style="float : left; margin-left :250px; margin-bottom: 110px; margin-top: 80px; ">
        <div class="item">
            <div class="icon">ii</div>
            <a href="#" onclick="showImage(['/img/index-img/뉴진스.jpg', '/img/index-img/에스파.jpg', '/img/index-img/르세라핌.jpg','/img/index-img/아이들.jpg','/img/index-img/아이브.jpg']); return false;">
                <div class="text">최근 들었던 곡</div>
            </a>
            <div class="imgContainer"></div>
        </div>
        <div class="item">
            <div class="icon">ii</div>
            <a href="#" onclick="showImage(['/img/index-img/라이즈.jpg', '/img/index-img/스테이씨.jpg', '/img/index-img/방탄소년단.jpg','/img/index-img/다듀.jpg','/img/index-img/악동뮤지션.jpg']); return false;">
                <div class="text">내가 좋아한 노래</div>
            </a>
            <div class="imgContainer"></div>
        </div>
        <div class="item">
            <div class="icon">ii</div>
            <a href="#" onclick="showImage(['/img/index-img/임영웅.jpg', '/img/index-img/스테이씨.jpg', '/img/index-img/방탄소년단.jpg','/img/index-img/다듀.jpg','/img/index-img/악동뮤지션.jpg']); return false;">
                <div class="text">내 플레이리스트</div>
            </a>
            <div class="imgContainer"></div>
        </div>
        <a href="#" class="item" onclick="showContent('회원정보 수정'); return false;">
            <div class="icon">ii</div>
            <div class="text">회원정보 수정</div>
        </a>
		<form action="userUpdate" method="post" onsubmit="return validateForm()">
        
        <div id="content" style="display: none;">
            <!-- 회원가입 양식 내용 -->
            <div class="wrapper">
                <div class="title"><h1 style="font-size: 21px; text-align: center;">회원정보 수정</h1></div>
                <input type="text" name="rmEmail" value=" ${user.rmEmail}" readonly="readonly">
                
                <%-- 카카오톡유저일때 --%>
                <c:choose>
					<c:when test="${user.rmPhone eq '카카오회원'}">
                
                <div class="password" style="margin-top: 30px; ">
                    <input id="password" type="password" name="rmPw" value="${user.rmPw}" readonly="readonly">
                    <div id="passwordError" class="error"></div>
                </div>
                <div class="passwordCheck">
                    <input id="passwordCheck" type="password" name="rmPwConfirm" value="${user.rmPw}" readonly="readonly" >
                    <div id="passwordCheckError" class="error"></div>
                </div>
                	</c:when>
                
      			<%-- 카카오톡유저가 아닐때 --%>
					<c:otherwise>
				
                <div class="password" style="margin-top: 30px; ">
                    <input id="password" type="password" name="rmPw" value="${user.rmPw}">
                    
                </div>
                <div class="passwordCheck">
                    <input id="passwordCheck" type="password" name="rmPwConfirm" value="${user.rmPw}">
                    <div id="passwordCheckError" class="error" style="display: none;"></div>
                </div>
				
					</c:otherwise>
				</c:choose>
				
                <div class="nick">
                    닉네임<input id="nick"  type="text" name="rmNick" value="${user.rmNick}">
                    <div id="nameError" class="error" style="display: none;"></div>
                </div>
                <div class="name">
                    이름<input id="name"  type="text" name="rmName" value="${user.rmName}" readonly="readonly">
                    <div id="nameError" class="error"></div>
                </div>
                <%-- 카카오톡유저는 전화번호 안뜸 X --%>
			<c:choose>
				<c:when test="${user.rmPhone eq '카카오회원'}"></c:when>
				
				<%-- 일반유저는 전화번호 수정 가능 --%>
				<c:otherwise>
                	<div class="phone">
          		 		<input id="phone1" type="text"  maxlength="13" name="rmPhone" value="${user.rmPhone}"> 
                	</div>
				</c:otherwise>
			</c:choose>
	            
	            
	            </div>
	             <div class="signUp">
	            <button id="signUpButton" onclick="openPopup()">수정하기</button>
	        </div>
	        <div id="popup" style="display: none; position: fixed; width: 200px; height: 100px; background-color: white; border: 1px solid black; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; padding: 20px; border-radius: 10px; font-family: 'Times New Roman', Times, serif;">
	            <p>수정되었습니다.</p>
	            <button onclick="closePopup()" style="border: none; background-color: #4CAF50; color: white; width : 100px">닫기</button>
	        </div>
	        </div>
	        
	        </form>
        
   
   		<c:choose>
			<c:when test="${user.rmPhone eq '카카오회원'}">
				<a href="dropKakaoUser" class="item">
            	<div class="icon">ii</div>
            	<div class="text">카카오 회원탈퇴</div>
            	
        </a>
			</c:when>
   
   			<c:otherwise>
   			
        <a href="#" class="item" onclick=" showModal('정말 탈퇴하시겠습니까?'); return false;">
            <div class="icon">ii</div>
            <div class="text">회원탈퇴</div>
            <input type="hidden" value="${user.rmPw}" id="userPw">
        </a>
   			
   			</c:otherwise>
		</c:choose>
   
   
   
   
   
    </div>
    <div id="content"></div>
    
    <!-- ##### Events Area End ##### -->

  
    <div style="clear: both;"></div>

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="goIndex" class="nav-brand"><img src="./assets/img/core-img/로고.png" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> <a>스마트인재개발원 | 광주광역시 남구 송암로 60  | 대표이사 : 김준우  </a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>

                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <ul>
                            <li><a href="goIndex">Home</a></li>
                            <li><a href="goAlbums">Albums</a></li>
                            <li><a href="goFacemusic">Face Music</a></li>
                            <li><a href="#">My page</a></li>
                            <!--<li><a href="#">Contact</a></li>-->
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
   
    <script src="./assets/js/mypage.js"></script>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">



<script type="text/javascript">




var isNickDuplicate = false; // 닉네임 중복 여부 저장하는 변수


//폼 제출 이벤트 핸들러 추가
document.querySelector('form[action="userUpdate"]').addEventListener('submit', function(e) {
    var password = document.querySelector('input[name="rmPw"]').value;
    var confirmPassword = document.querySelectorAll('input[type="password"]')[1].value;

    if (!password || !confirmPassword) {
        e.preventDefault(); // 폼 제출 막기
        alert('비밀번호를 입력하세요.');
    } else if (password !== confirmPassword) {
        e.preventDefault(); // 폼 제출 막기
        alert('비밀번호가 일치하지 않습니다');
    }
});

//수정 버튼 클릭 시 폼 유효성 검사 및 수정되었습니다 창 띄우기
function openPopup() {
    if (validateForm()) {
        document.getElementById('popup').style.display = 'block';
    } else {
        event.preventDefault(); // 폼 제출 막기
    }
}

//폼 유효성 검사
function validateForm() {
    // 닉네임이 중복되었을 경우
    if (isNickDuplicate) {
        alert('이미 사용중인 닉네임입니다. 다른 닉네임을 입력해주세요.');
        return false; // 폼 제출 중지
    }

    // 비밀번호 필드나 비밀번호 확인 필드가 빈 경우
    if (!document.getElementsByName("rmPw")[0].value || !document.getElementsByName("rmPwConfirm")[0].value) {
        alert("비밀번호를 입력해주세요");
        return false; // 폼 제출 중지
    }

    return true;
}




//전화번호 자동하이픈, 11글자넘지않게, 숫자만입력가능하게 코드작성==============================================
$(document).ready(function() {
    var phoneInput = $('form[action="userUpdate"] input[name="rmPhone"]');

    // 전화번호 입력필드에 키 입력 이벤트를 바인딩
    phoneInput.on('keyup', function(e) {
        var inputValue = $(this).val();
        var inputLength = inputValue.replace(/-/g, '').length;  // 하이픈 제외한 길이 계산

        // 백스페이스 키가 눌리지 않았고, 길이에 따라 하이픈 삽입
        // 입력값의 마지막 문자가 하이픈이 아닌 경우에만 하이픈 추가
        if(e.keyCode !== 8 && inputValue[inputValue.length-1] !== '-' && inputLength <= 11 && (inputLength === 3 || inputLength === 7)) {
            $(this).val(inputValue + '-');
        }

        // 전체 입력값이 13자리를 초과하면 입력을 막음
        if(inputValue.length > 13) {
            $(this).val(inputValue.slice(0, 13));
        }
    });

    // 숫자, 백스페이스, 탭키, 좌우 화살표키를 제외한 나머지 키 입력을 차단
    phoneInput.on('keydown', function(e) {
        if ((e.keyCode !== 109 && e.keyCode !== 189) && (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105) && e.keyCode !== 8 && e.keyCode !== 9 && e.keyCode !== 37 && e.keyCode !== 39) {
            e.preventDefault();
        }
    });

    // 한글 입력 방지 및 특수문자 입력 방지 (하이픈 제외)
    phoneInput.on('input', function() {
        $(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|`~!@#$%^&*()_|+\=?;:'",.<>\{\}\[\]\\\/]/gi, ''));
    });
});


//이메일과 닉네임에 한글,영어,숫자 외의 특수문자 입력 X 코드=======================================

$(document).ready(function() {
    var emailInput = $('form[action="userUpdate"] input[name="rmEmail"]');
    var nickInput = $('form[action="userUpdate"] input[name="rmNick"]');

    // 이메일 입력 필드에 한글, 영어, 숫자 외의 문자 입력 방지
    emailInput.on('input', function() {
        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣@._-]/g, ''));
    });

    // 닉네임 입력 필드에 한글, 영어, 숫자 외의 문자 입력 방지
    nickInput.on('input', function() {
        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]/g, ''));
    });
});


//비밀번호 확인 ajax코드===================================================================


$(document).ready(function() {
	//비밀번호 확인
	var inputPw = $('form[action="userUpdate"] input[name="rmPw"]');
	var inputPwConfirm = $('form[action="userUpdate"] input[name="rmPwConfirm"]');

	inputPw.on('input', passwordCheck);
	inputPwConfirm.on('input', passwordCheck);
});

function passwordCheck() {
	var pw = $('form[action="userUpdate"] input[name="rmPw"]').val();
	var pwConfirm = $('form[action="userUpdate"] input[name="rmPwConfirm"]').val();

	if (pw === '' || pwConfirm === '') {
		$('#passwordCheckError').hide();
		return;
	}

	if (pw === pwConfirm) {
		console.log("비밀번호 일치");
		$('#passwordCheckError').html('비밀번호가 일치합니다').css("color", "Blue")
				.css("font-size", "13px").show();
	} else {
		console.log("비밀번호 불일치");
		$('#passwordCheckError').html('비밀번호가 일치하지 않습니다').css("color", "red")
				.css("font-size", "12px").show();
	}
	
}


//닉네임 중복확인=================================================================
$(document).ready(function(){

    var inputNick = $('form[action="userUpdate"] input[name="rmNick"]');

    inputNick.on('input', NickCheck);

});


	 function NickCheck(){
		    var Nickname = $('form[action="userUpdate"] input[name="rmNick"]').val();

		    // user.rmNick와 현재 입력된 닉네임이 일치하면 AJAX 요청을 보내지 않음
		    if (Nickname === '${user.rmNick}') {
		        $('#nameError').hide(); // 중복 검사 결과 숨김 처리
		        return;
		    }
		    
		    
		    
	        $.ajax({
	            url : 'nickCheck',
	            type: 'post',
	            data: {
	                "nick" : Nickname
	            },
	            success : function(res){
	                if(res == "true"){
	                    console.log("사용가능해요");
	                    $('#nameError').html('사용가능합니다').css("color","Blue" ).css("font-size" , "13px").show();
	                    isNickDuplicate = false; 
	                } else {
	                    console.log("사용중");
	                    $('#nameError').html('사용중인 닉네임 입니다').css("color","red").css("font-size" , "12px").show();
	                    isNickDuplicate = true; 
	                }
	            },
	            error : function(e){
	                console.log(e)
	            }
	        });
	    }





</script>


</body>
</html>