<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   <link rel="icon" href="data:;base64,iVBORw0KGgo=">
   
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
   /*=================================== */

    .playlist-container {
        display: flex;
        justify-content: space-between;
    }

    .playlist-container > div {
        flex: 1;
        margin: 0 10px;
    }

    .playlist-wrapper {
        width: 70%;
        margin: 0 auto;
    }

    .playlist-table {
        width: 100%;
        height: 300px; /* 테이블 높이를 고정 값으로 설정 */
        border-collapse: collapse;
    }

    .playlist-table th, .playlist-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
        vertical-align: middle; /* 텍스트를 수직 방향으로 가운데 정렬 */
    }

    .playlist-table th {
        background-color: #d3d3d3;
        color: white;
    }

    .playlist-table tr:nth-child(even) {
        background-color: #e9e9e9;
    }

    .playlist-table tr:hover {
        background-color: #c0c0c0;
    }

    .playlist-table button {
        padding: 5px;
        background-color: #4CAF50; /* 버튼의 배경색 */
        color: white; /* 버튼의 텍스트 색상 */
        border: none; /* 버튼의 테두리 제거 */
    }

    .playlist-table button:hover {
        background-color: #45a049; /* 마우스가 버튼 위에 있을 때의 배경색 */
    }
    
    .player-info {
    text-align: center;
    margin-bottom: 20px;
}

.player-info #currentTitle {
    font-size: 20px;
    font-weight: bold;
}

.player-info #currentSinger {
    font-size: 16px;
    color: #666;
}

#currentAlbum {
    width: 100px;
    height: 100px;
}

    
</style>

</head>

<body>

         <h2>${user.rmNick}의 재생목록</h2>
<div class="player-info">
   <img id="currentAlbum" src="" alt="album image">
    <div id="currentTitle"></div>
    <div id="currentSinger"></div>
</div>

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


<div class="playlist-container">
    <div class="playlist-wrapper">
        <table class="playlist-table" border="1">
            <thead>
                <tr>
                    <th>노래 제목</th>
                    <th>아티스트</th>
                    <th>재생버튼</th>
                    <th>플레이리스트 버튼</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="song" items="${musicInfo}" varStatus="status">
                    <tr>
                        <td>${song.rmuTitle}</td>
                        <td>${song.rmuSinger}</td>
                        <td><button type="button" class="playlist-button">재생</button></td>
                        <td><button type="button" class="playlist-button">플레이리스트에 추가</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<script src="https://sdk.scdn.co/spotify-player.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

var playlist = [];
var titles = [];
var singers = [];
var albums = [];
var currentTrack = 0; // 현재 재생 중인 트랙의 인덱스

// 재생되는 노래 정보를 화면에 표시하는 함수
function updateTrackInfo() {
    document.getElementById('currentTitle').textContent = titles[currentTrack];
    document.getElementById('currentSinger').textContent = singers[currentTrack];
    document.getElementById('currentAlbum').src = albums[currentTrack];
}

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
   
   
   // 여기 시작
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
      
   
        const playButton = document.getElementById('togglePlay');

        
       // 재생 버튼 클릭 이벤트 핸들러
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
                      
                      updateTrackInfo();
                      
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

            var currentUri = state.track_window.current_track.uri;

            console.log("재생중 노래 URI")
            console.log(currentUri)

            for (var i = 0; i < playlist.length; i++) {
                if (playlist[i] === currentUri) {
                    currentTrack = i;
                    break;
                }
            }

            // 마지막 트랙이 끝났는지 확인
            if (state.track_window.previous_track && state.track_window.previous_track.uri === playlist[playlist.length - 1] &&
                state.paused && state.position === 0) {
                // 첫 번째 트랙으로 돌아감
                fetch(url + device_id, {
                    method: 'PUT',
                    headers: headers,
                    body: JSON.stringify({
                        "uris": [playlist[0]]
                    })
                }).then(data => console.log(data)).catch(error => console.error('Error:', error));
                currentTrack = 0;
                player.resume();
            }
            // 현재 트랙이 끝났는지 확인
            else if (state.paused && state.position === 0) {
                // 다음 트랙으로 넘어감
                currentTrack = (currentTrack + 1) % playlist.length;
                fetch(url + device_id, {
                    method: 'PUT',
                    headers: headers,
                    body: JSON.stringify({
                        "uris": [playlist[currentTrack]]
                    })
                }).then(data => console.log(data)).catch(error => console.error('Error:', error));
                player.resume();
            }

            updateTrackInfo();
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
        
     // 이전 트랙 버튼 클릭 이벤트 핸들러
        document.getElementById('prevTrack').onclick = function() {
            player.previousTrack().then(() => {
                currentTrack = (currentTrack - 1 + playlist.length) % playlist.length; // 이전 트랙 인덱스로 업데이트

                // 이전 곡의 URI를 재생 목록에 추가
                fetch(url + device_id, {
                    method: 'PUT',
                    headers: headers,
                    body: JSON.stringify({
                        "uris": [playlist[currentTrack]]
                    })
                }).then(data => console.log(data)).catch(error => console.error('Error:', error));

                if(playButton.className = 'fas fa-play'){
                    playButton.className = 'fas fa-pause';
                }
                updateTrackInfo();

                // setTimeout 함수를 사용하여 resume 함수 호출을 1초 지연
                setTimeout(() => {
                    player.resume();
                }, 1000);
            });
        };
        
     // 다음 트랙 버튼 클릭 이벤트 핸들러
        document.getElementById('nextTrack').onclick = function() {
            currentTrack = (currentTrack + 1) % playlist.length; // 다음 트랙 인덱스로 업데이트

            // 다음 곡의 URI를 재생 목록에 추가
            fetch(url + device_id, {
                method: 'PUT',
                headers: headers,
                body: JSON.stringify({
                    "uris": [playlist[currentTrack]]
                })
            }).then(data => console.log(data)).catch(error => console.error('Error:', error));

            if(playButton.className = 'fas fa-play'){
                playButton.className = 'fas fa-pause';
            }
            updateTrackInfo();

            // setTimeout 함수를 사용하여 resume 함수 호출을 1초 지연
            setTimeout(() => {
                player.resume();
            }, 1000);
        };

      player.connect().then(success => {
           if (success) {
             console.log('The Web Playback SDK successfully connected to Spotify!');
           }
      });
   };// 여기 끝
    

        $(document).ready(function(){
           var accessToken = '${sessionScope.accessToken}';
            var refreshToken = '${sessionScope.refreshToken}';
            
            // 페이지 로딩 완료 후 첫 번째 곡 정보 업데이트
        <c:forEach var="song" items="${musicInfo}">
              playlist.push('${song.rmuUri}');
              titles.push('${song.rmuTitle}');
             singers.push('${song.rmuSinger}');
             albums.push('${song.rmuAlbumImg}')
       </c:forEach>
          console.log("값이 잘 들어왔는가?");
          console.log(titles);
            
            updateTrackInfo();
            
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
</body>
</html>