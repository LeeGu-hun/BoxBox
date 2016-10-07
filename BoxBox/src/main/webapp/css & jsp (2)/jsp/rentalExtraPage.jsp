<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<link rel = "stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/rentalExtraPage.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoxBox</title>
</head>
<body>
<div class="rentalExtraPage">
	<h2>연장신청하기</h2>
	<form method="post" action="">
		<span id="extra">관리소 &nbsp;:&nbsp;</span>
		<input type="text" id="place" name="place" autofocus disabled /><br>
		<span id="extra">상품명 &nbsp;:&nbsp;</span>
		<input type="text" id="item" name="place" autofocus disabled /><br><br>
		<span id="extra">연장희망시간 &nbsp;:&nbsp;</span>
		<select class="cmbRental">		
			<optgroup label="연장시간">
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
			</optgroup>
		</select>
		<span id="extra">시간</span>
		<br><br><hr><br>
		<table id="extraResult">
			<tr>
				<td style="width: 50%;">
					<h3>연장신청 후 대여종료 시각</h3>
				</td>
				<td style="width: 50%;">
					<h3>연장추가 금액</h3>	
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="endTime" autofocus disabled />
				</td>
				<td>
					<input type="text" id="extraPay" autofocus disabled />
				</td>
			</tr>
		</table>		
		<br>		
		<input type="submit" class="btn btn-primary btn-block btn-large" value="연장신청"	/><br><br>
		<input type="button" class="btn btn-primary btn-block btn-large" value="이전 페이지로 돌아가기"
		 	onClick="location.href='rentalReturnExtra.jsp';" />
		
	</form>
</div>
</body>
</html>
