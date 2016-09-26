<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="header">
	<div id="headerLeft">
		<c:if test="${!empty authInfo }">
			<div style="float: left;">
				<h1 style="display: inline-block;">${authInfo.name }</h1>
				님 환영합니다. <a href="<c:url value='/member/changePassword'/>">[비밀번호
					변경]</a> <a href="<c:url value='/logout'/>">[로그아웃]</a>
			</div>
		</c:if>
	</div>
	<div id="headerCenter">Sihyun Note</div>
</div>