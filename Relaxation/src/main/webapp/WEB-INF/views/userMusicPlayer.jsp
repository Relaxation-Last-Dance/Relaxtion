<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

	<style>
		/* 스타일을 추가해주세요 */
		/* 헤더 스타일 */
		h2 {
			text-align: center;
			margin-top: 20px;
			margin-bottom: 10px;
		}

		/* 플레이어 정보 스타일 */
		.player-info {
			text-align: center;
			margin-bottom: 20px;
		}

		.player-info img {
			width: 100px;
			height: 100px;
			border-radius: 50%;
			object-fit: cover;
		}

		.player-info #currentTitle {
			font-size: 20px;
			font-weight: bold;
			margin-top: 10px;
		}

		.player-info #currentSinger {
			font-size: 16px;
			color: #666;
			margin-top: 5px;
		}

   #prevTrack, #togglePlay, #nextTrack, #likeButton {
        border: none;
        background: none;
        font-size: 25px;
        margin-right: 10px;
        cursor: pointer;
    }

/* 플레이어 바 스타일 */
	/* 플레이어 바 스타일 */
	.player-bar {
		display: flex;
		align-items: center;
		justify-content: center; /* 가운데 정렬 */
		width: 600px; /* 원하는 길이로 조정 */
		height: 20px;
		margin-top: 20px;
		margin-bottom: 20px; /* 바와 하단 간격 조정 */
		margin-left: auto; /* 왼쪽 여백을 auto로 설정 */
		margin-right: auto; /* 오른쪽 여백을 auto로 설정 */
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

	.current-time,
	.total-time {
		font-size: 12px;
	}

		/* 플레이리스트 스타일 */
		.playlist-container {
			display: flex;
			justify-content: space-between;
			margin-top: 20px;
		}

		.playlist-container>div {
			flex: 1;
			margin: 0 10px;
		}

		.playlist-wrapper {
			width: 70%;
			margin: 0 auto;
		}

	.playlist-table {
		width: max-content; /* 최대 내용에 맞게 가로 길이 설정 */
		height: 300px;
		border-collapse: collapse;
		margin: 0 auto; /* 가운데 정렬 */
	}
		.playlist-table th,
		.playlist-table td {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: center;
			vertical-align: middle;
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
        color: white;
        border: none;
    }

    .playlist-table button:hover {
        background-color: #45a049;
    }
		.fas.fa-heart {
			color: red;
		}
		
		 /* 재생 버튼과 다른 버튼들을 가운데로 정렬하는 스타일 */
	  div.navigation {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	  }
			
		.playlist-table img {
		width: 15%;
		height: auto;
	}
	
    /* 기존 스타일 아래에 추가 */
    .playlist-table .playlist-button {
        background-color: skyblue;
    }

    .playlist-table .playlist-button:hover {
        background-color: deepskyblue;
    }

    .playlist-table .delete-button {
        background-color: gray;
    }

    .playlist-table .delete-button:hover {
        background-color: darkgray;
    }
		
		td:nth-child(1) {
 		 width: 290px; /* 원하는 크기로 설정 */
 		 heignt : 300px;
 		 overflow: hidden;
}
	</style>

</head>

<body>

	<h2>${user.rmNick}의 PlaylisT</h2>
	<div class="player-info">
		<img id="currentAlbum" src="" alt="album image">
		<div id="currentTitle"></div>
		<div id="currentSinger"></div>
	</div>

	<div class="navigation">
		<button id="prevTrack" class="fas fa-step-backward"></button>
		<button id="togglePlay" class="fas fa-play"></button>
		<button id="nextTrack" class="fas fa-step-forward"></button>
		<button id="likeButton" class="far fa-heart"></button>
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
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="song" items="${musicInfo}" varStatus="status">
						<tr>
							<td><img src="${song.rmuAlbumImg}" ></td>
							<td>${song.rmuTitle}</td>
							<td>${song.rmuSinger}</td>
							<td><button type="button" class="playlist-button">PLAY</button></td>
							<td><button type="button" class="delete-button"
									data-song-id="${song.rmuSeq}">X</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


	<script src="https://sdk.scdn.co/spotify-player.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">


var currentSongId = null;  // 현재 재생 중인 노래의 시퀀스 번호를 저장할 변수
var playlist = [];
var titles = [];
var singers = [];
var albums = [];
var songIds = []; // 좋아요취소버튼시 사용
var favMusic = [];
var currentTrack = 0; // 현재 재생 중인 트랙의 인덱스

// 재생되는 노래 정보를 화면에 표시하는 함수
function updateTrackInfo() {
    document.getElementById('currentTitle').textContent = titles[currentTrack];
    document.getElementById('currentSinger').textContent = singers[currentTrack];
    document.getElementById('currentAlbum').src = albums[currentTrack];
    
    // 현재 재생 중인 노래의 ID를 가져옵니다.
    var currentSongId = songIds[currentTrack];
	console.log(currentSongId)
	console.log("여기 잘뜨노??!!")
    // 현재 노래의 좋아요 상태를 확인하고, 좋아요 버튼의 상태를 업데이트
    if (favMusic.includes(currentSongId)) {
        // 해당 노래에 좋아요를 눌렀다면, 좋아요 버튼을 활성화 상태로 설정
        $('#likeButton').removeClass('far').addClass('fas');
    } else {
        // 해당 노래에 좋아요를 누르지 않았다면, 좋아요 버튼을 비활성화 상태로 설정
        $('#likeButton').removeClass('fas').addClass('far');
    }
    
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
   
   var device_id;
   const playButton = document.getElementById('togglePlay');
  
   
   // 여기 시작
   window.onSpotifyWebPlaybackSDKReady = () => {
      const player = new Spotify.Player({
          name: 'Web Playback SDK Quick Start Player',
          getOAuthToken: cb => { cb(token); },
          volume: 0.5
      });
   
      device_id;
      
      player.addListener('ready', ({ device_id : id }) => {
         console.log('The Web Playback SDK is ready to play music!');
         console.log('Device ID', id);
         device_id = id;
      });
      
   
      

        
       // 재생 버튼 클릭 이벤트 핸들러dkslaus
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
                currentSongId = songIds[currentTrack];  // 현재 재생 중인 노래의 ID를 업데이트
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
            currentSongId = songIds[currentTrack];  // 현재 재생 중인 노래의 ID를 업데이트
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
            	<c:forEach var="song" items="${favMusicList}">
            		favMusic.push("${song.rmuSeq}");  // 좋아요 누른 곡의 시퀀스 번호 추가
      			</c:forEach>
            		console.log("좋아요 누른 노래?")
            		console.log(favMusic)
            
            // 페이지 로딩 완료 후 첫 번째 곡 정보 업데이트
        <c:forEach var="song" items="${musicInfo}">
        	  songIds.push("${song.rmuSeq}");  // 시퀀스 번호 추가
              playlist.push("${song.rmuUri}");
              titles.push("${song.rmuTitle}");
              singers.push("${song.rmuSinger}");
              albums.push("${song.rmuAlbumImg}")
       </c:forEach>
              
             if (songIds.length > 0) {
                  currentSongId = songIds[0];  // 첫 번째 곡의 시퀀스 번호로 초기화
              } 
             
          console.log("값이 잘 들어왔는가?");
          console.log(songIds);
            
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
            
            // 삭제버튼 클릭시 삭제기능
            $('.delete-button').click(function() {
        var songId = $(this).data('song-id');
        
        $.ajax({
            url: 'deleteSong',  // 서버에 요청할 URL
            type: 'POST',  // HTTP 메서드
            data: { 'rmuSeq': songId },  // 서버에 보낼 데이터
            success: function(data) {
                // 서버로부터 응답이 성공적으로 왔을 때 실행할 코드
                let table = $('.playlist-table tbody');
                table.empty();  // 기존의 테이블 데이터 삭제
                for (let i = 0; i < data.length; i++) {
                    let tr = '<tr>';
                    tr += '<td>' + data[i].rmuTitle + '</td>';
                    tr += '<td>' + data[i].rmuSinger + '</td>';
                    tr += '<td><button type="button" class="playlist-button">재생</button></td>';
                    tr += '<td><button type="button" class="delete-button" data-song-id="' + data[i].rmuSeq + '">삭제</button></td>';
                    tr += '</tr>';
                    table.append(tr);
                }
                location.reload();
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // 요청이 실패했을 때 실행할 코드
            }
        });
    });
            
            
            $('.playlist-button').click(function() {
                // 현재 클릭된 행의 인덱스를 가져옵니다.
                var rowIndex = $(this).closest('tr').index();
                
                // 해당 인덱스의 곡을 재생합니다.
                currentTrack = rowIndex;
                currentSongId = songIds[rowIndex];  // 시퀀스 번호 저장
                // 재생할 곡의 URI를 재생 목록에 추가
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
            
            
            
            $('#likeButton').click(function() {
                // 현재 재생 중인 노래의 ID를 가져옵니다.
                var songId = currentSongId
                console.log("songId: ", songId); 

                // 좋아요 버튼의 현재 상태를 가져옵니다.
                var isLiked = $(this).hasClass('fas');

                // AJAX 요청을 보냅니다.
                $.ajax({
                    url: isLiked ? 'unlikeSong' : 'likeSong',  // 서버에 요청할 URL
                    type: isLiked ? 'DELETE' : 'POST',  // HTTP 메서드
                    data: { 'rmuSeq': songId },  // 서버에 보낼 데이터
                    success: function(response) {
                        // 서버로부터 응답이 성공적으로 왔을 때 실행할 코드
                        // 좋아요 버튼의 상태를 업데이트합니다.
            if (isLiked) {
                $('#likeButton').removeClass('fas').addClass('far');
                console.log("좋아요 취소성공!")

                // favMusic 배열에서 노래 ID를 제거합니다.
                var index = favMusic.indexOf(songId);
                if (index !== -1) favMusic.splice(index, 1);
         			   } else {
                $('#likeButton').removeClass('far').addClass('fas');
                console.log("좋아요 클릭성공!")

                // favMusic 배열에 노래 ID를 추가합니다.
                favMusic.push(songId);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        // 요청이 실패했을 때 실행할 코드
                        console.error('Failed to like/unlike the song: ', textStatus, errorThrown);
                        alert('Failed to like/unlike the song: ' + textStatus);
                    }
                });
            });
            
            
            
            
        });

</script>
</body>
</html>