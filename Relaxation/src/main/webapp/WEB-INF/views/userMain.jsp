<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>Hello </h1>
	<c:if test="${!empty user}">
		<h3>${user.rmNick}님 환영합니다!</h3>
	</c:if>

	<!-- 로그인하기전 user세션에 값이 없을 때 -->
	<c:if test="${empty user}">
		<table>
			<form action="userLogin" id="loginForm">
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">Email :</td>
				<td><input type="text" name="rmEmail"></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">PassWord :</td>
				<td><input type="password" name="rmPw"></td>
			</tr>
		</table>

		<input type="submit" value="로그인">
		</form>

		<a
			href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=5f4adf5f781d4507aaf15fdd092cf73b&redirect_uri=http://localhost:8087/relax/kakaoCallback
		"><img
			src=image/kakao_login_button.png></a>

		<div style="width: 80px">
			<a href="goUserJoin"><h3>Join</h3></a>
		</div>
	</c:if>


	<!-- 로그인하고 세션에 값이 저장이 되어 있을 때 -->
	<c:if test="${!empty user}">

		<a href="goUserFaceMusic">FaceMusic</a>
		<a href="goUserMypage">MyPage</a>
		<a href="userLogout">LogOut</a>
	</c:if>



	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">

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
					window.location.href = '/relax/goUserMain';
				}, 
				error : function(data){
					// 로그인 실패시 에러 메세지 표시
					alert('이메일 또는 비밀번호를 잘못 입력하셨습니다.')
				}
			});
		})
		
		
		
		<%-- 카카오로그인 --%>		
		window.Kakao.init("06c262b9ce13cb8a7e53413a68118b6c");
		function KakaoLogin() {
			window.Kakao.Auth.login({
				scope : 'profile_nickname,account_email,gender,age_range',
				success : function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url : '/v2/user/me',
						success : res => {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						}
					});
				}
			});
		}




		
		
	</script>
</body>
</html>