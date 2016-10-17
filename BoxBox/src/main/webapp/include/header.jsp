<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="headerAdmin">
	<div class="logo" onclick="location.href='<%=request.getContextPath() %>/main'" style="cursor: hand;">
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
			<form method="post" action="myrental">
				<input type="text" id="nameInfo" style="width: 40%; background: transparent; color: white; border: none; font-size: 17px"
					 value=" ${authInfo.name }님 환영합니다." disabled/>
				<input type="hidden" id="userId" name="userId"value="${authInfo.id}">
				<input type="submit" id="btn" value="My Rental" style="width: 20%;" />
			</form>
			<a href="<c:url value='/member/changeInfo'/>"><input type="button" id="btn" value="회원정보변경" /></a>
			<a href="<c:url value='/logout'/>"><input type="button" id="btn" value="로그아웃" /></a>
		</div>
	</c:if>
</div>

