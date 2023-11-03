<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Main Page</title>
<script src="https://sdk.scdn.co/spotify-player.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
.player-bar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 400px;
    height: 20px;
    margin-top: 20px;
}

.progress-bar {
    flex-grow: 1;
    height: 10px;
    background-color: #eee;
    margin: 0 10px;
}

.progress {
    height: 100%;
    background-color: #4caf50;
    width: 0;
}

</style>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<h1>Welcome to the Main Page</h1>
		<div>
			<div>플레이어</div>
			<div>
				<button id="prevTrack" class="fas fa-step-backward"></button>
				<button id="togglePlay" class="fas fa-play"></button>
				<button id="nextTrack" class="fas fa-step-forward"></button>
			</div>
			
			<div class="player-bar">
			    <div class="current-time" id="currentTime"></div>
			    <div class="progress-bar">
			        <div class="progress" id="progress"></div>
			    </div>
			    <div class="total-time" id="totalTime"></div>
			</div>
		</div>
</body>

<script>
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
	window.onSpotifyWebPlaybackSDKReady = () => {
		const player = new Spotify.Player({
		    name: 'Web Playback SDK Quick Start Player',
		    getOAuthToken: cb => { cb(token); },
		    volume: 0.5
		});
		
		var device_id;
		
		player.addListener('ready', ({ device_id : id }) => {
			console.log('The Web Playback SDK is ready to play music!');
			console.log('Device ID', id);
			device_id = id;
		});
		
	
        // Not Ready
        player.addListener('not_ready', ({ device_id }) => {
            console.log('Device ID has gone offline', device_id);
        });

        player.addListener('initialization_error', ({ message }) => {
            console.error(message);
        });

        player.addListener('authentication_error', ({ message }) => {
            console.error(message);
        });

        player.addListener('account_error', ({ message }) => {
            console.error(message);
        });
        const playButton = document.getElementById('togglePlay');
        const playlist = ["spotify:track:5mdl3TlXrImNPrIo3aO70q?si=6f41bac7bf16401c", "spotify:track:1q3axbxKGkwHdLLQtxmyl2?si=863452f5a7524f97"];
        document.getElementById('togglePlay').onclick = function() {
            player.togglePlay().then(() => {
                // 재생 버튼 클릭 시 fetch를 호출하여 트랙을 로드하고 재생합니다.
                player.getCurrentState().then(state => {
	                
	                if(state == null){
		                fetch(url + device_id, {
		                    method: 'PUT',
		                    headers: headers,
		                    body: JSON.stringify({
		                        "uris": playlist
		                    })
		                }).then(data => console.log(data)).catch(error => console.error('Error:', error));
		                
		                playButton.className ='fas fa-pause';
		                
	                } else {
	                	if(state.paused){
	                		playButton.className ='fas fa-pause';
	                	}else{
	                		playButton.className ='fas fa-play';
	                	}
	                }
	                console.log(state)
                });
            });
        };
        function formatTime(ms) {
            var seconds = Math.floor(ms / 1000);
            var minutes = Math.floor(seconds / 60);
            seconds = seconds % 60;
            return minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
        }

        // 진행 바를 클릭했을 때의 처리
        document.querySelector('.progress-bar').addEventListener('click', function(e) {
            var x = e.offsetX / this.offsetWidth;
            player.getCurrentState().then(state => {
                var duration = state.duration;
                var seekTime = Math.floor(x * duration);
                player.seek(seekTime);
            });
        });

        // 재생 상태가 변경될 때마다 현재 재생 시간과 진행 바를 업데이트하는 처리
        player.addListener('player_state_changed', state => {
            var currentTime = formatTime(state.position);
            var totalTime = formatTime(state.duration);
            var progress = state.position / state.duration;
            document.getElementById('currentTime').textContent = currentTime;
            document.getElementById('totalTime').textContent = totalTime;
            document.getElementById('progress').style.width = (progress * 100) + '%';
        });
        setInterval(function() {
            player.getCurrentState().then(state => {
                if (!state) return;
                var currentTime = formatTime(state.position);
                var totalTime = formatTime(state.duration);
                var progress = state.position / state.duration;
                document.getElementById('currentTime').textContent = currentTime;
                document.getElementById('totalTime').textContent = totalTime;
                document.getElementById('progress').style.width = (progress * 100) + '%';
            });
        }, 1000);
        document.getElementById('prevTrack').onclick = function() {
        	player.previousTrack()
        	if(playButton.className ='fas fa-play'){
	         	playButton.className ='fas fa-pause';
        	}
        };
        document.getElementById('nextTrack').onclick = function() {
        	player.nextTrack()
        	if(playButton.className ='fas fa-play'){
	         	playButton.className ='fas fa-pause';
        	}
        };
		player.connect().then(success => {
			  if (success) {
			    console.log('The Web Playback SDK successfully connected to Spotify!');
			  }
		});
	};
    
 
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
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
</script>

</html>
