<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="headerAdmin">
	<div class="logo">
		BOX<br> BOX
	</div>
	<c:if test="${ empty authInfo}">
		<c:if test="${ authInfo.type==1}">
			<div class="menuAdmin">
				<ul>
					<li onClick="location.href='rentalPlaceDisplay.jsp'">관리소 목록
						추가/변경/삭제</li>
					<li onClick="location.href='rentalItemDisplay.jsp'">렌탈 목록
						추가/변경/삭제</li>
					<li onClick="location.href='profit.jsp'">사업수익 현황</li>
					<li onClick="location.href='memberDisplay.jsp'">회원조회</li>
				</ul>
			</div>
		</c:if>
		<c:if test="${authInfo.type==2}">
			<div class="adminName">
				${authInfo.name }님 환영합니다.<br> <a
					href="<c:url value='/member/changeInfo'/>"><input type="button"
					id="btn" value="회원정보변경" /></a> <a href="<c:url value='/logout'/>"><input
					type="button" id="btn" value="로그아웃" /></a>
			</div>
		</c:if>
	</c:if>
</div>

