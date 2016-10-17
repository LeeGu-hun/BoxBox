<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	window.onload = function() {

		alert("반납을 완료하였습니다.");
		location.href='${pageContext.request.contextPath }/main.jsp';
	}
</script>