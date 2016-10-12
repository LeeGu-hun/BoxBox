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
	System.out.println("pupup ajax작동");
	DaoAjax daoAjax = new DaoAjax();
	String rentalFull = request.getParameter("rentalFull");
	String rentalId = request.getParameter("rentalId");
	String startTime = request.getParameter("startTime");
	String endTime = request.getParameter("endTime");
	String orderDate = request.getParameter("orderDate");
	String orderDate1 = request.getParameter("orderDate1");
	System.out.println(
			rentalId + "/" + startTime + "/" + endTime + "/" + orderDate + "/" + orderDate1 + "/" + rentalFull);
	List timeSearch = new ArrayList();
	timeSearch = daoAjax.timeSearch(rentalFull, rentalId, startTime, endTime, orderDate, orderDate1);
	out.print("<tr id='head'>");
	out.print("<td id='sub1'>렌탈아이디</td>");
	out.print("<td id='sub2'>대여관리소</td>");
	out.print("<td id='sub3'>주문날짜</td>");
	out.print("<td id='sub4'>예약된시간</td>");
	out.print("<td id='sub5'>카테고리</td>");
	out.print("<td id='sub6'>상품종류</td>");
	out.print("<td id='sub7'>상품설명</td>");
	out.print("<td id='sub8'>사진</td>");
	out.print("<td id='sub9'>가격(시간당)</td>");
	out.print("<td id='sub10'>결제</td>");
	out.print("</tr>");
	for (int i = 0; i < timeSearch.size(); i++) {
	
		
		TimeSearch timeSearch1 = (TimeSearch) timeSearch.get(i);
		out.print("<tr id='row'>");
		out.print("<td id='col1'>" + timeSearch1.getRentalId() + "</td>");
		out.print("<td id='col2'>" + timeSearch1.getPlaceName() + "</td>");
		out.print("<td id='col3'>" + timeSearch1.getOrderDate() + "</td>");
		out.print("<td id='col4'>" + timeSearch1.getStartTime().split(" ")[1] + "~" + timeSearch1.getEndTime().split(" ")[1] + "</td>");
		out.print("<td id='col5'>" + timeSearch1.getCate() + "</td>");
		out.print("<td id='col6'>" + timeSearch1.getModel() + "</td>");
		out.print("<td id='col7'>" + timeSearch1.getInfo() + "</td>");
		out.print("<td id='col8'>" + "<image src=" + request.getContextPath() + "/images/"
				+ timeSearch1.getPhoto() + " /></td>");
		out.print("<td id='col9'>" + timeSearch1.getFee() + "</td>");
		out.print(
				"<td id='col10'><input type='button' id='btnAdd' class='btnAdd btnAdd-primary btnAdd-block btnAdd-large' value='예약' onclick='' /></a></td>");
		out.print("<input type='hidden' id='hstartTime' name='hstartTime' value='"+timeSearch1.getStartTime() +"'>");
		out.print("<input type='hidden' id='hendTime' name='hendTime' value='"+timeSearch1.getEndTime() +"'></tr>");
		out.print("</tr>");
		
	
		System.out.println(timeSearch1.getRentalId() + "/" + timeSearch1.getPlaceName());
	}
		out.print("<tr><td colspan='10'><input type='button' id='btnDisplay' class='btn btn-primary btn-block btn-large' value='비어있는 시간 조회'	onclick='javascript:timeLook();' /></td></tr>");
%>
