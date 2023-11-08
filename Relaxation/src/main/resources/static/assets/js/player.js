    
const playBtn = document.getElementById("play");
const musicContainer = document.getElementById("musicContainer");
const audio = document.getElementById("audio");
const nextBtn = document.getElementById("next");
const progress = document.getElementById("progress");
const progressContainer = document.getElementById('progress-container');
const imgCover = document.getElementById("cover");
const title = document.getElementById("title");

const songs = ["hey", "summer", "뉴진스-하입보이"];

let songIndex = 2;

loadSong(songs[songIndex]);

function loadSong(song) {
  title.innerText = song;
  audio.src = `http://127.0.0.1:5500/music/${song}.mp3`;
  imgCover.src = "/img/index-img/뉴진스.jpg";
}

function playMusic() {
  musicContainer.classList.add("play");

  playBtn.innerHTML = `<i class="fa-solid fa-pause"></i>`;

  audio.play();
}

function pauseMusic(){
    musicContainer.classList.remove('play');
    playBtn.innerHTML = `<i class="fa-solid fa-play"></i>`;

    audio.pause();
}

function playPrevSong() {
    songIndex--;

    if (songIndex < 0) {
      songIndex = songs.length - 1;
    }
  
    loadSong(songs[songIndex]);
  
    playMusic();
}

function playNextSong (){
    songIndex++;

    if(songIndex > 2){
        songIndex = 0;
    }

    loadSong(songs[songIndex]);
    playMusic();
}

function updateProgress(e){
    const {duration, currentTime} = e.srcElement;

    const progressPer = (currentTime / duration) * 100;

    progress.style.width = `${progressPer}%`;
}

function changeProgress(e){

    const width = e.target.clientWidth; // 전체 넓이

    const offsetX = e.offsetX; // 현재 x 좌표;

    const duration = audio.duration; // 재생길이

    audio.currentTime = (offsetX / width) * duration; 

}

playBtn.addEventListener("click", () => {
    const isPlaying = musicContainer.classList.contains('play');

    if(isPlaying){
        pauseMusic();
    } else{
        playMusic();
    }
});

nextBtn.addEventListener('click', playNextSong);
audio.addEventListener('ended', playNextSong);
audio.addEventListener('timeupdate', updateProgress);

progressContainer.addEventListener('click', changeProgress);

    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        const imgName = urlParams.get('img');
        if (imgName) {
            const coverImage = document.getElementById('cover');
            coverImage.src = `img/index-img/${imgName}`;
        }
    }
    let likeButtons = document.getElementsByClassName('likeButton');

for(let i = 0; i < likeButtons.length; i++) {
    likeButtons[i].addEventListener('click', function() {
        let heartIcon = this.firstChild;
        
        if (heartIcon.classList.contains('far')) { // 빈 하트일 때
            heartIcon.classList.remove('far');
            heartIcon.classList.add('fas'); // 꽉 찬 하트로 변경
        } else { // 꽉 찬 하트일 때
            heartIcon.classList.remove('fas');
            heartIcon.classList.add('far'); // 빈 하트로 변경
        }
    });



   



const btn = document.getElementById('popupBtn');
const likeButtonss = document.getElementsByClassName('likeButtons');
const modal = document.getElementById('modalWrap');
const closeBtn = document.getElementById('closeBtn');

function openModal() {
    modal.style.display = 'block';
}

btn.onclick = openModal;
for (let button of likeButtonss) {
    button.onclick = openModal;
}

closeBtn.onclick = function() {
  modal.style.display = 'none';
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
}

var span = document.getElementsByClassName('close')[0];
span.onclick = closeModal

function closeModal() { // 추가된 부분
    modal.style.display = "none";
}

const playButtons = document.querySelectorAll('.playButton2');

playButtons.forEach(function(button) {
    button.addEventListener('click', function() {
        const icon = this.querySelector('.fas');
        icon.classList.toggle('fa-play');
        icon.classList.toggle('fa-pause');
    });
});

    document.querySelector('.page_one__header img').addEventListener('click', function() {
        window.close();
    });


    var playlistModal = document.querySelector(".playlistModal");
    var playlistBtn = document.querySelector(".playlist_button");
    var playlistSpan = document.querySelector(".playlistModal-close");
    var createPlaylistBtn = document.getElementById('createPlaylist');
    
    var popupModal = document.getElementById('popupModal');
    var popupMessage = document.getElementById('popupMessage');
    var popupModalCloseBtn = document.querySelector(".popupModal-close");
    
    playlistBtn.onclick = function() {
        playlistModal.style.display = "block";
    }
    
    playlistSpan.onclick = function() {
        playlistModal.style.display = "none";
    }
    
    createPlaylistBtn.onclick = function() {
        var playlistName = document.getElementById('playlistName').value;
    
        if (!playlistName) {
            alert('플레이리스트 이름을 입력해주세요.');
            return;
        }
    
        playlistModal.style.display = "none";
        popupMessage.innerHTML = '플레이리스트가 생성되었습니다.';
        popupMessage.style.color = 'white';
        popupModal.style.display = "block";
    }
    
    popupModalCloseBtn.onclick = function() {
        popupModal.style.display = "none";
    }
    
    window.onclick = function(event) {
        if (event.target == playlistModal) {
            playlistModal.style.display = "none";
        }
        if (event.target == popupModal) {
            popupModal.style.display = "none";
        }
    }
    var musicModal = document.getElementById('myModal');
    var captionText = document.getElementById('caption');
    
    var musicItems = document.getElementsByClassName('musicItem');
    for (var i = 0; i < musicItems.length; i++) {
        var img = musicItems[i].getElementsByTagName('img')[0];
        img.addEventListener('click', function(){
            musicModal.style.display = "block";
            captionText.innerHTML = "~~~~이(가) 추가되었습니다.";
    
            setTimeout(closeModal, 1500); 
        });
    }
    
    function closeModal() {
        musicModal.style.display = "none";
    }
