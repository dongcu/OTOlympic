<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<style>
.side-bar {
	position: relative;
	top: -72px;
}

.banana {
	height: 600px;
	margin: 0 auto;
	align-items: center;
}

.banana .banana_title {
	margin: 0 auto;
	border-bottom: 2px solid black;
	padding: 0px 50px 30px 50px;
	width: 75%;
}

.banana .banana_title h2 {
	font-size: 20px;
	font-weight: bold;
}

.banana form {
	margin: 170px auto;
}

.banana table {
	margin: 50px auto;
}

.banana table th {
	width: 120px;
	text-align: left;
	font-weight: bold;
}

.banana #userpw, .banana #userpw_re, .banana #userpw_recheck {
	width: 300px;
	height: 40px;
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
	<c:if test="${modifyFail == 'F'}">
		<script>
			alert("현재 비밀번호가 일치하지 않습니다.");
		</script>
	</c:if>
	<%@ include file="../include/header.jsp"%>
	<c:if test="${loginUser == null}">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace('${cp}/user/login');
		</script>
	</c:if>
	<section>
		<%@ include file="../include/profile_sidebar.jsp"%>

		<!-- 개발코드 시작 -->
		<div class="banana">
			<div class="banana_title">
				<h2>비밀번호 수정</h2>
			</div>
			<form name="joinForm" method="post" action="${path}/profile/profile_pw_modify" onsubmit="return sendit()">
				<table>
					<tr>
						<td>
							<input type="hidden" name="userid" id="userid" value="${loginUser.userid}">
							<input type="hidden" name="user" id="user" value="${loginUser.userpw}">
						</td>
					</tr>
					<tr>
						<th><label for="userpw">현재 비밀번호</label></th>
						<td>
							<input type="password" name="userpw" id="userpw">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="userpw_re">새 비밀번호</label></th>
						<td>
							<input type="password" name="userpw_re" id="userpw_re">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="userpw_recheck">새 비밀번호 확인</label></th>
						<td>
							<input type="password" name="userpw_recheck" id="userpw_recheck">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="submit" value="비밀번호 수정">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	var url = window.location.pathname;
	
	$('.sidetab').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});

  function sendit() {
    const joinForm = document.joinForm;
    const userpw = joinForm.userpw;
    const userpw_re = joinForm.userpw_re;
    const userpw_recheck = joinForm.userpw_recheck;
    const englisha = /[a-z]/;
    const special = /[~!@#$%^&*]/;
    const number = /[0-9]/;

    if (userpw.value == "") {
      alert("현재 비밀번호를 입력해주세요!");
      userpw.focus();
      return false;
    }
    if (userpw_re.value == "") {
      alert("새로운 비밀번호를 입력해주세요!");
      userpw_re.focus();
      return false;
    }
    if (userpw_re.value.length < 8 || userpw_re.value.length > 20) {
      alert("비밀번호는 8자 이상, 20자 이하로 입력하세요!");
      userpw_re.focus();
      return false;
    }
    if (!englisha.test(userpw_re.value) || !special.test(userpw_re.value) || !number.test(userpw_re.value)) {
      alert("비밀번호는 영어(소문자), 숫자, 특수문자가 포함돼야 합니다!");
      userpw_re.focus();
      return false;
    }
    if (userpw_recheck.value == "") {
      alert("새 비밀번호를 확인해주세요!");
      userpw_recheck.focus();
      return false;
    }
    if (userpw_recheck.value.length < 8 || userpw_recheck.value.length > 20) {
      alert("비밀번호는 8자 이상, 20자 이하로 입력하세요!");
      userpw_recheck.focus();
      return false;
    }
    if (!englisha.test(userpw_recheck.value) || !special.test(userpw_recheck.value) || !number.test(userpw_recheck.value)) {
      alert("비밀번호는 영어(소문자), 숫자, 특수문자가 포함돼야 합니다!");
      userpw_recheck.focus();
      return false;
    }
    if (userpw_re.value != userpw_recheck.value) {
      alert("새로운 비밀번호가 일치하지 않습니다!");
      userpw_re.focus();
      return false;
    }
    if (userpw.value == userpw_re.value) {
    	alert("새로운 비밀번호가 현재 비밀와 일치합니다!");
    	userpw_re.focus();
    	userpw_re.value = null;
    	userpw_recheck.value = null;
    	return false;
    }

    return true;
  }
</script>
</html>