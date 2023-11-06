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
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
                            <form action="userLogin" method="post" id="loginForm">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="InputEmail1" aria-describedby="emailHelp" placeholder="Enter E-mail" name="rmEmail">
                                    <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" id="InputPassword1" placeholder="Password" name="rmPw">
                                </div>
	                            <button type="button" class="btn oneMusic-btn mt-30" id="signupButton">회원가입</button>
                                
                                <button type="submit" class="btn oneMusic-btn mt-30">로그인</button>
                                <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=5f4adf5f781d4507aaf15fdd092cf73b&redirect_uri=http://localhost:8087/relax/kakaoCallback">
                                	<img src=./assets/img/core-img/카카오로그인.png alt="Login" class="image-button">
                                </a>
                            </form>
                        </div>
                    </div>
                    
                    <div class="modal-content">
                        <div class="wrapper">
                            <div class="title"><h1 style="font-size: 21px;">회원가입</h1></div>
                            
                            <form action="userJoin" method="post">
	                     		<input type="text" name="rmEmail" placeholder="email" class="joinEmail">@
							    <input type="text" name="rmEmail" id="customInput" style="display: none;" placeholder="입력해주세요" class="joinEmail">
							    <select name="rmEmail" onchange="handleLastEmailChange(this)">
									<option value="@naver.com">naver.com</option>
									<option value="@gmail.com">gmail.com</option>
									<option value="@nate.com">nate.com</option>
									<option value="@hanmail.net">hanmail.net</option>
									<option value="">직접입력</option>
								</select> 
								<div id="checkResult" style="display: none;"></div>
	                            
	                            <div class="password" style="margin-top: 30px;">
	                                <input name="rmPw" id="password" type="password" placeholder="비밀번호를 입력해 주세요.">
	                            </div>
	                            
	                            <div class="passwordCheck">
	                                <input name="rmPwConfirm" id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
	                                <div id="pwCheckResult" style="display: none;"></div>
	                            </div>
	                            
	                            <div class="nick">
	                                <input name="rmNick" id="nick"  type="text" placeholder="닉네임을 입력해 주세요.">
	                                <div id="nickCheckResult" style="display: none;"></div>
	                            </div>
	                            
	                            <div class="name">
	                                <input name="rmName" id="name"  type="text" placeholder="이름을 입력해 주세요.">
	                            </div>
	                            
	                            <div class="gender">
	                                <input id="gender_man" type="radio" name="rmGender" value="male">남성  
	                                <input id="gender_woman" type="radio" name="rmGender" value="female">여성
	                            </div>
	                            
	                            <div class="phone">
	                                <input name="rmPhone" id="phone1" maxlength="13" placeholder="전화번호를 입력해 주세요."> 
	                               
	                            </div>
	                         
	                           
	                            <div class="line">
	                                <hr>
	                            </div>
	                            <div class="signUp">
	                                <button id="signUpButton" style="margin-bottom: 10px;" type="sumbmit">가입하기</button>
	                                <button id="closeButton" onclick="closeCheck()">나가기</button>
	                            </div>
                            </form>
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
                            <li><a href="goAlbums">Albums</a></li>
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
<script type="text/javascript">

	var isEmailDuplicate = false; // 이메일 중복 여부 저장하는 변수
	var isNickDuplicate = false; // 닉네임 중복 여부 저장하는 변수
	
	//직접입력누르면 text보이게 하기 ------------------------------------------------------------
	function handleLastEmailChange(selectElement) {
	    var customDomainInput = document.getElementById('customInput');
	    if (selectElement.value === "") {
	        customDomainInput.style.display = 'inline';  // Show the text input for custom domain
	    } else {
	        customDomainInput.style.display = 'none';  // Hide the text input for custom domain
	    };
	};
	
	//===========================================================================
	$(document).ready(function(){
	    //email 확인
	    var inputEmail = $('input[name="rmEmail"]');
	    var selectEmail = $('select[name="rmEmail"]');
	    var customEmail = $('#customInput');
	
	    inputEmail.on('input', emailCheck);
	    selectEmail.on('change', emailCheck);
	    customEmail.on('input', emailCheck);
	});


	 function emailCheck(){
		    var emailPrefix = $('input[name="rmEmail"]').val();
		    var emailSuffix = $('select[name="rmEmail"]').val();
		    var customSuffix = $('#customInput').val();

	        // 사용자가 직접입력을 선택했을 경우
	        if(emailSuffix === '') {
	            emailSuffix = '@' + customSuffix;
	        }

	        var completeEmail = emailPrefix + emailSuffix;
			console.log(completeEmail)
			
	        if (emailPrefix === '' || emailSuffix === '') {
	            $('#checkResult').hide();
	            console.log('아무것도입력안함')
	            return;
	        }
		
	        $.ajax({
	            url : 'emailCheck',
	            type: 'post',
	            data: {
	                "email" : completeEmail
	            },
	            success : function(res){
	                if(res == "true"){
	                    console.log("사용가능해요");
	                    $('#checkResult').html('사용가능합니다').css("color","Blue" ).css("font-size" , "13px").show();
	                    isEmailDuplicate = false; // 이메일이 중복되지 않음을 저장
	                } else {
	                    console.log("사용중");
	                    $('#checkResult').html('사용중인ID입니다').css("color","red").css("font-size" , "12px").show();
	                    isEmailDuplicate = true; // 이메일이 중복됨을 저장
	                }
	            },
	            error : function(e){
	                console.log(e)
	            }
	        });
	    }

	//하나라도 입력값이 없으면 submit 버튼 실행 X ----------------------------------------------------------
	function validateForm() {
	    // 이메일이 중복되었을 경우
	    if (isEmailDuplicate) {
	        alert('이미 사용중인 이메일입니다. 다른 이메일을 입력해주세요.');
	        return false; // 폼 제출 중지
	    }
	   
	    if (isNickDuplicate){
	    	alert('이미 사용중인 닉네임입니다. 다른 닉네임을 입력해주세요.');
	    	return false; // 폼 제출 중지
	    }
	
	    // 필수 필드 중 하나라도 값이 누락된 경우ㄴ
	    if (
	        !document.getElementsByName("rmEmail")[0].value ||
	        !document.getElementsByName("rmPw")[0].value ||
	        !document.getElementsByName("rmNick")[0].value ||
	        !document.getElementsByName("rmName")[0].value ||
	        !document.querySelector('input[name="rmGender"]:checked') ||
	        !document.getElementsByName("rmPhone")[0].value
	    ) {
	        alert("회원정보를 입력해주세요");
	        return false; // 폼 제출 중지
	    }
	    return true;
	}
	
	// 비밀번호 확인 ajax코드===================================================================
		

	$(document).ready(function() {
	  //비밀번호 확인
	  var inputPw = $('input[name="rmPw"]');
	  var inputPwConfirm = $('input[name="rmPwConfirm"]');
	  inputPw.on('input', passwordCheck);
	  inputPwConfirm.on('input', passwordCheck);
	});
	function passwordCheck() {
	  var pw = $('input[name="rmPw"]').val();
	  var pwConfirm = $('input[name="rmPwConfirm"]').val();
	  if (pw === '' || pwConfirm === '') {
	    $('#pwCheckResult').hide();
	    return;
	  }
	  if (pw === pwConfirm) {
	    console.log("비밀번호 일치");
	    $('#pwCheckResult').html('비밀번호가 일치합니다').css("color", "Blue")
	        .css("font-size", "13px").show();
	  } else {
	    console.log("비밀번호 불일치");
	    $('#pwCheckResult').html('비밀번호가 일치하지 않습니다').css("color", "red")
	        .css("font-size", "12px").show();
	  }
	  
	}
	// 닉네임 중복 ajax코드 ===================================================================	

	$(document).ready(function(){
	    var inputNick = $('input[name="rmNick"]');
	    inputNick.on('input', NickCheck);
	});
	function NickCheck(){
	    var Nickname = $('input[name="rmNick"]').val();
	      $.ajax({
	          url : 'nickCheck',
	          type: 'post',
	          data: {
	              "nick" : Nickname
	          },
	          success : function(res){
	              if(res == "true"){
	                  console.log("사용가능해요");
	                  $('#nickCheckResult').html('사용가능합니다').css("color","Blue" ).css("font-size" , "13px").show();
	                  isNickDuplicate = false; 
	              } else {
	                  console.log("사용중");
	                  $('#nickCheckResult').html('사용중인 닉네임 입니다').css("color","red").css("font-size" , "12px").show();
	                  isNickDuplicate = true; 
	              }
	          },
	          error : function(e){
	              console.log(e)
	          }
	      });
	}
	//전화번호 자동하이픈, 11글자넘지않게, 숫자만입력가능하게 코드작성==============================================
	$(document).ready(function() {
    var phoneInput = $('input[name="rmPhone"]');

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
	    var emailInput = $('input[class="joinEmail"]');
	    var nickInput = $('input[class="joinEmail"]');
	
	    // 이메일 입력 필드에 한글, 영어, 숫자 외의 문자 입력 방지
	    emailInput.on('input', function() {
	        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣._-]/g, '')); // '@' 문자 제거
	    });
	
	    // 닉네임 입력 필드에 한글, 영어, 숫자 외의 문자 입력 방지
	    nickInput.on('input', function() {
	        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]/g, ''));
	    });
	});
		
	$('#loginForm').submit(function(e){
		e.preventDefault();
		
		var form = $(this)
		var url = form.attr('action')
		
		$.ajax({
			type : 'POST',
			url :  url,		
			data : form.serialize(),
			success : function(data){
				// 로그인 성공시 메인 페이지로 이동
				window.location.href = '/relax/goIndex';
			}, 
			error : function(data){
				// 로그인 실패시 에러 메세지 표시
				alert('이메일 또는 비밀번호를 잘못 입력하셨습니다.')
			}
		});
	})	
	</script>

</html>