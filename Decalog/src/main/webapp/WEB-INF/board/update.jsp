<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Spring Security 관련 태그라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="cpath" value="${pageContext.request.contextPath}" />  


<!-- 로그인한 계정정보 -->
<c:set var="user" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<!-- 권한정보 -->
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />  
    <link rel="stylesheet" href="${cpath}/resources/css/back.css">
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>	
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68319702969941b5f16a6c6089998014"></script>
  
</head>
<body>
  
  <div class="card">
    <div class="card-header">
    	<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>Spring MVC11</h1>
		    <p>Java -> HTML -> CSS -> JavaScript -> JSP&Servlet -> Spring F/W -> Spring Boot</p>
		  </div>
		</div>
    </div>
    <div class="card-body">
    	<div class="row">
    		<div class="col-lg-2">
    			<div class="card" style="min-height: 500px; max-height: 1000px;">
    				<div class="card-body">
    					<h4 class="card-title">
							<sec:authentication property="principal.member.name"/>
						</h4>
    					<p class="card-text">회원님 Welcome!</p>
    					<form action="${cpath}/member/logout">
    						<button type="submit" class="form-control btn btn-sm btn-primary">로그아웃</button>
    					</form>
    					
    					<br>
    					현재 권한 : <sec:authentication property="principal.member.role"/>
    					
    					<!-- 권한에 따른 화면구성 다르게 보여주기 -->
    					<sec:authorize access="hasRole('ADMIN')">
    						<button class="btn btn-info form-control">관리자페이지</button>
    						<br>
    						<br>
    						<button class="btn btn-success form-control">회원목록</button>
    						<br>
    						<br>
    						<button class="btn btn-warning form-control">개인정보수정</button>
    					</sec:authorize>
    					
    					<sec:authorize access="hasRole('MANAGER')">
    						<button class="btn btn-success form-control">회원목록</button>
    						<br>
    						<br>
    						<button class="btn btn-warning form-control">개인정보수정</button>
    					</sec:authorize>
    					
    					<sec:authorize access="hasRole('MEMBER')">
    						<button class="btn btn-warning form-control">개인정보수정</button>
    					</sec:authorize>
    					<br>
    					<br>
    					<button type="button" data-oper="list" class="btn btn-info form-control">게시글보기</button>
    					<br>
    					<br>
    					<button type="button" data-oper="book" class="btn btn-success form-control">도서검색</button>
    					<br>
    					<br>
    					<button type="button" data-oper="map" class="btn btn-warning form-control">지도검색</button>
    					
    					
    				</div>
    			</div>
    		</div>
    		<div  class="col-lg-5">
    			<div class="card" style="min-height: 500px; max-height: 1000px;">
    				<div class="card-body">
    					<table class="table table-bordered table-hover">
    						<thead>
    							<th>번호</th>
    							<th>제목</th>
    							<th>작성일</th>
    							<th>조회수</th>
    						</thead>
    						<tbody>
    							<c:forEach var="vo" items="${list}" varStatus="i">
    								<tr>
    									<td>${i.count}</td>
    									<td><a href="${vo.idx}">${vo.title}</a></td>
    									<td><fmt:formatDate value="${vo.indate}" pattern="yyyy-MM-dd" /> </td>
    									<td>${vo.count}</td>
    								</tr>
    							</c:forEach>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    		<div  class="col-lg-5">
    			<div class="card" style="min-height: 500px; max-height: 1000px;">
    				
    				<div class="card-body" id="board">
    					<form id="regForm" action="${cpath}/board/register" method="post">
    					
    						<input type="hidden" id="idx" name="idx" value="">
    						
    						<div class="form-group">
    							<label for="title">제목</label>
    							<input type="text" class="form-control" id="title" name="title" placeholder="Enter Title">
    						</div>
    						<div class="form-group">
    							<label for="content">내용</label>
    							<textarea id="content" name="content" class="form-control" placeholder="Enter Content" rows="7" cols=""></textarea>
    						</div>
    						<div class="form-group">
    							<label for="writer">작성자</label>
    							<input readonly="readonly" value="<sec:authentication property='principal.member.name' />" type="text" class="form-control" id="writer" name="writer" placeholder="Enter Writer">
    						</div>
    						<div id="regDiv">
	    						<button type="button" data-oper="register" class="btn btn-sm btn-primary">등록</button>
	    						<button type="button" data-oper="reset" class="btn btn-sm btn-warning">취소</button>
    						</div>
    						
    						<div id="updateDiv" style="display: none;">
    							<button class="btn btn-sm btn-primary" data-oper="list" type="button">목록</button>
    							<span id="update">
    							<button class="btn btn-sm btn-warning" data-oper="updateForm" type="button">수정</button>
    							</span>
    							<button class="btn btn-sm btn-success" data-oper="remove" type="button">삭제</button>
    						</div>
    						
    					</form>
    				</div>
    				
    				<div class="card-body" id="book" style="display: none;">
    					<h4>Book Search</h4>
    					<div class="input-group mb-3">
    						<input type="text" id="bookname" class="form-control" placeholder="Search">
    						<div class="input-group-append">
    							<button type="button" id="search" class="btn btn-secondary">GO</button>
    						</div>
    					</div>
    					<div id="bookList">
    					
    					</div>
    				</div>
    				
    				<div class="card-body" id="mapView" style="display: none;">
    					<h4>Map Search</h4>
    					<div class="input-group mb-3">
    						<input type="text" id="address" class="form-control" placeholder="Search">
    						<div class="input-group-append">
    							<button type="button" id="mapBtn" class="btn btn-secondary">GO</button>
    						</div>
    					</div>
    					<div id="map" style="width: 100%; height: 500px;">
    					
    					</div>
    				</div>
    				
    			</div>
    		</div>
    	</div>
    </div> 
    <div class="card-footer"></div>
  </div>
  
  
  
  
  

</body>
</html>
    
    
    
    