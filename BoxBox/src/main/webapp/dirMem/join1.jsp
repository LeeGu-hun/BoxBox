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
<div id="header">
	<%@include file="/include/header.jsp"%>
</div>

<div class="join">
	<form:form method="post" commandName="registerRequest"
		action="${pageContext.request.contextPath }/member/regist">
		<h1>회 원 가 입</h1>
		<form:input path="email" id="email" name="email" placeholder="이메일" />
		<form:errors id="email" path="email" style="font-size:15px; color:white; "/>

		<form:input path="name" id="name" name="name" placeholder="이름" style="margin-top:7px;"/>
		<form:errors path="name" id="name" style="font-size:15px; color:white; "/>

		<form:password path="password" id="password" name="password" placeholder="비밀번호" style="margin-top:7px;"/>
		<form:errors path="password" id="password" style="font-size:15px; color:white; "/>
		<form:password path="confirmPassword" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" style="margin-top:7px;"/>
		<form:errors path="confirmPassword" id="confirmPassword" style="font-size:15px; color:white; "/>

		<form:input path="phone" id="phone" name="phone" placeholder="휴대폰 번호 (-없이 입력)" style="margin-top:7px;"/>
		<form:errors id="phone" path="phone" style="font-size:15px; color:white; "/><br>
		<div style="width: 100%;text-align: center;">
			<b style="font-size:15px; color:white;">관리자 회원가입</b><form:radiobutton path="type" name="type" id="type" value="1" style="width: 15px;height: 15px;"/>
			<b style="font-size:15px; color:white;">일반 회원가입</b><form:radiobutton path="type" name="type" id="type" value="2" style="width: 15px;height: 15px;" checked="checked"/>
		</div> 
		<input class="btn btn-primary btn-block btn-large" type="submit" value=" 회 원 가 입 " style="margin-top:7px;">
	</form:form>
</div>
<div>
	<%@include file="/include/footer.jsp"%>
</div>