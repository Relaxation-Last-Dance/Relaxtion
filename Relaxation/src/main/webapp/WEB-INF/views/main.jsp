<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Relaxation</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
#musicPlayer {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	height: 200px;
}

#musicControls {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 10px;
}

#playButton, #previousButton, #nextButton {
	margin: 0 10px;
}

#progressBar {
	width: 300px;
	height: 10px;
	background-color: #ccc;
}

#progress {
	height: 100%;
	background-color: #00a0e9;
	width: 0%;
}

#progressContainer {
	width: 100px;
	height: 5px;
	background-color: #eee;
	position: relative;
}

#progressBar {
	height: 100%;
	background-color: #1db954; /* Spotify의 주 색상 */
	width: 0;
	position: absolute;
}
</style>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<h1>♬ Welcome to the Main Page_㈜Relaxation</h1>
	<c:if test="${!empty user}">
		<h3>${user.rmNick}님환영합니다!</h3>
	</c:if>

	<!-- 로그인하기전 user세션에 값이 없을 때 -->
	<c:if test="${empty user}">
		<table>
			<form action="goLogin" id="loginForm">
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

		<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=5f4adf5f781d4507aaf15fdd092cf73b&redirect_uri=http://localhost:8087/relax/kakaocallback">
		<img src="/resources/static/image/kakao_login_button.png"></a>

		<div style="width: 80px">
			<a href="goJoin"><h3>Join</h3></a>
		</div>
	</c:if>


	<!-- 로그인하고 세션에 값이 저장이 되어 있을 때 -->
	<c:if test="${!empty user}">

		<a href="goFaceMusic">FaceMusic</a>
		<a href="goMypage">MyPage</a>
		<a href="logout">LogOut</a>
	</c:if>

	<div>
		<div>플레이어</div>
		<div>
			<button id="prevTrack" class="fas fa-step-backward"></button>
			<button id="togglePlay" class="fas fa-play"></button>
			<button id="nextTrack" class="fas fa-step-forward"></button>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://sdk.scdn.co/spotify-player.js"></script>
	
	<%-- 스포티파이 API =========================================================--%>
		<script type="text/javascript">
		console.log('Access Token: ${sessionScope.accessToken}')
		   console.log('Token Type: ${sessionScope.tokenType}')
		   console.log('Scope: ${sessionScope.scope}')
		   console.log('Expires In: ${sessionScope.expiresIn}')
		   console.log('Refresh Token: ${sessionScope.refreshToken}')
		   
		   const url = 'https://api.spotify.com/v1/me/player/play?device_id=';
		   const token = '${sessionScope.accessToken}';
		   const headers = {
		          'Authorization': `Bearer ${sessionScope.accessToken}`,
		          'Content-Type': 'application/json'
		   };
		   const body = {
		          "context_uri": "spotify:album:5ht7ItJgpBH7W6vJ5BqpPr",
		          "offset": {
		              "position": 5
		          },
		          "position_ms": 0
		   };
		   
		    window.onSpotifyWebPlaybackSDKReady = () => {
		      const token = '${sessionScope.accessToken}'; // Replace with your accessToken from the session
		      const player = new Spotify.Player({
		        name: 'Web Playback SDK Template',
		        getOAuthToken: cb => { cb(token); },
		        volume: 0.5
		      });
		      
		      // Error handling
		      player.addListener('initialization_error', ({ message }) => { console.error(message); });
		      player.addListener('authentication_error', ({ message }) => { console.error(message); });
		      player.addListener('account_error', ({ message }) => { console.error(message); });
		      player.addListener('playback_error', ({ message }) => { console.error(message); });
		      // Playback status updates
		      player.addListener('player_state_changed', state => { console.log(state); });
		      
		      
		      // Ready
		      player.addListener('ready', ({ device_id }) => {
		        
		         console.log('Ready with Device ID', device_id);
		         fetch(url + device_id, {
		             method: 'PUT',
		             headers: headers,
		             body: JSON.stringify(body)
		         })
		         .then(data => console.log(data))
		         .catch(error => console.error('Error:', error));
		      });
		      
		      
		      // Not Ready
		      player.addListener('not_ready', ({ device_id }) => {
		        console.log('Device ID has gone offline', device_id);
		      });
		      
		      // Connect to the player!
		      player.connect().then(success => {
		        if (success) {
		          console.log('The Web Playback SDK successfully connected to Spotify!');
		        }
		      })
		    };
		    document.getElementById('play-pauseButton').addEventListener('click', function() {
		       var icon = this.firstChild;
		       if (icon.classList.contains('fa-play')) {
		         icon.classList.remove('fa-play');
		         icon.classList.add('fa-pause');
		         // 음악 재생 코드를 여기에 추가하세요.
		         player.togglePlay().then(() => {
		             console.log('재생이 시작되었습니다.');
		           });
		       } else {
		         icon.classList.remove('fa-pause');
		         icon.classList.add('fa-play');
		         // 음악 일시정지 코드를 여기에 추가하세요.
		         player.togglePlay().then(() => {
		             console.log('재생이 일시정지 되었습니다.');
		           });
		       }
		     });

        $(document).ready(function(){
        	var accessToken = '${sessionScope.accessToken}';
            var refreshToken = '${sessionScope.refreshToken}';
            
            if (!accessToken) {

	            $.ajax({
	                url: 'refresh_token',
	                method: 'GET',
	                success: function(response) {
	                    // accessToken과 refreshToken을 세션 스토리지에 저장합니다.
	                    console.log(response)
	                },
	                error: function(xhr, status, error) {
	                    console.error('Failed to refresh token: ', status, error);
	                }
	            });
            }
        });

        
        <%-- 로그인 실패시 alert ajax코드 --%>
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
					window.location.href = '/relax/goMain';
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
