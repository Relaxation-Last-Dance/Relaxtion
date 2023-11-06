document.body.style.overflow = 'hidden';

var modal = document.getElementById("myModal2");
var span = document.getElementById("closeModal2");




window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}



function showImage(imageSrcArray) {
    var existingContent = document.getElementById('content');
    
    if (existingContent) {
        existingContent.style.display = 'none';
    }

    var existingModal = document.getElementById('modal');
    
    if (existingModal) {
        document.body.removeChild(existingModal);
    }

    var imageHtml = '';
    for (var i = 0; i < imageSrcArray.length; i++) {
        imageHtml += '<img src="' + imageSrcArray[i] + '" alt="이미지">';
    }
    document.querySelector('.imgContainer').innerHTML = imageHtml;
}

function showContent() {
    var content = document.getElementById('content');
    content.style.display = 'block'; // Display the content

    // 이미지를 숨김
    document.querySelector('.imgContainer').innerHTML = '';
}




function showModal(modalContent) {
    // 기존에 떠있던 모달 창이 있다면 제거
    var existingModal = document.getElementById('modal');
    
    if (existingModal) {
        document.body.removeChild(existingModal);
    }
    
    // 새로운 모달 창 생성
    var modal = document.createElement('div');
    modal.id = 'modal';  // 모달 창에 고유한 id 부여

    // 텍스트와 닫기 버튼을 담을 컨테이너 생성
    var textContainer = document.createElement('div');
    textContainer.style.display = 'flex';
    textContainer.style.justifyContent = 'space-between';
    textContainer.style.alignItems = 'center';

    // 텍스트를 담는 p 태그 생성
    var p = document.createElement('p');
    p.innerHTML = modalContent;
    p.style.color = 'white';  // 텍스트 색상을 흰색으로 설정
    p.style.fontSize = '20px';  // 텍스트 크기를 20px로 설정
    p.style.textAlign = 'center';  // 텍스트를 가운데 정렬
    p.style.flexGrow = '1';  // 텍스트가 가능한 한 많은 공간을 차지하도록 설정

    // 닫기 버튼 생성
    var closeButton = document.createElement('button');
    closeButton.innerHTML = 'X';
    closeButton.style.width = '30px'
    closeButton.style.backgroundColor = 'white';
    closeButton.style.color = 'black';
    
    closeButton.onclick = function() {
        // 닫기 버튼을 누르면 모달 창을 닫음
        document.body.removeChild(modal);
    };

    // 텍스트와 닫기 버튼을 컨테이너에 추가
    textContainer.appendChild(p);
    textContainer.appendChild(closeButton);

    // 비밀번호 확인 텍스트 생성
    var passwordLabel = document.createElement('p');
    passwordLabel.innerHTML = '비밀번호 입력';
    passwordLabel.style.color = 'white';
    passwordLabel.style.fontSize = '16px';
	
    

    // 비밀번호 입력 필드 생성
var passwordInputContainer = document.createElement('div');
passwordInputContainer.style.position = 'relative';  // 위치 지정 방식을 상대적으로 설정
passwordInputContainer.style.top = '-20px';  // 상자를 위로 20px 올림
// 폼 생성
var form = document.createElement('form');
form.action = 'dropUserInfo';
form.id = 'DropForm';
form.method = 'post';
document.body.appendChild(form);
// 사용자 비밀번호 필드 생성
var userPasswordInput = document.getElementById('userPw');
form.appendChild(userPasswordInput);
// 비밀번호 입력 필드 생성
var passwordInput = document.createElement('input');
passwordInput.id = 'Pw';  // Add id attribute
passwordInput.type = 'password';
passwordInput.style.width = '50%';
passwordInput.name = 'rmPw';
passwordInput.placeholder = '비밀번호를 입력하세요';
passwordInputContainer.appendChild(passwordInput);
form.appendChild(passwordInputContainer);

var confirmPasswordLabel = document.createElement('p');
confirmPasswordLabel.innerHTML = '비밀번호 확인';
confirmPasswordLabel.style.color = 'white';
confirmPasswordLabel.style.fontSize = '16px';

// 비밀번호 확인 입력 필드 생성
var confirmPasswordInputContainer = document.createElement('div');
confirmPasswordInputContainer.style.position = 'relative';  // 위치 지정 방식을 상대적으로 설정
confirmPasswordInputContainer.style.top = '-20px';  // 상자를 위로 20px 올림
// 비밀번호 확인 입력 필드 생성
var confirmPasswordInput = document.createElement('input');
confirmPasswordInput.id = 'confirmPw';  // Add id attribute
confirmPasswordInput.type = 'password';
confirmPasswordInput.style.width = '50%';
confirmPasswordInput.name = 'rmPwConfirm';
confirmPasswordInput.placeholder = '비밀번호를 다시 입력하세요';
confirmPasswordInputContainer.appendChild(confirmPasswordInput);
form.appendChild(confirmPasswordInputContainer);

// 확인 버튼 생성
var confirmButtonContainer = document.createElement('div');
var confirmButton = document.createElement('button');
confirmButton.type = 'submit';
confirmButton.innerHTML = '탈퇴하기';
confirmButton.style.width = '20%';
confirmButton.style.position = 'relative';
confirmButton.style.top = '-20px';
confirmButtonContainer.appendChild(confirmButton);
form.appendChild(confirmButtonContainer);

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


form.appendChild(textContainer);
form.appendChild(passwordLabel);
form.appendChild(passwordInputContainer);
form.appendChild(confirmPasswordLabel);
form.appendChild(confirmPasswordInputContainer);
form.appendChild(confirmButtonContainer);
modal.appendChild(form);

    // 컨테이너, 비밀번호 확인 텍스트, 비밀번호 입력 필드, 확인 버튼을 모달 창에 추가


    // 나머지 모달 창 설정
    modal.style.display = 'block';  // 모달 창을 보이게 설정
    modal.style.position = 'fixed';  // 화면 중앙에 고정
    modal.style.zIndex = '9999';  // 다른 요소 위에 표시
    modal.style.left = '50%';
    modal.style.top = '50%';
    modal.style.transform = 'translate(-50%, -50%)';
    modal.style.border = '1px solid #888';
    modal.style.width = '30%';  // 원하는 너비로 설정
    modal.style.height = '30%';  // 원하는 높이로 설정
    modal.style.backgroundColor = '#000';  // 모달 창 배경색을 검정색으로 설정
    modal.style.textAlign = "center";
    modal.style.padding = '20px';  // 패딩 추가

    // 모달 창을 body에 추가
    document.body.appendChild(modal); 
}


function openPopup() {
    document.getElementById('popup').style.display = 'block';
}

function closePopup() {
    document.getElementById('popup').style.display = 'none';
}