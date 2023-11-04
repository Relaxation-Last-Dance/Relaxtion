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
    <title>음악 플레이어</title>
</head>

<body>
    <div class="play-container">
        <header class="page_one__header">
            <img src="/img/bg-img/닫기.png" alt="Your image">
            
          
            <button type="button" id="popupBtn">
              <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
            </button>

        <div id="modalWrap">
         <div id="modalBody">
           <span id="closeBtn">&times;</span>
            <h6>플레이리스트에 음악 추가</h6>
            <ul id="musicList">
              <li class="musicItem">
                  <img src="/img/album_img/POP/dangerously_찰리푸스.jpg" alt="음악1 이미지">
                  <h6>준우 favorite</h6>
              </li>
              <li class="musicItem">
                  <img src="img/album_img/POP/l'm not the only one_샘스미스.jpg" alt="음악2 이미지">
                  <h6>유성 favorite</h6>
              </li>
              <li class="musicItem">
                  <img src="img/album_img/POP/Unholy_샘스미스.jpg" alt="음악3 이미지">
                  <h6>우석 favorite</h6>
              </li>
              <li class="musicItem">
                <img src="img/album_img/R&B/square_백예린.jpg" alt="음악3 이미지">
                <h6>래정 favorite</h6>
            </li>
            <li class="musicItem">
              <img src="img/album_img/R&B/trip_릴러말즈.jpg" alt="음악3 이미지">
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
                <img class="close" src="/img/core-img/check.png" alt="">
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
                  <button  class="likeButton" style="border: none; background: none;"><i class="far fa-heart"></i></button>
                    <button id="play" class="actiong-btn big"><i class="fa-solid fa-play"></i></button>
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
              <h6>내 재생목록</h6>
            </div>
            <div class="page_two__main__controller">
            
            <div class="main__playList">
                <div class="playList__song">
              <div class="song__album">
                <img src="https://i1.sndcdn.com/artworks-000442244943-odzok4-t500x500.jpg" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">별 보러 가자</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>
            <div class="playList__song">
              <div class="song__album">
                <img src="https://blog.kakaocdn.net/dn/dBn2us/btqzVDEIKoE/rsKLWbH52wmoBN5qZe0FdK/img.jpg" />
                <div class="song__play_icon_container">
                  
                </div>
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">Lullaby</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>
           
            
            <div class="playList__song">
              <div class="song__album">
                <img src="https://i1.sndcdn.com/artworks-000442244943-odzok4-t500x500.jpg" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">별 보러 가자</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>
            <div class="playList__song">
              <div class="song__album">
                <img src="https://i1.sndcdn.com/artworks-000442244943-odzok4-t500x500.jpg" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">별 보러 가자</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>

            
            <div class="playList__song">
              <div class="song__album">
                <img src="https://blog.kakaocdn.net/dn/dBn2us/btqzVDEIKoE/rsKLWbH52wmoBN5qZe0FdK/img.jpg" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">Letter(잘 지내)</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>
            <div class="playList__song">
              <div class="song__album">
                <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/18/003/10318003_500.jpg?f6d288357c9aeb3a6692b5e2f1a9c216/melon/resize/282/quality/80/optimize" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">TATTOO</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>
            <div class="playList__song">
              <div class="song__album">
                <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/18/003/10318003_500.jpg?f6d288357c9aeb3a6692b5e2f1a9c216/melon/resize/282/quality/80/optimize" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">TATTOO</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>
            <div class="playList__song">
              <div class="song__album">
                <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/18/003/10318003_500.jpg?f6d288357c9aeb3a6692b5e2f1a9c216/melon/resize/282/quality/80/optimize" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">TATTOO</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>
            <div class="playList__song">
              <div class="song__album">
                <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/18/003/10318003_500.jpg?f6d288357c9aeb3a6692b5e2f1a9c216/melon/resize/282/quality/80/optimize" />
              </div>
              <div class="song__album_info">
                <span class="album_info__singer">적재</span>
                <span class="album_info__title">TATTOO</span>
              </div>
              <div class="song__ellipsis_container">
                <button class="playButton2" style="border: none; background: none;">
                  <i class="fas fa-play"></i>
              </button>
                <button class="likeButtons" style="border: none; background: none;">
                  <img src="/img/core-img/음악목록 2.png" alt="버튼 이미지">
                </button>
              </div>
            </div>

            <div class="playList__song">
              <div class="song__album">
                <img src="https://cdnimg.melon.co.kr/cm2/album/images/103/18/003/10318003_500.jpg?f6d288357c9aeb3a6692b5e2f1a9c216/melon/resize/282/quality/80/optimize" />
              </div>
              


            
          </div>

    </div>

    <script src="./assets/js/player.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</script>



</body>

</html>