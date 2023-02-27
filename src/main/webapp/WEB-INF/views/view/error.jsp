<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>우리동네 올림픽 :: 페이지를 찾을 수 없습니다</title>
  <link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  <link rel="stylesheet" href="${path}/resources/css/error.css">
</head>

<body>
  <div class="wrap">
    <div class="container">
      <div class="box">
      <div class="icon"><i class="material-symbols-outlined">error</i></div>
      <div class="img">
      <div class="logo1"></div>
      <div class="logo2"></div>
    </div>
      <div class="maintext">
        이런! 현재 해당 페이지를 찾을 수 없습니다. 
      </div>
      <div class="subtext">
        <p>방문하시려는 페이지의 주소가 잘못 입력되었거나,</p>
        <p>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
        <p>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
      </div>
      <div class="btn">
        <button class="btn-home" onclick="location.href='/'">우리동네올림픽 홈으로 이동하기</button>
      </div>
    </div>
    </div>
  </div>
</body>

</html>