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

<div id="header">
	<%@include file="/include/header.jsp"%>
</div>


<div class="login">
	<h1>Login</h1>
	<c:if test="${empty authInfo }">
		<form:form commandName="loginCommand" method="post" action="login">
			<c:if test="${empty cookie.REMEMBER.value}">
				<input type="text" id="email" name="email" placeholder="Email" autofocus required="required" />
				<input type="password" name="password" id="password" placeholder="Password" required="required" />
				<label for="rememberEmail">E-mail 기억&nbsp;&nbsp;<input type="checkbox"	name="rememberEmail" id="rememberEmail" style="width: 15px;height: 15px;"/></label> 
				<form:errors path="email" id="memberNotFound" name="memberNotFound" style="font-size:13px; color:white;"/>
				<form:errors path="password" id="idPasswordNotMatching" name="idPasswordNotMatching" style="font-size:13px; color:white;"/>
				<button type="submit" class="btn btn-primary btn-block btn-large" style="margin-bottom: 5px;">로그인</button>
				<input type="button" class="btn btn-primary btn-block btn-large" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/join'">
			</c:if>
			
			<c:if test="${!empty cookie.REMEMBER.value}">
				<input type="text" id="email" name="email" placeholder="Email" autofocus required="required" value="${cookie.REMEMBER.value}" />
				<input type="password" name="password" id="password" placeholder="Password" required="required" />
				<label for="rememberEmail">E-mail 기억&nbsp;&nbsp;<input type="checkbox"	name="rememberEmail" id="rememberEmail" style="width: 15px;height: 15px;"/></label>
				<form:errors path="email" id="memberNotFound" name="memberNotFound" style="font-size:13px; color:white;"/>
				<form:errors path="password" id="idPasswordNotMatching" name="idPasswordNotMatching" style="font-size:13px; color:white;"/>
				<button type="submit" class="btn btn-primary btn-block btn-large" style="margin-bottom: 5px;">로그인</button>
				<input type="button" class="btn btn-primary btn-block btn-large" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/join'">
			</c:if>
		</form:form>
	</c:if>
</div>
<div>
	<%@include file="/include/footer.jsp"%>
</div>