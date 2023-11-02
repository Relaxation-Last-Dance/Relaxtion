<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2>${user.rmNick}님반갑습니다</h2>
	<a href="goUserMainFromMP">메인으로</a>
	<br>

	<a href="#">MY PLAYLIST</a>
	<br>
	<a href="goUserChangeInfo">내 정보 수정</a>
	<br>
	<%-- 카카오톡유저일때 --%>
	<c:choose>
		<c:when test="${user.rmPhone eq '카카오회원'}">
		<a href="dropKakaoUser">카카오 회원 탈퇴</a>
		<br>
		</c:when>
		<c:otherwise>
		<a href="goUserDropInfo">회원 탈퇴</a>
		</c:otherwise>
	</c:choose>

	<script type="text/javascript">
    // 세션 값이 null인 경우 메인 페이지로 리다이렉션
	<% if (session.getAttribute("user") == null) { %>
	    
			alert("세션이 만료되어 로그인이 필요합니다."); // alert 메시지
	        window.location.href = "/relax/setUserMypageSession"; // 페이지 이동
	        </script><script>
	<% } %>
	</script>
</body>
</html>