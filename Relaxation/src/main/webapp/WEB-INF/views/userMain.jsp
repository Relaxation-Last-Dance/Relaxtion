<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .table-container {
        display: flex;
        justify-content: space-between;
    }

    .table-container > div {
        flex: 1;
        margin: 0 10px;
    }

    .table-wrapper {
        width: 70%;
        margin: 0 auto;
    }

    table {
        width: 100%;
        height: 300px; /* 테이블 높이를 고정 값으로 설정 */
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
        vertical-align: middle; /* 텍스트를 수직 방향으로 가운데 정렬 */
    }

    th {
        background-color: #d3d3d3;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #e9e9e9;
    }

    tr:hover {
        background-color: #c0c0c0;
    }
    
     .login-table {
        width: 30%; /* 로그인 테이블의 너비를 조절 */
        margin: 0 auto; /* 로그인 테이블을 가운데 정렬 */
    }

    .login-table th, .login-table td {
        padding: 5px; /* 셀 안의 패딩을 조절 */
        text-align: center;
        vertical-align: middle;
    }
     .login-table-container {
    text-align: left; /* 텍스트 정렬을 왼쪽으로 설정 */
    margin: 0 auto; /* 가운데 정렬 취소 */
}       
    
</style>

<div class="login-table-container">
    <!-- 테이블 코드 -->
</div>
</head>
<body>

<div>
	<h1>Hello Relaxation </h1>
	<c:if test="${!empty user}">
		<h3>${user.rmNick}님 환영합니다!</h3>
	</c:if>

	<!-- 로그인하기전 user세션에 값이 없을 때 -->
	<c:if test="${empty user}">
		<table class="login-table">
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
</div>

	<!-- 로그인하고 세션에 값이 저장이 되어 있을 때 -->
	<c:if test="${!empty user}">

		<a href="goUserFaceMusic">FaceMusic</a>
		<a href="goUserMypage">MyPage</a>
		<a href="#">Albums</a>
		<a href="goUserMusicPlayer">MusicPlayer</a>
		<a href="userLogout">LogOut</a>
	</c:if>


<div class="table-container">
    <div>
        <h2>추천 TOP Relaxation</h2>
        <table>
            <tr>
                <th>사진</th>
                <th>Artist</th>
                <th>Title</th>
            </tr>
            <c:forEach var="artist" items="${findRandom7}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${artist.rmuSinger}</td>
                    <td>${artist.rmuTitle}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div>
        <h2>${findRandom7BySinger[0].rmuSinger}의 Best Title</h2>
        <table>
            <tr>
                <th>사진</th>
                <th>Title</th>
            </tr>
            <c:forEach var="music" items="${findRandom7BySinger}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${music.rmuTitle}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div>
        <h2>Popular Artists</h2>
        <table>
            <tr>
                <th>사진</th>
                <th>Artist</th>
            </tr>
            <c:forEach var="artist" items="${top7Artist}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${artist}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
	
























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