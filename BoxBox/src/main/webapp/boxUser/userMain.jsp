<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="main">
	<h3>BoxBox와 함께 쉽고 편리하게 보관함과 물품을 대여해 보아요.</h3>
	<select class="cmbRental" id="post" name="post" onchange="postList();">
		<option value="0" />지역 선택
		</option>
		<c:forEach var="place" items="${requestScope.place}">
			<option value="<c:out value="${place.postId}"/>">
				<c:out value="${place.city}-${place.gu}-${place.dong}" />
			</option>
		</c:forEach>
	</select>&nbsp; <select class="cmbRental" id="place" name="place">
		<option value="0" />지역을 선택하세요.
		</option>
	</select>&nbsp; <input type="button" class="btn btn-primary btn-block btn-large"
		value="대여가능 물품 검색" onclick="javascript:rentalList();"> <br>
	<br>
	<hr>
	<h2>대여가능 물품 리스트</h2>
	<div id="rowDiv" style="height: 400px; overflow-y: auto;">
		<table class="rentalDisplay" id="row">
		</table>
	</div>

</div>
