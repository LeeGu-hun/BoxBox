<%@page import="rental.TimeSearch"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoAjax"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<%
	System.out.println("ajax작동");
	DaoAjax daoAjax = new DaoAjax();
	String rentalId = request.getParameter("rentalId");
	String startTime = request.getParameter("startTime");
	String endTime = request.getParameter("endTime");
	String orderDate = request.getParameter("orderDate");
	String orderDate1 = request.getParameter("orderDate1");
	System.out.println(rentalId+startTime+endTime+orderDate+orderDate1);
	List timeSearch = new ArrayList();
	timeSearch = daoAjax.timeSearch(rentalId, startTime, endTime, orderDate, orderDate1);
	out.print("<tr id ='head'>");
	out.print("<td id='col1'>대여물품코드</td>");
	out.print("<td id='col2'>대여관리소</td>");
	out.print("<td id='col3'>대여날짜</td>");
	out.print("<td id='col4'>대여시간</td>");
	out.print("<td id='col5'>상품카테고리</td>");
	out.print("<td id='col6'>상품유형</td>");
	out.print("<td id='col7'>상품설명</td>");
	out.print("<td id='col8'>사진</td>");
	out.print("<td id='col9'>대여금액(시간당)</td>");
	out.print("<td id='col10'>추가</td>");
	out.print("</tr>");
	for (int i = 0; i < timeSearch.size(); i++) {
		System.out.println("for문 입장");
		TimeSearch timeSearch1 = (TimeSearch) timeSearch.get(i);
		out.print("<tr id='row'>");
		out.print("<td id='col1'>" + timeSearch1.getRentalId() + "</td>");
		out.print("<td id='col2'>" + timeSearch1.getPlaceName() + "</td>");
		out.print("<td id='col3'>" + timeSearch1.getOrderDate() + "</td>");
		out.print("<td id='col4'>" + timeSearch1.getOrderTime() + "</td>");
		out.print("<td id='col5'>" + timeSearch1.getCate() + "</td>");
		out.print("<td id='col6'>" + timeSearch1.getModel() + "</td>");
		out.print("<td id='col7'>" + timeSearch1.getInfo() + "</td>");
		out.print("<td id='col8'>" + "<image src=" + request.getContextPath() + "/images/"
				+ timeSearch1.getPhoto() + " /></td>");
		out.print("<td id='col9'>" + timeSearch1.getFee() + "</td>");
		out.print(
				"<td id='col10'><input type='button' id='btnAdd' class='btnAdd btnAdd-primary btnAdd-block btnAdd-large' value='추가' /></a></td>");
		out.print("</tr>");
		System.out.println(timeSearch1.getRentalId() + "/" + timeSearch1.getPlaceName() + "/"
				+ timeSearch1.getOrderDate() + "/" + timeSearch1.getOrderTime() + "/" + timeSearch1.getCate());
		// 		System.out.println(rentalSearch.getPlaceId());
		// 		out.print("<input type='hidden' id='placeId" + i + "' name='placeId" + i + "' value='"
		// 				+ rentalSearch.getPlaceId() + "'/>");
	}
%>
