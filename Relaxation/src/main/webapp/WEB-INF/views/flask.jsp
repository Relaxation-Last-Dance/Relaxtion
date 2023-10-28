<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 웹 페이지에서 버튼 누르면 python코드 실행 -->

	<form action="http://172.30.1.23:5000/form">
		Data2 : <input name="data2" type="text"> Data1 : <input
			name="data1" type="text">

		<button>전송</button>

	</form>

	<button id="ajaxBtn">aJaX</button>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">


				$(document).ready( ( ) => {
	
	
					$('#ajaxBtn').on("click", flask)
				
	
				});		

function flask(){
	
	$.ajax({
	
		url : "http://172.30.1.23:5000/ajax",
		type : "get",
		success : function(res){
			
			console.log(res)
			
		},
		error : function(){
			
			console.log("error!!!!")
		}
	});
}

</script>







</body>
</html>