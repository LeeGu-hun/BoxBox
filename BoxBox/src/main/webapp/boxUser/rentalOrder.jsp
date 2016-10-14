<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/rentalOrder.css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.js"
	integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function reserve() {
	$(function() {
		
	    $( "#dialog" ).dialog({
	    	modal:true,
	    	width:500,
	    	height:100
	    });
	  } );
}

function timeLook() {
	var hstartTime=document.getElementById('hstartTime').value;
	var hendTime=document.getElementById('hendTime').value;
	var rentalFull = document.getElementById('rentalFull').value;
	var rentalId = document.getElementById('rentalId').value;
	var startSelectedIndex = document.getElementById('startTime').selectedIndex;
	var startTime= document.getElementById('startTime').options[startSelectedIndex].value;
	var endSelectedIndex = document.getElementById('endTime').selectedIndex;
	var endTime= document.getElementById('endTime').options[endSelectedIndex].value;

	$.ajax({
		type : "POST",
		url : "./boxUser/popup.jsp",
		data : "rentalId=" + rentalId+"&startTime="+startTime+"&endTime="+endTime+"&rentalFull"+rentalFull,
		success : result4
		});
	function result4(msg) {
		$('#popupDiv').css('display','');
		$('#popupDiv').show;
		$('#popupTbl').html(msg);
	}
}
function timeSearch() {
	var rentalFull = document.getElementById('rentalFull').value;
	var rentalId = document.getElementById('rentalId').value;
	var startSelectedIndex = document.getElementById('startTime').selectedIndex;
	var startTime= document.getElementById("startTime").options[startSelectedIndex].value;
	var endSelectedIndex = document.getElementById('endTime').selectedIndex;
	var endTime= document.getElementById("endTime").options[endSelectedIndex].value;

	$.ajax({
		type : "POST",
		url : "./boxUser/rentalSearch.jsp",
		data : "rentalId=" + rentalId+"&startTime="+startTime+"&endTime="+endTime+"&rentalFull"+rentalFull,
		success : result3
	});
	function result3(msg) {
		$("#rentalSearch").html(msg);
	}
}

function addReserve() {
	var hstartTime=document.getElementById('hstartTime').value;
	var hendTime=document.getElementById('hendTime').value;
	var rentalId = document.getElementById('rentalId').value;
	var startSelectedIndex = document.getElementById('startTime').selectedIndex;
	var startTime= document.getElementById("startTime").options[startSelectedIndex].value;
	var endSelectedIndex = document.getElementById('endTime').selectedIndex;
	var endTime= document.getElementById("endTime").options[endSelectedIndex].value;
	if(startTime==endTime){
		alert("동일한 시간으로 예약할 수 없습니다.");
	}else{
	
	$.ajax({
		type : "POST",
		url : "./boxUser/addReserve.jsp",
		data : "rentalId=" + rentalId+"&startTime="+startTime+"&endTime="+endTime,
		success : result5
	});
	function result5(msg) {
		$("#addList").html(msg);
		var full =document.getElementById("full").value;
		if(full=="true"){
			var total = document.getElementById("total").value;			
			document.getElementById("total1").value = total;
		}
		if(full=="false"){
			document.getElementById("total1").value ="";
		}
	}
	}
}
</script>
<div id="header">
	<%@include file="/include/header.jsp"%>
</div>
<div class="rentalOrder" id="rentalOrder"
	style="height: 78%; overflow-y: auto;">
	<h2>대여가능물품 조회</h2>
	<table id="rentalItemDisplay">
		<tr>
			<%-- 			<form method="post" action="${pageContext.request.contextPath }/payment1"> --%>
			<input type="hidden" id="rentalId" name="rentalId"
				value="${TimeSearch.rentalId }" />
			<input type="hidden" id="rentalFull" name="rentalFull"
				value="${TimeSearch.rentalFull }" />
			<td id="compBox">대여상품&nbsp; :&nbsp; <input type="text"
				class="cmbRental" id="gu" name="gu" value="${TimeSearch.gu }"
				disabled="disabled" />&nbsp; <input type="text" class="cmbRental"
				id="placeName" name="placeName" value="${TimeSearch.placeName }"
				disabled="disabled" />&nbsp; <input type="text" class="cmbRental"
				id="cate" name="cate" value="${TimeSearch.cate }"
				disabled="disabled" />&nbsp; <input type="text" class="cmbRental"
				id="model" name="model" value="${TimeSearch.model }"
				disabled="disabled" />&nbsp;&nbsp;&nbsp; <br>

			</td>
			<td id="btnBox"><input type="submit" id="btnDisplay"
				class="btn btn-primary btn-block btn-large" value="예약 시간 조회"
				onclick="javascript:timeSearch();" /></td>
			<%-- 			</form> --%>
		</tr>

		<tr>
			<td colspan=2>
				<hr> <br>
				<h2>조회결과</h2>
				<div id='popupDiv' name='popupDiv' style="display: none;">
					<table id='popupTbl' name='popupTbl'>


					</table>
				</div>
				<table class="rentalDisplay" id="rentalSearch" name="rentalSearch">

				</table> <br>
			</td>
		</tr>

	</table>

	<hr>
	<br>
	<h2>주문내역 확인</h2>
	<div>
		<table class="rentalOrder" id='addList' name='addList'
			style='float: left;'>

		</table>
		<!-- 	<br> -->
		<!-- 	<hr> -->
		<!-- 	<br> -->
		총 대여금액&nbsp;&nbsp;&nbsp; <input type="text" id='total1' name='total1'
			value='' disabled /> <br> <br> <input type="button"
			id="btnPay" class="btn btn-primary btn-block btn-large" value="결제하기"
			onclick="'" />
	</div>
</div>
<div id="dialog" class="rentalDisplay1" style="display: none;">
	대여시간&nbsp; : &nbsp; <select class="cmbRental" id="startTime"
		name="startTime">
		<option value="start">시작 시간</option>
		<c:forEach var="i" begin="0" end="23">
			<c:if test="${i<10 }">
				<option value="0${i }">0${i }</option>
			</c:if>
			<c:if test="${i>=10 }">
				<option value="${i }">${i }</option>
			</c:if>
		</c:forEach>
	</select>&nbsp; <select class="cmbRental" id="endTime" name="endTime">
		<option value="end">종료 시간</option>
		<c:forEach var="i" begin="1" end="23">
			<c:if test="${i<10 }">
				<option value="0${i }">0${i }</option>
			</c:if>
			<c:if test="${i>=10 }">
				<option value="${i }">${i }</option>
			</c:if>
		</c:forEach>
		<option value="00">24</option>
	</select> <input type="button" class="btn btn-primary btn-block btn-large"
		value="추가하기" onclick="javascript:addReserve();" />

</div>

<div>
	<%@include file="/include/footer.jsp"%>
</div>