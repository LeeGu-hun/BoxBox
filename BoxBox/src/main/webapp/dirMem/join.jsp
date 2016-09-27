<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="contents">
	<c:if test="${empty authInfo }">
		<form action="login" method="post">
			<c:if test="${empty cookie.REMEMBER.value}">
				<input type="text" name="email" id="email" placeholder="이메일을 입력하세요."
					autofocus required>
				<input type="password" name="password" id="password"
					placeholder="비밀번호를 입력하세요." required>
				<div class="checkButton">
					<label>E-mail 기억&nbsp;&nbsp;<input type="checkbox"
						name="rememberEmail" id="rememberEmail" />
					</label>
				</div>
				<input type="submit" value="로 그 인">
				<input type="button" value="회 원 가 입" onclick="javascript:popup()">
			</c:if>
			<c:if test="${!empty cookie.REMEMBER.value}">

				<input type="text" name="email" id="email"
					value="${cookie.REMEMBER.value}" placeholder="이메일을 입력하세요."
					autofocus required>
				<input type="password" name="password" id="password"
					placeholder="비밀번호를 입력하세요." required>
				<div class="checkButton">
					<label>E-mail 기억&nbsp;&nbsp;<input type="checkbox"
						name="rememberEmail" id="rememberEmail" checked /></label>
				</div>
				<input type="submit" value="로 그 인">
				<input type="button" value="회 원 가 입" onclick="javascript:popup()">

			</c:if>
		</form>
	</c:if>


	<form:form commandName="registerRequest" action="member/regist">
		<h1>회 원 가 입</h1>
		<form:input path="email" placeholder="이메일" />
		<form:errors id="email" path="email" />
		<form:input path="name" placeholder="이름" />
		<form:errors path="name" />
		<form:password path="password" placeholder="비번" />
		<form:errors path="password" />
		<form:password path="confirmPassword" placeholder="비번" />
		<form:errors path="confirmPassword" />
		<form:input path="type" placeholder="타입" />
		<form:errors path="type" />

		<input type="submit" value=" 회 원 가 입 ">
	</form:form>
</div>
