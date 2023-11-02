<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#ex9 .upload-box {
	width: 400px;
	height: 400px;
	border: 1px solid gray;
	box-shadow: 2px 3px 9px hsl(0, 0%, 47%);
	padding: 10px;
	position: relative; 
	overflow: hidden;  
}

#ex9 .upload-box #preview img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain; /* 추가 */
	position: absolute; /* 추가 */
	top: 50%; /* 추가 */
	left: 50%; /* 추가 */
	transform: translate(-50%, -50%); /* 추가 */
}

</style>
</head>
<body>

	<form action="imgUpload" enctype="multipart/form-data" method="post">
		<section id="ex9">
			<h1>Music : 나의 감정을 분석하여 음악을 추천받아보자!!!</h1>

			<h6>파일선택버튼이나 드래그하여 사진을 불러오세요. 사진은 1장씩만 드래그 해주세요 ^_^</h6>
			<input type="file" name="rfImg">
			<div class="upload-box">
				<div id='preview'></div>
			</div>
			<br> <input type="submit" value="사진 분석하기">
		</section>
	</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
    // 세션 값이 null인 경우 메인 페이지로 리다이렉션
<% if (session.getAttribute("user") == null) { %>
    
		alert("세션이 만료되어 로그인이 필요합니다."); // alert 메시지
        window.location.href = "/relax/setsession"; // 페이지 이동
        </script><script>
<% } %>
	
	
	
		var sec9 = document.querySelector('#ex9');
		var inputFile = sec9.querySelector('input[type="file"]');
		var uploadBox = sec9.querySelector('.upload-box');
		
		
		/* 박스 안에 Drag 들어왔을 때 */
		uploadBox.addEventListener('dragenter', function(e) {
			console.log('dragenter');
		});

		/* 박스 안에 Drag를 하고 있을 때 */
		uploadBox.addEventListener('dragover', function(e) {
			e.preventDefault();
			console.log('dragover');

			this.style.backgroundColor = 'skyblue';
		});

		/* 박스 밖으로 Drag가 나갈 때 */
		uploadBox.addEventListener('dragleave', function(e) {
			console.log('dragleave');

			this.style.backgroundColor = 'white';
		});

		/* 박스 안에서 Drag를 Drop했을 때 */
		uploadBox.addEventListener('drop', function(e) {
			e.preventDefault();
			this.style.backgroundColor = 'white';

			var files = e.dataTransfer.files;

			if (files.length > 0) {
				var file = files[0];
				var reader = new FileReader();

				reader.onloadend = function() {
					var previewDiv = document.getElementById('preview');

					while (previewDiv.firstChild) {
						previewDiv.removeChild(previewDiv.firstChild);
					}

					var imgTag = document.createElement('img');
					imgTag.src = reader.result;

					previewDiv.appendChild(imgTag);
					
					inputFile.files = files;
					
				};

				reader.readAsDataURL(file);
			}
		});

		 uploadBox.addEventListener('dragover', function(e) {
			    e.preventDefault();

			    var valid = e.dataTransfer.types.indexOf('Files') >= 0;

			    if (!valid) {
			      this.style.backgroundColor = 'red';
			    } else {
			      this.style.backgroundColor = 'skyblue';
			    }
			  });
		
		
		 // input 요소가 변경되면 이미지 미리보기 업데이트
		  inputFile.addEventListener('change', function(e) {
		    var file = e.target.files[0];
		    var reader = new FileReader();

		    reader.onloadend = function() {
		      var previewDiv = document.getElementById('preview');

		      while (previewDiv.firstChild) {
		        previewDiv.removeChild(previewDiv.firstChild);
		      }

		      var imgTag = document.createElement('img');
		      imgTag.src = reader.result;

		      previewDiv.appendChild(imgTag);
		    };

		    reader.readAsDataURL(file);
		  });
		
		
		  $(document).ready(function(){
		        $("form").on("submit", function(event){
		            event.preventDefault();

		            var formData = new FormData(this);

		            $.ajax({
		            	 url: $(this).attr('action'),
		                type: 'POST',
		                data: formData,
		                processData: false,  
		                contentType: false,
		                success: function(result){

		                    console.log(result);

		                    // 여기서 result는 서버에서 보내온 응답입니다.
		                    // 필요한 작업을 여기에 추가하세요.
		                },
		                error: function(xhr, status, error){
		                    console.log("===========오류============")
		                    console.error(xhr.responseText);
		                    console.log("==========================")
		                }
		            });
		        });
		    });
		 

		 
	</script>


</body>
</html>