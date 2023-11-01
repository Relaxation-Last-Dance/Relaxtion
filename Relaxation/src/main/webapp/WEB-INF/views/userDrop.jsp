<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>회원탈퇴에 오신걸 환영합니다</h1>
		
		<h3>이메일 : ${user.rmEmail}</h3>
		<h3>닉네임 : ${user.rmNick}</h3>
		
		<form action="dropUserInfo" id="DropForm">
		<input type="hidden" value="${user.rmPw}" id="userPw">
		비밀번호 : <input type="password" name="rmPw" id="Pw">
		<br>
		비밀번호 확인 : <input type="password" name="rmPwConfirm" id="confirmPw" >
		<br>
		<input type="submit" value="회원탈퇴">
		<input type="button" value="뒤로가기" id="backBtn">
		
		</form>
		
		
	<script>
	// 뒤로가기
	  document.getElementById('backBtn').addEventListener('click', function() {
		    location.href = 'userDropBackBtn';
		  });
    // 비밀번호, 비밀번호 확인 값 같은지 확인, 입력한 비밀번호가 저장된 비밀번호와 같은지 확인
    document.getElementById('DropForm').addEventListener('submit', function(e) {
        var password = document.getElementById('Pw').value;
        var confirmPassword = document.getElementById('confirmPw').value;
        var userPassword = document.getElementById('userPw').value;

        if (password !== confirmPassword) {
            alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
            e.preventDefault();
        } else if (password !== userPassword) {
            alert('입력하신 비밀번호가 일치하지 않습니다.');
            e.preventDefault();
        }
    });
	</script>	
</body>
</html>