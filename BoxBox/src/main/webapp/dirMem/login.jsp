<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<title>로그인 창</title>

</head>
<body>

	아이디 패스워드 불일치 또는 존재하지 않는 회원 다시 로그인 시도하는 페이지
	<div id="boxCell">
		<form:form commandName="loginCommand" id="loginFrm" class="login">
			<table>
				<tr>
					<td>이메일</td>
					<td><form:input path="email" name="email" id="email" /></td>
				</tr>
				<tr colspan='2'>
					<form:errors path="email" />
				</tr>
				<td>
				<td>비밀번호</td>
				<td><form:password path="password" name="password"
						id="password" /></td>
				</tr>
				<tr colspan='2'>
					<form:errors path="password" />
				<tr>
				<tr>
					<td><label>E-mail 기억 : <form:checkbox
								path="rememberEmail" /> <form:errors path="rememberEmail" />
					</label></td>
				<tr>
					<input type="submit" value="로 그 인" class="loginButton">
			</table>
		</form:form>
	</div>
</body>
</html>
