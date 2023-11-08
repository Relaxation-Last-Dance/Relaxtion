<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.album-table {
	display: flex;
	flex-wrap: wrap;
	width: 100%; /* 너비를 100%로 고정 */
	max-width: 1200px; /* 원하시는 최대 크기를 설정. 필요에 따라 조절하시면 됩니다. */
	margin: 0 auto; /* 좌우 중앙 정렬 */
}

.album-table tr {
	display: flex;
	width: 100%;
}

.album-table td {
	width: calc(100%/ 6); /* 6개의 셀이 한 줄을 차지하도록 설정 */
	box-sizing: border-box;
	text-align: center;
	vertical-align: top;
	padding: 10px;
}

.album-table .image-container {
	width: 100%;
	height: 0;
	padding-bottom: 100%;
	/* top padding을 width의 100%로 설정하여 1:1 비율의 공간을 만듭니다. */
	position: relative; /* 이미지가 이 div 내에서 절대 위치 설정을 사용하도록 합니다. */
}

.album-table img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
}

.album-table .artist, .album-table .title {
	margin-top: 10px;
}

.button-container {
	/* 기존 스타일 생략... */
	display: flex; /* Flexbox를 이용해 요소를 가로로 배치합니다. */
	justify-content: center; /* 요소들을 가운데 정렬합니다. */
	padding: 10px 0; /* 위아래로 10px의 패딩을 추가합니다. */
}

.button-container>* {
	margin-right: 20px; /* 모든 직접적인 자식 요소들 사이에 오른쪽 마진을 추가합니다. */
}

.button-container>:last-child {
	margin-right: 0; /* 마지막 요소의 오른쪽 마진은 0으로 설정합니다. */
}

.album-table .title {
	font-weight: 600; /* 글씨를 좀 더 진하게 만듭니다. */
	color: #333; /* 글씨 색을 어두운 회색으로 설정합니다. */
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* 글씨에 약간의 그림자를 추가합니다. */
	margin-top: 10px;
}

.album-table .artist {
	font-weight: 500; /* 글씨를 약간 진하게 만듭니다. */
	color: #555; /* 글씨 색을 회색으로 설정합니다. */
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* 글씨에 약간의 그림자를 추가합니다. */
}
</style>


</head>
<body>
	<div>
		<h1>${user.rmNick}님의RELAXATION</h1>
	</div>
	<div class="button-container">
		<button>뒤로가기</button>
		<button>플레이리스트</button>

		<!-- 검색 기능을 위한 입력 필드와 버튼 -->
		<input type="text" id="search-input" placeholder="검색어를 입력하세요">
		<button id="search-button">검색</button>
	</div>

	</div>

	<table class="album-table">
		<tr>
			<c:forEach var="music" items="${findRandom48}" varStatus="status">
				<td>
					<div class="image-container">
					<a href="musicAlbumsInfo?rmuSeq=${music.rmuSeq}">
						<img src="${music.rmuAlbumImg}"
							alt="Album Image ${status.index + 1}">
					</a>
					</div>
					<div class="title">${music.rmuTitle}</div>
					<div class="artist">${music.rmuSinger}</div>
				</td>
				<!-- 행이 6개의 셀을 가질 때마다 새로운 행을 시작 -->
				<c:if test="${(status.index + 1) % 6 == 0}">
		</tr>
		<tr>
			</c:if>
			</c:forEach>
		</tr>
	</table>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
// 세션 값이 null인 경우 메인 페이지로 리다이렉션
<% if (session.getAttribute("user") == null) { %>
    
		alert("세션이 만료되어 로그인이 필요합니다."); // alert 메시지
        window.location.href = "/relax/#"; // 페이지 이동
        </script>
	<script type="text/javascript">
<% } %>


        let totalElements = 0;
        let totalPages = 0;
		let page = 0;
		let size = 48;
		let searchQuery = '';

		
		// 스크롤 이벤트 핸들러를 함수로 정의합니다.
		function onScroll() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		        loadMore();
		    }
		}
		
		
		
		
		
function loadMore() {
    $.ajax({
        url: '#',
        type: 'GET',
        data: {
            'Text': searchQuery,
            'page': page,
            'size': size
        },
        dataType: 'json',

        success: function(res) {
            console.log('검색 성공');

            let table = $('.album-table');
            let results = res.content; // 응답 데이터에서 검색 결과를 가져옵니다.

            totalElements = res.totalElements;
            totalPages = res.totalPages;

            if (results.length === 0 && page === 0) {
                table.html('<tr><td>검색 결과가 없습니다.</td></tr>');
                return; // 더 이상의 코드 실행을 막습니다.
            } else if (results.length === 0 && page > 0) {
                if (page >= totalPages) {
                	 // 스크롤 이벤트 핸들러를 제거합니다.
                    $(window).off('scroll', onScroll);
                    return;
                }
            }

            for (let i = 0; i < results.length; i++) {
                if (i % 6 == 0) {
                    table.append('<tr>');
                }

                let td = "<td>";
                td += "<div class='image-container'>";
                td += "<a href='musicAlbumsInfo?rmuSeq=" + results[i].rmuSeq + "'>";
                td += "<img src='" + results[i].rmuAlbumImg + "' alt='Album Image " + (i + 1) + "'>";
                td += "</a>";
                td += "</div>";
                td += "<div class='title'>" + results[i].rmuTitle + "</div>";
                td += "<div class='artist'>" + results[i].rmuSinger + "</div>";
                td += "</td>";

                table.find('tr:last').append(td);

                if ((i + 1) % 6 == 0) {
                    table.append('</tr>');
                }
            }

            if (results.length % 6 != 0) {
                table.append('</tr>');
            }
            
            page++;
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log('요청 실패');
            console.log('HTTP status code:', jqXHR.status);
            console.log('Response text:', jqXHR.responseText);
        }
    });
}

//검색 버튼 클릭
document.getElementById('search-button').addEventListener('click', function() {
    searchQuery = document.getElementById('search-input').value;
    
    let table = $('.album-table');
    table.html('');
    
    page = 0;

    // 스크롤 이벤트 핸들러를 다시 등록합니다.
    $(window).scroll(onScroll);
    
    loadMore();
});

// 스크롤 이벤트 감지
$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        loadMore();
    }
});
    
</script>
</body>
</html>