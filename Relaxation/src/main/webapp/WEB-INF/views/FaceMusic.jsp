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
}
</style>
</head>
<body>

	<form action="imgUplode" enctype="multipart/form-data" method="post">
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


	<script type="text/javascript">
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
		
		
	</script>



</body>
</html>