<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/join.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/js.js"></script>

<%-- 
<form action="${pageContext.request.contextPath }/alterPassword">
<c:set var="myContextPath" value="${pageContext.request.contextPath }"/>

 --%>
 <div class="join">
	<form:form method="post" commandName="registerRequest"
		action="${pageContext.request.contextPath }/member/regist">
		<h1>회 원 가 입</h1>
		<form:input path="email" id="email" name="email" placeholder="이메일" />
		<form:errors id="email" path="email" />

		<form:input path="name" id="name" name="name" placeholder="이름" />
		<form:errors path="name" id="name" />

		<form:password path="password" id="password" name="password"
			placeholder="비밀번호" />
		<form:errors path="password" id="password" />
		<form:password path="confirmPassword" id="confirmPassword"
			name="confirmPassword" placeholder="비밀번호 확인" />
		<form:errors path="confirmPassword" id="confirmPassword" />

		<form:input path="phone" id="phone" name="phone"
			placeholder="휴대폰 번호 (-없이 입력)" />
		<form:errors id="phone" path="phone" />

		<form:input path="type" id="type" name="type" placeholder="타입" />
		<form:errors path="type" id="type" />

		<input class="btn btn-primary btn-block btn-large" type="submit"
			value=" 회 원 가 입 ">
	</form:form>
</div>