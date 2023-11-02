<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<form action="userUpdate" method="post" onsubmit="return validateForm()">
		<table width="auto">

			<tr>
				<th height="50px" colspan="2" bgcolor="gray" align="center">이름과
					이메일은 수정할 수 없습니다.</th>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이메일 :</td>
				<td><input type="text" name="rmEmail" value=" ${user.rmEmail}"
					readonly="readonly"></td>
			
			<%-- 카카오톡유저일때 --%>
		<c:choose>
			<c:when test="${user.rmPhone eq '카카오회원'}">
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 :</td>
				<td><input type="password" name="rmPw" value="${user.rmPw}" readonly="readonly"></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 확인 :</td>
				<td><input type="password" name="rmPwConfirm" value="${user.rmPw}" readonly="readonly"></td>
			</tr>
			</c:when>
			
			<%-- 카카오톡유저가 아닐때 --%>
			<c:otherwise>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 :</td>
				<td><input type="password" name="rmPw" value="${user.rmPw}" ></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 확인 :</td>
				<td><input type="password" value="${user.rmPw}" name="rmPwConfirm">
				<div id="pwCheckResult" style="display: none;"></div></td>
			</tr>
			</c:otherwise>
		</c:choose>
			<!-- step1 끝 -->
			<tr>
				<th height="45" colspan="2" bgcolor="gray" width="400"
					align="center">개인정보</th>
			</tr>

			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이름 :</td>
				<td><input type="text" name="rmName" value="${user.rmName}"
					readonly="readonly"></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">닉네임 :</td>
				<td><input type="text" name="rmNick" value="${user.rmNick}">
				<div id="nickCheckResult" style="display: none;"></div></td>
			</tr>
			<%-- 카카오톡유저는 전화번호 안뜸 X --%>
			<c:choose>
				<c:when test="${user.rmPhone eq '카카오회원'}">
				</c:when>
				
				<%-- 일반유저는 전화번호 수정 가능 --%>
				<c:otherwise>
					<tr height="35" bgcolor="whitesmoke">
						<td align="right">전화번호 :</td>
						<td><input type="text" name="rmPhone" value="${user.rmPhone}"></td>
					</tr>	
				</c:otherwise>
			</c:choose>

			<tr height="35" bgcolor="whitesmoke">
				<td colspan="2" align="center">
					<input type="submit" value="정보 수정하기"> 
					<button type="button" onclick="location.href='gotoUserMypage'">뒤로가기</button>
				</td>
			</tr>
		</table>
	</form>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	var isNickDuplicate = false; // 닉네임 중복 여부 저장하는 변수
        

     // 폼 제출 이벤트 핸들러 추가
        document.querySelector('form').addEventListener('submit', function(e) {
            var password = document.querySelector('input[name="rmPw"]').value;
            var confirmPassword = document.querySelectorAll('input[type="password"]')[1].value; 
            // 비밀번호 확인은 두 번째 password 타입 input

            if (!password || !confirmPassword) {
       			 e.preventDefault();  // 폼 제출 막기
   			     alert('비밀번호를 입력하세요.');
   			 } else if (password !== confirmPassword) {
       			 e.preventDefault();  // 폼 제출 막기
  				 alert('비밀번호가 일치하지 않습니다');
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
        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣@._-]/g, ''));
    });

    // 닉네임 입력 필드에 한글, 영어, 숫자 외의 문자 입력 방지
    nickInput.on('input', function() {
        $(this).val($(this).val().replace(/[^a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]/g, ''));
    });
});

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

// 닉네임 중복확인=================================================================
		$(document).ready(function(){

		    var inputNick = $('input[name="rmNick"]');

		    inputNick.on('input', NickCheck);

		});


			 function NickCheck(){
				    var Nickname = $('input[name="rmNick"]').val();

				    // user.rmNick와 현재 입력된 닉네임이 일치하면 AJAX 요청을 보내지 않음
				    if (Nickname === '${user.rmNick}') {
				        $('#nickCheckResult').hide(); // 중복 검사 결과 숨김 처리
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

//하나라도 입력값이 없으면 submit 버튼 실행 X ----------------------------------------------------------

	function validateForm() {
    // 닉네임이 중복되었을 경우
    if (isNickDuplicate){
    	alert('이미 사용중인 닉네임입니다. 다른 닉네임을 입력해주세요.');
    	return false; // 폼 제출 중지
    }

    // 비밀번호 필드나 비밀번호 확인 필드가 빈 경우
    if (!document.getElementsByName("rmPw")[0].value || !document.getElementsByName("rmPwConfirm")[0].value) {
        alert("비밀번호를 입력해주세요");
        return false; // 폼 제출 중지
    }

    return true

}




    
</script>
</body>
</html>