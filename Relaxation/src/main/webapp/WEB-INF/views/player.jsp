<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>




<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/412379eca8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./assets/style.css">
    <script src="https://sdk.scdn.co/spotify-player.js"></script>
    <title>음악 플레이어</title>
</head>

<body>
    <div class="play-container">
        <header class="page_one__header">
            <img src="./assets/img/bg-img/닫기.png" alt="Your image">
            
          
            <button type="button" id="popupBtn">
              <img src="./assets/img/core-img/음악목록 2.png" alt="버튼 이미지">
            </button>

        <div id="modalWrap">
         <div id="modalBody">
           <span id="closeBtn">&times;</span>
            <h6>플레이리스트</h6>
            <ul id="musicList">
              <li class="musicItem">
                  <img src="./assets/img/album_img/POP/dangerously_찰리푸스.jpg" alt="음악1 이미지">
                  <h6>준우 favorite</h6>
              </li>
              <li class="musicItem">
                  <img src="./assets/img/album_img/POP/l'm not the only one_샘스미스.jpg" alt="음악2 이미지">
                  <h6>유성 favorite</h6>
              </li>
              <li class="musicItem">
                  <img src="./assets/img/album_img/POP/Unholy_샘스미스.jpg" alt="음악3 이미지">
                  <h6>우석 favorite</h6>
              </li>
              <li class="musicItem">
                <img src="./assets/img/album_img/R&B/square_백예린.jpg" alt="음악3 이미지">
                <h6>래정 favorite</h6>
            </li>
            <li class="musicItem">
              <img src="./assets/img/album_img/R&B/trip_릴러말즈.jpg" alt="음악3 이미지">
              <h6>준연 favorite</h6>
          </li>
              <!-- 필요한 만큼 더 추가 -->
          </ul>
          <button class = playlist_button>플레이리스트 생성하기</button>

          <div class="playlistModal">
              <div class="playlistModal-content">
                  <span class="playlistModal-close">&times;</span>
                  <h3>플레이리스트 생성</h3>
                  <input type="text" id="playlistName" placeholder="">
                  <button id="createPlaylist">생성</button>
              </div>
          </div>
          
          <div id="popupModal" class="popupModal">
              <div class="popupModal-content">
                  <span class="popupModal-close">×</span>
                  <p id="popupMessage"></p>
              </div>
          </div>
          <div id="myModal" class="modal">
              <div class="modal-content">
                <img class="close" src="./assets/img/core-img/check.png" alt="">
                  <p id="caption"></p>
              </div>
          </div>
          </div>
          
      </div>
            
         </header>
        
        <div class="music-container" id="musicContainer">
            <div class="music-info">
                
                <h4 id="title">노래 제목</h4>
                
                <div class="progress-container" id="progress-container">
                    
                    <div class="progress" id="progress"></div>
                </div>
            </div>
            <audio id="audio" src="./music/hey.mp3" onloadstart="this.volume=0.005"></audio>
                <div class="img-container">
                    <img src="img/index-img/뉴진스.jpg" alt="cover" id="cover"> <!--일단 임의로 넣어놨음-->
                </div>
                <div class="navigation">
                  <%--좋아요 --%>
                  <button  class="likeButton" style="border: none; background: none;"><i class="far fa-heart"></i></button>
                    <%--재생버튼 --%>
                    <button id="playButton" class="action-btn big"><i id="icon" class="fas fa-play"></i></button>
                    <%--다음곡 --%>
                    <button id="next" class="actiong-btn"><i class="fa-sharp fa-solid fa-forward"></i></button>
                    <input type="numbertext" placeholder="20/200">
                </div>
            </div>
           
            <div class="page_two__main__play_time">
                <span>2:13</span>
                <span>3:28</span>
          </div>
          <div class="page_two__main__time_bar">
              <div class="time_bar__time_stamp"></div>
              <i class="fas fa-circle"></i>
            </div>
            <div>
              <h6></h6>
            </div>
            <div class="page_two__main__controller">
            
        <div class="main__playList">
            
            <c:forEach var="song" items="${musicInfo}" varStatus="status">
            <div class="playList__song">
              <div class="song__album">
                <img src="${song.rmuAlbumImg}" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">${song.rmuSinger}</span>
                <span class="album_info__title">${song.rmuTitle}</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="삭제">
                </button>
              </div>
            </div>
			</c:forEach>


    </div>
    
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./assets/js/player.js"></script>
<script type="text/javascript">


var currentSongId = null;  // 현재 재생 중인 노래의 시퀀스 번호를 저장할 변수
var playlist = [];
var titles = [];
var singers = [];
var albums = [];
var songIds = []; // 좋아요취소버튼시 사용
var favMusic = [];
var currentTrack = 0; // 현재 재생 중인 트랙의 인덱스



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
const playButton = document.getElementById('play');

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
     document.getElementById('play').onclick = function() {
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
                   
                   playButton.className ='fa-solid fa-pause';
                   
                   updateTrackInfo();
                   
                } else {
                   if(state.paused){
                      playButton.className ='fa-solid fa-pause';
                   }else{
                      playButton.className ='fa-solid fa-play';
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

             if(playButton.className = 'fa-solid fa-play'){
                 playButton.className = 'fa-solid fa-pause';
             }
             updateTrackInfo();

             // setTimeout 함수를 사용하여 resume 함수 호출을 1초 지연
             setTimeout(() => {
                 player.resume();
             }, 1000);
         });
     };
     
  // 다음 트랙 버튼 클릭 이벤트 핸들러
     document.getElementById('next').onclick = function() {
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

         if(playButton.className = 'fa-solid fa-play'){
             playButton.className = 'fa-solid fa-pause';
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

















</script>

</body>
</html>