<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<form action="userUpdate" method="post">
		<table width="auto">

			<tr>
				<th height="50px" colspan="2" bgcolor="gray" align="center">이름과
					이메일은 수정할 수 없습니다.</th>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이메일 :</td>
				<td><input type="text" name="rmEmail" value=" ${user.rmEmail}"
					readonly="readonly"></td>
			
			<%-- 카카오톡유저일때 --%>
		<c:choose>
			<c:when test="${user.rmPhone eq '카카오회원'}">
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 :</td>
				<td><input type="password" name="rmPw" value="${user.rmPw}" readonly="readonly"></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 확인 :</td>
				<td><input type="password" value="${user.rmPw}" readonly="readonly"></td>
			</tr>
			</c:when>
			
			<%-- 카카오톡유저가 아닐때 --%>
			<c:otherwise>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 :</td>
				<td><input type="password" name="rmPw" value="${user.rmPw}" ></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 확인 :</td>
				<td><input type="password" value="${user.rmPw}" ></td>
			</tr>
			</c:otherwise>
		</c:choose>
			<!-- step1 끝 -->
			<tr>
				<th height="45" colspan="2" bgcolor="gray" width="400"
					align="center">개인정보</th>
			</tr>

			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이름 :</td>
				<td><input type="text" name="rmName" value="${user.rmName}"
					readonly="readonly"></td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">닉네임 :</td>
				<td><input type="text" name="rmNick" value="${user.rmNick}"></td>
			</tr>
			<%-- 카카오톡유저는 전화번호 안뜸 X --%>
			<c:choose>
				<c:when test="${user.rmPhone eq '카카오회원'}">
				</c:when>
				
				<%-- 일반유저는 전화번호 수정 가능 --%>
				<c:otherwise>
					<tr height="35" bgcolor="whitesmoke">
						<td align="right">전화번호 :</td>
						<td><input type="text" name="rmPhone" value="${user.rmPhone}"></td>
					</tr>	
				</c:otherwise>
			</c:choose>
			<!-- step2 끝 -->
			<tr>
				<th height="45" colspan="2" bgcolor="gray" width="400"
					align="center">좋아하는 장르(최대 선택 3개)</th>
			</tr>


			<tr height="35" bgcolor="whitesmoke">
				<td colspan="2" align="center">
				발라드<input type="checkbox" name="rmGenre" value="발라드" id="발라드"> 
				댄스<input type="checkbox" name="rmGenre" value="댄스" id="댄스">
				랩/힙합<input type="checkbox" name="rmGenre" value="랩/힙합" id="랩/힙합">
				R&B/Soul<input type="checkbox" name="rmGenre" value="R&B/Soul" id="R&B/Soul">
				인디음악<input type="checkbox" name="rmGenre" value="인디음악" id="인디음악">
				록/메탈<input type="checkbox"name="rmGenre" value="록/메탈" id="록/메탈">
				트로트<input type="checkbox" name="rmGenre" value="트로트" id="트로트">
				포크/블루스<input type="checkbox" name="rmGenre" value="포크/블루스" id="포크/블루스">
				</td>
			</tr>

			<!-- step3 끝 -->


			<tr height="35" bgcolor="whitesmoke">
				<td colspan="2" align="center">
					<input type="submit" value="정보 수정하기"> 
					<button type="button" onclick="location.href='gotoUserMypage'">뒤로가기</button>
				</td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">

// 저장된 장르 체크해주는 함수 -------------------------------------------------------------------------------
    window.onload = function() {
        var genres = '${user.rmGenre}'.split(','); // rmGenre의 값을 배열로
        for(var i=0; i<genres.length; i++) {
            var checkbox = document.getElementById(genres[i].trim()); // id로 체크박스 요소 가져오기
            if(checkbox) checkbox.checked = true; // 해당하는 체크박스를 체크함
        }
        

     // 폼 제출 이벤트 핸들러 추가
        document.querySelector('form').addEventListener('submit', function(e) {
            var password = document.querySelector('input[name="rmPw"]').value;
            var confirmPassword = document.querySelectorAll('input[type="password"]')[1].value; 
            // 비밀번호 확인은 두 번째 password 타입 input

            if (!password || !confirmPassword) {
       			 e.preventDefault();  // 폼 제출 막기
   			     alert('비밀번호를 입력하세요.');
   			 } else if (password !== confirmPassword) {
       			 e.preventDefault();  // 폼 제출 막기
  				 alert('비밀번호가 일치하지 않습니다');
  			 }
        });
        
        
        
        
    }
    
   
// 체크박스 3개이상 선택X   --------------------------------------------------------------------------------
	
	function check_count(obj){  // 장르 3개까지 선택할수 있게 만든 함수
		var chkBox = document.getElementsByName("rmGenre"); // name값 불러옴
		var chkCnt = 0; // 초기값 0 설정
		
		for(var i = 0 ; i < chkBox.length ; i++ ){
			if(chkBox[i].checked){  // 조건문으로 chkBox가 checked됐을 경우
				chkCnt++;           // 1씩 증가
			}	
		}
		if(chkCnt > 3){ // 조건문으로 chkCnt가 3보다 클경우
			alert("3개까지 체크할 수 있습니다.") // alert를 띄움
			obj.checked = false; // false를 줘서 alert를 띄운 뒤에 check되지 않도록 설정
			return false;
			
		}	
	}
	// 체크박스 변화 감지 및 함수 호출
	var checkboxes = document.getElementsByName('rmGenre');
	for(var i = 0; i<checkboxes.length; i++){
		checkboxes[i].addEventListener('change',function(){
			check_count(this);
		});
	}
// -------------------------------------------------------------------------------------    
    
    
    
</script>
</body>
</html>