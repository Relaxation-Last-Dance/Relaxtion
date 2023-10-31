<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 이메일, 비밀번호, 닉네임, 이름, 성별, 전화번호, 선호 아티스트, 선호 장르 -->

	<form action="userJoin" method="post" onsubmit="return validateForm()">
		<table width="auto">

			<tr>
				<th height="50px" colspan="2" bgcolor="gray" align="center">step1
					: 이메일/ 비밀번호 입력</th>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이메일 :</td>
				<td><input type="text" name="rmEmail" placeholder="로그인 시 필요">
					@ <select name="rmEmail" onchange="handleLastEmailChange(this)">
						<option value="@naver.com">naver.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@nate.com">nate.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="">직접입력</option>
				</select> <input type="text" name="rmEmail" id="customInput"
					style="display: none;" placeholder="입력해주세요">
					<div id="checkResult" style="display: none;"></div></td>

			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 :</td>
				<td><input type="password" name="rmPw"></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 확인 :</td>
				<td><input type="password" name="rmPwConfirm">
				<div id="pwCheckResult" style="display: none;"></div>
				</td>
				
			</tr>
			<!-- step1 끝 -->
			<tr>
				<th height="45" colspan="2" bgcolor="gray" width="400"
					align="center">step2 : 개인정보 (이메일과 닉네임은 특수문자가 불가능합니다)</th>
			</tr>

			<tr height="35" bgcolor="whitesmoke">
				<td align="right">닉네임 :</td>
				<td><input type="text" name="rmNick">
				<div id="nickCheckResult" style="display: none;"></div>
				</td>
				
			</tr>

			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이름 :</td>
				<td><input type="text" name="rmName"></td>
			</tr>

			<tr height="35" bgcolor="whitesmoke">
				<td align="right">성별 :</td>
				<td>남<input type="radio" name="rmGender" value="male">
					여<input type="radio" name="rmGender" value="female">
				</td>
			</tr>

			<tr height="35" bgcolor="whitesmoke">
				<td align="right">전화번호 :</td>
				<td><input type="text" name="rmPhone"></td>
			</tr>
			<!-- step2 끝 -->

			<tr>
				<th height="45" colspan="2" bgcolor="gray" width="400"
					align="center">step3 : 선호도(최대 선택 3개)</th>
			</tr>



			<tr height="35" bgcolor="whitesmoke">
				<td align="right">좋아하는 장르 :</td>
				<td>발라드<input type="checkbox" name="rmGenre" value="발라드">
					댄스<input type="checkbox" name="rmGenre" value="댄스"> 랩/힙합<input
					type="checkbox" name="rmGenre" value="랩/힙합"> R&B/Soul<input
					type="checkbox" name="rmGenre" value="R&B/Soul"> 인디음악<input
					type="checkbox" name="rmGenre" value="인디음악"> 록/메탈<input
					type="checkbox" name="rmGenre" value="록/메탈"> 트로트<input
					type="checkbox" name="rmGenre" value="트로트"> 포크/블루스<input
					type="checkbox" name="rmGenre" value="포크/블루스">
				</td>
			</tr>

			<!-- step3 끝 -->


			<tr height="35" bgcolor="whitesmoke">
				<td colspan="2" align="center"><input type="submit"
					value="회원가입"></td>
			</tr>
		</table>

	</form>


	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
		
	var isEmailDuplicate = false; // 이메일 중복 여부 저장하는 변수
	var isNickDuplicate = false; // 닉네임 중복 여부 저장하는 변수
	// 4개이상 선택 X 코드------------------------------------------------------------------------
	function check_count(obj){  
			
			var chkBox = document.getElementsByName("rmGenre"); // name값 불러옴
			var chkCnt = 0; // 초기값 0 설정
			
			for(var i = 0 ; i < chkBox.length ; i++ ){
				if(chkBox[i].checked){  // 조건문으로 chkBox가 checked됐을 경우
					chkCnt++;           // 1씩 증가
				}	
			}
			if(chkCnt > 3){ // 조건문으로 chkCnt가 3보다 클경우
				alert("3개까지 체크할 수 있습니다.") // alert를 띄움
				obj.checked = false; // false를 줘서 alert를 띄운 뒤에 check되지 않도록 설정
				return false;
				
			}	
		}
	
	// 체크박스 변화 감지 및 함수 호출------------------------------------------------------------
	var checkboxes = document.getElementsByName('rmGenre');
	for(var i = 0; i<checkboxes.length; i++){
		checkboxes[i].addEventListener('change',function(){
			check_count(this);
		});
	}
	
	//직접입력누르면 text보이게 하기 ------------------------------------------------------------
	function handleLastEmailChange(selectElement) {
	    var customDomainInput = document.getElementById('customInput');
	    if (selectElement.value === '') {
	        customDomainInput.style.display = 'inline';  // Show the text input for custom domain
	    } else {
	        customDomainInput.style.display = 'none';  // Hide the text input for custom domain

	    }
	}
	
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
    var emailInput = $('input[name="rmEmail"]');
    var nickInput = $('input[name="rmNick"]');

    // 이메일 입력 필드에 한글, 영어, 숫자 외의 문자 입력 방지
    emailInput.on('input', function() {
        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣._-]/g, '')); // '@' 문자 제거
    });

    // 닉네임 입력 필드에 한글, 영어, 숫자 외의 문자 입력 방지
    nickInput.on('input', function() {
        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]/g, ''));
    });
});
		
		
	</script>





</body>
</html>