<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 이메일, 비밀번호, 닉네임, 이름, 성별, 전화번호, 선호 아티스트, 선호 장르 -->

	<form action="userJoin" method="post" onsubmit="return validateForm()">
		<table width="auto">

			<tr>
				<th height="50px" colspan="2" bgcolor="gray" align="center">step1
					: 이메일/ 비밀번호 입력</th>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이메일 :</td>
				<td>
					<input type="text" name="rmEmail" placeholder="로그인 시 필요">
					@
					<select name="rmEmail" onchange="handleLastEmailChange(this)">
                        <option value="@naver.com">naver.com</option>
                        <option value="@gmail.com">gmail.com</option>
                        <option value="@nate.com">nate.com</option>
                        <option value="@hanmail.net">hanmail.net</option>
                        <option value="" >직접입력</option>
                    </select>
					<input type="text" name="rmEmail" id="customInput" style="display: none;" placeholder="입력해주세요">
                </td>
				
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 :</td>
				<td><input type="password"  name="rmPw">ajax로 id,닉네임 중복, 비밀번호입력값 확인</td>
			</tr>
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">비밀번호 확인 :</td>
				<td><input type="password"></td>
			</tr>
			<!-- step1 끝 -->
			<tr>
				<th height="45" colspan="2" bgcolor="gray" width="400" align="center">step2
					: 개인정보</th>
			</tr>
			
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">닉네임 :</td>
				<td><input type="text"  name="rmNick"></td>
			</tr>
			
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">이름 :</td>
				<td><input type="text"  name="rmName"></td>
			</tr>
			
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">성별 :</td>
				<td>남<input type="radio" name="rmGender" value="male"> 
					여<input type="radio" name="rmGender" value="female">
				</td>
			</tr>

			<tr height="35" bgcolor="whitesmoke">
				<td align="right">전화번호 :</td>
				<td><input type="text" name="rmPhone"></td>
			</tr>
			<!-- step2 끝 -->

			<tr>
				<th height="45" colspan="2" bgcolor="gray" width="400" align="center">step3
					: 선호도(최대 선택 3개)</th>
			</tr>
			
			
			
			<tr height="35" bgcolor="whitesmoke">
				<td align="right">좋아하는 장르 :</td>
				<td>
					발라드<input type="checkbox" name="rmGenre" value="발라드"> 
					댄스<input type="checkbox" name="rmGenre" value="댄스">
					랩/힙합<input type="checkbox" name="rmGenre" value="랩/힙합">
					R&B/Soul<input type="checkbox" name="rmGenre" value="R&B/Soul">
					인디음악<input type="checkbox" name="rmGenre" value="인디음악">
					록/메탈<input type="checkbox" name="rmGenre" value="록/메탈">
					트로트<input type="checkbox" name="rmGenre" value="트로트">
					포크/블루스<input type="checkbox" name="rmGenre" value="포크/블루스">
				</td>
			</tr>
			
			<!-- step3 끝 -->
			

			<tr height="35" bgcolor="whitesmoke">
				<td colspan="2" align="center">
				<input type="submit" value="회원가입"> 
				</td>
			</tr>
		</table>

	</form>

	<script type="text/javascript">
		
	
	<%--4개이상 선택 X 코드---------------------------------------------------------------------------------%>
	
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
	
	
	function handleLastEmailChange(selectElement) {
	    var customDomainInput = document.getElementById('customInput');
	    if (selectElement.value === '') {
	        customDomainInput.style.display = 'inline';  // Show the text input for custom domain
	    } else {
	        customDomainInput.style.display = 'none';  // Hide the text input for custom domain

	    }
	}
	
	 function validateForm() {
	      // 필수 필드 중 하나라도 값이 누락된 경우
	      if (
	        !document.getElementsByName("rmEmail")[0].value ||
	        !document.getElementsByName("rmPw")[0].value ||
	        !document.getElementsByName("rmNick")[0].value ||
	        !document.getElementsByName("rmName")[0].value ||
	        !document.querySelector('input[name="rmGender"]:checked') ||
	        !document.getElementsByName("rmPhone")[0].value
	      ) {
	        alert("회원정보를 입력해주세요");
	        return false; // 폼 제출을 중지
	      }
	      return true;
	    }

	</script>





</body>
</html>