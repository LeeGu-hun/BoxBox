<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	
</script>



<div id="contents">
	<c:if test="${empty authInfo }">
		<form class="login" id="loginForm" action="login" method="post">
			<h1 class="loginTitle">My SNS</h1>
			<c:if test="${empty cookie.REMEMBER.value}">
				<input type="text" class="loginInput" name="email" id="email" placeholder="이메일을 입력하세요." autofocus required>
				<input type="password" class="loginInput" name="password" id="password" placeholder="비밀번호를 입력하세요." required>
				<div class="checkButton"><label>E-mail 기억&nbsp;&nbsp;<input type="checkbox" style="width:22px;height:22px;" name="rememberEmail" id="rememberEmail" /> </label></div>
				<input type="submit" value="로 그 인" class="loginButton">
				<input type="button" value="회 원 가 입" class="joinButton"
					onclick="javascript:popup()">
			</c:if>
			<c:if test="${!empty cookie.REMEMBER.value}">
			
				<input type="text" class="loginInput" name="email" id="email" value="${cookie.REMEMBER.value}" placeholder="이메일을 입력하세요." autofocus required>
				<input type="password" class="loginInput" name="password" id="password" placeholder="비밀번호를 입력하세요." required>
				<div class="checkButton"><label>E-mail 기억&nbsp;&nbsp;<input type="checkbox" name="rememberEmail" id="rememberEmail" checked/></label></div>
				<input type="submit" value="로 그 인" class="loginButton">
				<input type="button" value="회 원 가 입" class="joinButton" onclick="javascript:popup()">

			</c:if>
		</form>
	</c:if>
	

	<form:form id="joinForm" class="join" style="display:none;"	commandName="registerRequest" action="member/regist">
		<h1 class="joinTitle">회 원 가 입</h1>
		<form:input path="email" id="emailConfirm" class="joinInput" placeholder="이메일" />
		<form:errors id="email" path="email" />
		<form:input path="name" class="joinInput" placeholder="이름" />
		<form:errors path="name" />
		<form:password path="password" class="joinInput" placeholder="비번" />
		<form:errors path="password" />
		<form:password path="confirmPassword" class="joinInput" placeholder="비번" />
		<form:errors path="confirmPassword" />
		<input type="submit" value=" 회 원 가 입 " class="joinButton">
	</form:form>
</div>
