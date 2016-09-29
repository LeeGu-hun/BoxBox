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




<div class="login">
	<h1>Login</h1>
	<form method="post" action="login">
		<input type="text" id="email" name="email" placeholder="Email" autofocus
			required="required" /> <input type="password" name="password" id="password"
			placeholder="Password" required="required" />
		<button type="submit" class="btn btn-primary btn-block btn-large"
			style="margin-bottom: 10px;">로그인</button>
		<input type="button" class="btn btn-primary btn-block btn-large"
			value="회원가입" onclick="location.href='<%=request.getContextPath()%>/join'">
	</form>
</div>




<!-- 로그인 -->
<!-- <div id="contents"> -->
<%--   	<c:if test="${empty authInfo }">   --%>
<%--   		<form action="login" method="post">   --%>
<%--   			<c:if test="${empty cookie.REMEMBER.value}">   --%>
<!-- 				<input type="text" name="email" id="email" placeholder="이메일을 입력하세요." -->
<!-- 					autofocus required> -->
<!-- 				<input type="password" name="password" id="password" -->
<!-- 					placeholder="비밀번호를 입력하세요." required> -->
<!-- 				<div class="checkButton"> -->
<!-- 					<label>E-mail 기억&nbsp;&nbsp;<input type="checkbox" -->
<!-- 						name="rememberEmail" id="rememberEmail" /> -->
<!-- 					</label> -->
<!-- 				</div> -->
<!-- 				<input type="submit" value="로 그 인"> -->
<!-- 				<input type="button" value="회 원 가 입" onclick="javascript:popup()"> -->
<%--   			</c:if>   --%>
<%--   			<c:if test="${!empty cookie.REMEMBER.value}">   --%>

<!-- 				<input type="text" name="email" id="email" -->
<%--   					value="${cookie.REMEMBER.value}" placeholder="이메일을 입력하세요."   --%>
<!-- 					autofocus required> -->
<!-- 				<input type="password" name="password" id="password" -->
<!-- 					placeholder="비밀번호를 입력하세요." required> -->
<!-- 				<div class="checkButton"> -->
<!-- 					<label>E-mail 기억&nbsp;&nbsp;<input type="checkbox" -->
<!-- 						name="rememberEmail" id="rememberEmail" checked /></label> -->
<!-- 				</div> -->
<!-- 				<input type="submit" value="로 그 인"> -->
<!-- 				<input type="button" value="회 원 가 입" onclick="javascript:popup()"> -->

<%--   			</c:if>   --%>
<%--   		</form>   --%>
<%--   	</c:if>   --%>

<%--   	<form:form method="post" commandName="registerRequest"   --%>
<%--   		action="member/regist">   --%>
<!-- 		<h1>회 원 가 입</h1> -->
<%--   		<form:input path="email" id="email" name="email" placeholder="이메일" />   --%>
<%--   		<form:errors id="email" path="email" />   --%>
<%--   		<form:input path="name" id="name" name="name" placeholder="이름" />   --%>
<%--   		<form:errors path="name" id="name" />   --%>
<%--   		<form:password path="password" id="password" name="password"   --%>
<%--   			placeholder="비번" />   --%>
<%--   		<form:errors path="password" id="password" />   --%>
<%--   		<form:password path="confirmPassword" id="confirmPassword"   --%>
<%--   			name="confirmPassword" placeholder="비번" />   --%>
<%--   		<form:errors path="confirmPassword" id="confirmPassword" />   --%>
<%--   		<form:input path="phone" id="phone" name="phone" placeholder="폰" />   --%>
<%--   		<form:errors id="phone" path="phone" />   --%>
<%--   		<form:input path="type" id="tpye" name="type" placeholder="타입" />   --%>
<%--   		<form:errors path="type" id="type" />   --%>

<!-- 		<input type="submit" value=" 회 원 가 입 "> -->
<%--   	</form:form>   --%>
<!-- </div> -->
