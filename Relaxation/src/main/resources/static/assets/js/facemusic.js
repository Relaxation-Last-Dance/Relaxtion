 
 
 
 function DropFile(dropAreaId, fileListId) {
    let dropArea = document.getElementById(dropAreaId);
    let fileList = document.getElementById(fileListId);
  
    function preventDefaults(e) {
      e.preventDefault();
      e.stopPropagation();
    }
  
    function highlight(e) {
      preventDefaults(e);
      dropArea.classList.add("highlight");
    }
  
    function unhighlight(e) {
      preventDefaults(e);
      dropArea.classList.remove("highlight");
    }
  
    function handleDrop(e) {
      unhighlight(e);
      let dt = e.dataTransfer;
      let files = dt.files;
  
      handleFiles(files);
  
      const fileList = document.getElementById(fileListId);
      if (fileList) {
        fileList.scrollTo({ top: fileList.scrollHeight });
      }
    }
  
    function handleFiles(files) {
      files = [...files];
      // files.forEach(uploadFile);
      files.forEach(previewFile);
    }
  
    function previewFile(file) {
      console.log(file);
      renderFile(file);
    }
  
    function renderFile(file) {
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onloadend = function () {
        let img = dropArea.getElementsByClassName("preview")[0];
        img.src = reader.result;
        img.style.display = "block";
      };
    }
  
    dropArea.addEventListener("dragenter", highlight, false);
    dropArea.addEventListener("dragover", highlight, false);
    dropArea.addEventListener("dragleave", unhighlight, false);
    dropArea.addEventListener("drop", handleDrop, false);
  
    return {
      handleFiles
    };
  }
  const dropFile = new DropFile("drop-file", "files");

  const dropArea = document.getElementById("drop-file");

function highlight(e) {
preventDefaults(e);
dropArea.classList.add("highlight");
}

function unhighlight(e) {
preventDefaults(e);
dropArea.classList.remove("highlight");
}

dropArea.addEventListener("dragenter", highlight, false);
dropArea.addEventListener("dragover", highlight, false);
dropArea.addEventListener("dragleave", unhighlight, false);
function handleDrop(e) {
unhighlight(e);
let dt = e.dataTransfer;
let files = dt.files;

console.log(files);

// addToFileList
// ...
}
function renderFile(file) {
let reader = new FileReader();
reader.readAsDataURL(file);
reader.onloadend = function () {
let img = dropArea.getElementsByClassName("preview")[0];
img.src = reader.result;
img.style.display = "block";
};
}


var modal = document.getElementById("myModal1");
var btn = document.getElementById("openModal1");
var span = document.getElementById("closeModal1");
var loading = document.getElementById("loading");

btn.onclick = function() {
  // 파일 선택 확인
  if(document.getElementById('chooseFile1').files.length == 0) {
    alert('파일을 선택하세요.');
  } else {
    // 로딩 화면 표시
    loading.style.display = "block";

    // 5초 후에 로딩 화면을 숨기고 모달 창을 표시
    setTimeout(function() {
      loading.style.display = "none";
      modal.style.display = "block";
    }, 5000);  // 5000 밀리초 = 5초
  }
}

span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}



var modal1 = document.getElementById('myModal');
var btn = document.getElementById('openModalBtn');
var span = document.getElementsByClassName('close1')[0];

// 버튼 클릭 시 모달 열기
btn.onclick = function() {
    modal1.style.display = "block";
}

// × 클릭 시 모달 닫기
span.onclick = function() {
    modal1.style.display = "none";
}

// 모달 외부 클릭 시 모달 닫기
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}


