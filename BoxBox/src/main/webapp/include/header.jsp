<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="headerAdmin">
	<div class="logo">
		BOX<br> BOX
	</div>
<!-- 	<div class="menuAdmin"> -->
<!-- 		<ul> -->
<!-- 			<li onClick="location.href='rentalPlaceDisplay.jsp'">관리소 목록 -->
<!-- 				추가/변경/삭제</li> -->
<!-- 			<li onClick="location.href='rentalItemDisplay.jsp'">렌탈 목록 -->
<!-- 				추가/변경/삭제</li> -->
<!-- 			<li onClick="location.href='profit.jsp'">사업수익 현황</li> -->
<!-- 			<li onClick="location.href='memberDisplay.jsp'">회원조회</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	<c:if test="${ !empty authInfo}">
		<div class="adminName">
			${authInfo.name }님 환영합니다.<br> 
<%-- 			<a href="<c:url value='/member/myrental'/>"> --%>
			<form method="post" action="${pageContext.request.contextPath }/member/myrental" style="display:inline-block;width:300px;">
				<input type="hidden" id="userId" name="userId"value="${authInfo.id}">
				<input type="submit" id="btn" value="My Rental" />
			</form>
			<a href="<c:url value='/member/changeInfo'/>"><input type="button" id="btn" value="회원정보변경" /></a>
			<a href="<c:url value='/logout'/>"><input type="button" id="btn" value="로그아웃" /></a>
		</div>
	</c:if>
</div>

