<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="./main_logo.gif" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
<title>우리동네 올림픽</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<link rel="stylesheet" href="${path}/resources/css/notistyle.css">
<link rel="stylesheet" href="${path}/resources/css/free_list.css">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<style>
.side-bar {
	position: relative;
	top: -177px;
}

section {
	min-height: 0px;
	height: 810px;
}

.banana {
	height: 100%;
	margin: 0 auto;
	padding-top: 50px;
	padding-left: 50px;
	padding-right: 50px;
}

.banana form {
	margin: 0 auto;
}

.banana .profile {
	display: flex;
	margin-bottom: 50px;
}

.banana .profile .profile_intro {
	margin-left: 10px;
}

.banana .profile span {
	display: block;
	line-height: 27px;
}

.banana #contents .boardnum {
	width: 50px;
}

.banana #contents .title {
	width: 570px;
}

.banana #contents .writer_id {
	width: 100px;
}

.banana #contents .date {
	width: 100px;
}

.banana #contents .view {
	width: 70px;
}

.banana #contents .etc {
	width: 150px;
}

.banana #contents .ul_news {
	height: 20px;
}

.banana #contents .ul_news .etc {
	display: flex;
	justify-content: end;
	margin-bottom: 10px;
}

#write_notice .modify_btn {
	background-color: #eee;
	border-color: #ddd;
	color: black;
	cursor: pointer;
}

#write_notice .delete_btn {
	background-color: #333333;
	color: #eee;
	cursor: pointer;
}

.modify_div, .delete_div {
	display: inline-block;
	text-align: center;
}

.deleteandwrite_btn {
	display: flex;
	justify-content: end;
}

.deleteandwrite_btn form {
	margin: 0;
}

.free_write {
	width: 66px;
}

.free_delete {
	width: 83px;
}

ul {
	list-style: none;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #F8F9FA;
	color: #222;
}

.tab-content {
	display: none;
	background: #F8F9FA;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}

.side-bar div ul li a.current {
	pointer-events: none;
	cursor: default;
	color: red;
	font-weight: bold;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<c:if test="${loginUser == null }">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace('${cp}/user/login');
		</script>
	</c:if>
	<section>
		<!-- 사이드바 시작 -->
		<%@ include file="../include/profile_sidebar.jsp"%>
		<!-- 사이드바 끝 -->

		<!-- 개발코드 시작 -->
		<div class="banana">
			<div class="profile">
				<div class="profile_pic">
					<img src="${path}/resources/img/profile_pic.png" alt="프로필">
				</div>
				<div class="profile_intro">
					<span style="font-size: 25px; margin-bottom: 10px;">${loginUser.usernick}님</span>
					<span style="font-size: 15px;">자유게시판 게시글 수: ${page.count}개 / 댓글 수: ${replypage.count}개</span>
				</div>
			</div>
			<div class="boardcontents">
				<div id="contents">
					<ul class="tabs">
						<li class="tab-link current" data-tab="tab-1">내가 쓴 글</li>
						<li class="tab-link" data-tab="tab-2" onclick="location.href='${path}/profile/my_free_reply?num=1'">내가 쓴 댓글</li>
					</ul>
					<div id="tab-1" class="tab-content current" style="height: 525px;">
						<form name="form1" method="post" id="form1">
							<input type="hidden" name="b_writer" value="${loginUser.userid}">
							<input type="hidden" name="num" value="${select}">
							<ul class="ul_news_title">
								<table>
									<tr>
										<td class="boardnum">번호</td>
										<td class="title">제목</td>
										<td class="writer_id">작성자</td>
										<td class="date">작성일자</td>
										<td class="view">조회수</td>
										<td class="etc">&nbsp;</td>
									</tr>
								</table>
							</ul>
						</form>
						<c:forEach items="${list}" var="freelist">
							<ul class="ul_news">
								<table>
									<tr>
										<td class="boardnum">${freelist.b_num}</td>
										<td class="title"><a href="/profile/my_free_detail?b_num=${freelist.b_num}&reply_num=1"><span>${freelist.b_title}</span></a></td>
										<td class="writer_id">${freelist.b_writer}</td>
										<td class="date"><fmt:formatDate value="${freelist.b_date}" pattern="yyyy-MM-dd" /></td>
										<td class="view">${freelist.view_cnt}</td>
										<td class="etc">
											<div class="modify_div">
												<form method="get" style="width: 50px;" action="${path}/profile/my_free_modify">
													<div id="write_notice">
														<input type="hidden" name="b_num" value="${freelist.b_num}">
														<input type="hidden" name="num" value="${select}">
														<input type="submit" class="modify_btn" value="수정">
													</div>
												</form>
											</div>
											<div class="delete_div">
												<form method="post" style="width: 70px;" action="${path}/profile/my_free_delete">
													<div id="write_notice">
														<input type="hidden" name="b_num" value="${freelist.b_num}">
														<input type="hidden" name="num" value="${select}">
														<input type="submit" class="delete_btn" value="삭제" onclick="return delete_check();">
													</div>
												</form>
											</div>
										</td>
									</tr>
								</table>
							</ul>
						</c:forEach>
						<div class="deleteandwrite_btn">
							<form method="get" class="free_write" action="${path}/profile/my_free_write">
								<div id="write_notice">
									<input type="hidden" name="b_writer" value="${loginUser.userid}">
									<input type="hidden" name="num" value="${select}">
									<input type="submit" class="modify_btn" value="글쓰기">
								</div>
							</form>
							<form method="post" class="free_delete" action="${path}/profile/my_free_delete_all">
								<div id="write_notice">
									<input type="hidden" name="b_writer" value="${loginUser.userid}">
									<input type="hidden" name="num" value="${select}">
									<input type="submit" class="delete_btn" value="전체 삭제" onclick="return delete_check();">
								</div>
							</form>
						</div>
						<div class="btns">
							<ul class="pagination">
								<c:if test="${page.prev}">
									<li>
										[<a href='${path}/profile/my_free?num=${page.startPageNum-1}'>이전</a>]
									</li>
								</c:if>
								<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
									<li>
										<c:if test="${select != num}">
											<a href="${path}/profile/my_free?num=${num}">${num}</a>
										</c:if>
										<c:if test="${select == num}">
											<b style="font-weight: 700; color: red; text-decoration: underline;">${num}</b>
										</c:if>
									</li>
								</c:forEach>
								<c:if test="${page.next}">
									<li>
										[<a href="${path}/profile/my_free?num=${page.endPageNum+1}">다음</a>]
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	// 게시판 보기의 경우 url 뒤에 쿼리스트링이 붙어야 하기 때문에 해당 부분을 추가해 준다.
	var url = window.location.pathname + "?num=1";
	
	$('.sidetab').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});

	function delete_check() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			return true;

		} else {
			return false;
		}
	}
</script>

</html>