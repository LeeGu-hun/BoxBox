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
<div id="header">
	<%@include file="/include/header.jsp"%>
</div>
<div class="rentalOrder" id="rentalOrder" style="height:78%;">
	<h2>대여가능물품 조회</h2>
	<table id="rentalItemDisplay">
		<tr>
			<td id="compBox">대여상품&nbsp; : &nbsp; <input type="text"
				class="cmbRental" value="${RentalSearch.gu }" disabled="disabled" />
				&nbsp; <input type="text" class="cmbRental"
				value="${RentalSearch.place }" disabled="disabled" />&nbsp; <input
				type="text" class="cmbRental" value="${RentalSearch.cate }"
				disabled="disabled" />&nbsp; <input type="text" class="cmbRental"
				value="${RentalSearch.model }" disabled="disabled" />&nbsp;&nbsp;&nbsp;
			</td>
			<td id="btnBox"><input type="button" id="btnDisplay"
				class="btn btn-primary btn-block btn-large" value="예약 불가능한 시간 조회"
				onclick="'"></td>
		</tr>
		<tr>
			<td colspan=2>
				<hr> <br>
				<h2>조회결과</h2>
				<table class="rentalDisplay">
					<tr id="head">
						<td id="col1">대여물품코드</td>
						<td id="col2">대여관리소</td>
						<td id="col3">대여날짜</td>
						<td id="col4">대여시간</td>
						<td id="col5">상품카테고리</td>
						<td id="col6">상품유형</td>
						<td id="col7">상품설명</td>
						<td id="col8">사진</td>
						<td id="col9">대여금액(시간당)</td>
						<td id="col10">추가</td>
					</tr>
					<tr id="row">
						<td id="col1">.</td>
						<td id="col2">.</td>
						<td id="col3">.</td>
						<td id="col4">.</td>
						<td id="col5">.</td>
						<td id="col6">.</td>
						<td id="col7">.</td>
						<td id="col8">.</td>
						<td id="col9">.</td>
						<td id="col10"><input type="button" id="btnAdd"
							class="btnAdd btnAdd-primary btnAdd-block btnAdd-large"
							value="추가" onclick="'"></td>
					</tr>
				</table> <br>
			</td>
		</tr>
	</table>
	<br> 대여시간&nbsp; : &nbsp;<input type="date" id="orderDate" />&nbsp;
				<select class="cmbRental">
					<option value="">시작 시간</option>
					<option value="">0</option>
					<option value="">1</option>
					<option value="">2</option>
					<option value="">3</option>
					<option value="">4</option>
					<option value="">5</option>
					<option value="">6</option>
					<option value="">7</option>
					<option value="">8</option>
					<option value="">9</option>
					<option value="">10</option>
					<option value="">11</option>
					<option value="">12</option>
					<option value="">13</option>
					<option value="">14</option>
					<option value="">15</option>
					<option value="">16</option>
					<option value="">17</option>
					<option value="">18</option>
					<option value="">19</option>
					<option value="">20</option>
					<option value="">21</option>
					<option value="">22</option>
					<option value="">23</option>
			</select> ~&nbsp; <select class="cmbRental">
					<option value="">종료 시간</option>
					<option value="">1</option>
					<option value="">2</option>
					<option value="">3</option>
					<option value="">4</option>
					<option value="">5</option>
					<option value="">6</option>
					<option value="">7</option>
					<option value="">8</option>
					<option value="">9</option>
					<option value="">10</option>
					<option value="">11</option>
					<option value="">12</option>
					<option value="">13</option>
					<option value="">14</option>
					<option value="">15</option>
					<option value="">16</option>
					<option value="">17</option>
					<option value="">18</option>
					<option value="">19</option>
					<option value="">20</option>
					<option value="">21</option>
					<option value="">22</option>
					<option value="">23</option>
					<option value="">24</option>
			</select> 시
	<hr>
	<br>
	<h2>주문내역 확인</h2>
	<table class="addList">
		<tr id="head">
			<td id="col11">대여물품코드</td>
			<td id="col12">대여관리소</td>
			<td id="col13">상품설명</td>
			<td id="col14">대여시작</td>
			<td id="col15">대여종료</td>
			<td id="col16">대여금액</td>
			<td id="col17">취소</td>
		</tr>
		<tr id="row">
			<td id="col11">.</td>
			<td id="col12">.</td>
			<td id="col13">.</td>
			<td id="col14">.</td>
			<td id="col15">.</td>
			<td id="col16">.</td>
			<td id="col17"><input type="button" id="btnDel"
				class="btnDel btnDel-primary btnDel-block btnDel-large" value="취소"
				onclick="'"></td>
		</tr>
	</table>
	<br>
	<hr>
	<br> 총 대여금액&nbsp;&nbsp;&nbsp; <input type="text" disabled /> <br>
	<br> <input type="button" id="btnPay"
		class="btn btn-primary btn-block btn-large" value="결제하기" onclick="'" />
</div>
<div>
<%@include file="/include/footer.jsp"%>
</div>