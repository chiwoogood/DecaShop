<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/login.css">

</head>
<body>
    <div class="login-wrapper">
        <h2>Join us</h2>
        <form method="post" action="${cpath}/member/join" id="login-form">
            <input type="text" name="username" placeholder="ID">
            <input type="password" name="password" placeholder="Password">
            <input type="password" name="passwordConfirm" placeholder="Password Confirm">
            <input type="text" name="name" placeholder="Name">
            <input type="text" name="nickname" placeholder="Nickname">
            <input type="email" name="email" placeholder="Email">
            <label for="remember-check">
                <a class="underlineHover" href="${cpath}/member/join">Join us</a>
            </label>
            <input type="submit" value="Join us">
        </form>
    </div>
</body>
</html>

<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${cpath}/resources/css/login.css">
<style>
</style>
</head>
<body>
	<div class="wrapper fadeInDown">
	  <div id="formContent">

	    <div class="fadeIn first">
	    	<h4>Please sign in</h4>
	    </div>
	

	    <form action="${cpath}/member/join" method="post">
	      <input type="text" id="username" class="fadeIn second" name="username" placeholder="login">
	      <input type="password" id="password" class="fadeIn second" name="password" placeholder="password">
	      <input type="text" id="name" class="fadeIn third" name="name" placeholder="name">
	      <br>
	      <br>
	      <h5 style="text-align: center;">권한</h5>
	      <br>
	      <input type="radio" class="fadeIn second" name="role" value="ADMIN"> 관리자
	      <input type="radio" class="fadeIn second" name="role" value="MANAGER"> 매니저
	      <input type="radio" class="fadeIn second" name="role" value="MEMBER"> 회원
	      
	      <input type="hidden" name="ebled" value="true">
	      <br>
	      <br>
	      <input type="submit" class="fadeIn fourth" value="Join">
	    </form>
	

	    <div id="formFooter">
	      <a class="underlineHover" href="${cpath}/">메인으로 돌아가기</a>
	    </div>
	
	  </div>
	</div>
</body>
</html>

-->