<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	window.onload = function() {
		var contents = $(document).height()-($('#header').height()+$('#footer').height());
		$('#myList').css('height', contents);
		// 		var email = document.getElementById('emailConfirm').value;
		// 		if (email != "") {
		// 			alert(email + '이 이미 존재합니다.');
		// 		}
		
	}
	
</script>
<div id="myList" name="myList" style="float:center;overflow-y:scroll; ">
	<div id="timeline" style="width:950px;height:750px;">
		
		<form:form method="POST" commandName="boardCommand" action="RegistBoard" style="margin-left:140px;" enctype="multipart/form-data">
			<form:textarea id="contents" name="contents" path="contents" style="width:650px;height:200px;overflow-y: scroll; resize: none;"></form:textarea>
			<input type="file" id="file" name="file" required="required" style="height:30px;" />
			<input type="submit" style="width:100px;height:30px;" value=" 글 쓰기 "/>
			<input type="hidden" id="upDir" name="upDir" value="<%=request.getRealPath("/uploads/") %>" />
		</form:form>
		<br>
		<c:forEach var="boards" items="${requestScope.boards}">
				<div id = timelineDiv style = "background: white; width: 900px; height: 700px;">
					<div id = subject style = "height: 50px;border-bottom-style: solid;border-bottom-width: 1px;border-color: black;">
						<table style = "width: 100%;height: 50px;">
							<tr>
								<td style = "text-align: left;padding-left:10px;">Num : ${boards.num } 작성자 : ${boards.subject }</td>
								<td style = "text-align: right;padding-right:10px;">Date : ${boards.datetime }</td>
							</tr>
						</table>
					</div>
					<div id = contentBox style = "height: 600px;overflow-y:scroll;">
						<table style = "width: 100%;height: 600px;">
							<tr id="trContent" style="height:600px; ">
								<td style = "width:50px;text-align: left;border-right-style: solid;border-right-width: 1px;border-color: black;padding-left:10px;">
								내용 : </td>
								<td style = "height:100px;text-align: right;">
								<div style=" padding:10px 20px 10px 10px;">
								${boards.content }<br>
								${boards.file }<br>
								<div style="width:100%;height:600px;">
								<image id = "images" src="<%=request.getContextPath()%>/uploads/${boards.file}" style="width:500px; height:500px;"/>
								</div>
								</div>
								</td>
							</tr>
						</table>
					</div>
					<br>
				</div>
				<br>
		</c:forEach>
	</div>
</div>