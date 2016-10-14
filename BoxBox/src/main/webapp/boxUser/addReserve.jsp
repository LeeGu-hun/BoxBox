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
	System.out.println("addReserve ajax작동");

	DaoAjax daoAjax = new DaoAjax();
	String placeName = request.getParameter("placeName");
	String rentalFull = request.getParameter("rentalFull");
	String rentalId = request.getParameter("rentalId");
	String startTime = request.getParameter("startTime");
	String endTime = request.getParameter("endTime");
	System.out.println(rentalId + "//" + startTime+"//" + endTime);
	List timeSearch = new ArrayList();
	timeSearch = daoAjax.fullEmpty(startTime, endTime, rentalId);
	System.out.println("fullEmpty 완료"+timeSearch.size());
	boolean full = false;
	for (int i = 0; i < timeSearch.size(); i++) {

		TimeSearch timeSearch1 = (TimeSearch) timeSearch.get(i);
		if (timeSearch1.getRentalFull().equals("1")) {
			full = false;
			System.out.println(timeSearch1.getRentalFull() + "//" + full);
			System.out.println("예약 불가능함");
		}
		if (!timeSearch1.getRentalFull().equals("1")) {
			full = true;
			System.out.println(timeSearch1.getRentalFull() + "//" + full);
			System.out.println("예약 가능함");
		}
	}
	if (full == true) {
		timeSearch = daoAjax.timeSearch(rentalId);
		String id="";
		String name="";
		String orderDate="";
		String orderTime="";
		String cate="";
		String model="";
		String info="";
		String photo="";
		String fee="";
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
		out.print("</tr>");
		
		for (int i = 0; i < timeSearch.size(); i++) {

			TimeSearch timeSearch1 = (TimeSearch) timeSearch.get(i);
			id=timeSearch1.getRentalId();
			name=timeSearch1.getPlaceName();
			orderDate=timeSearch1.getOrderDate();
			orderTime=startTime+"~"+endTime;
			cate=timeSearch1.getCate();
			model=timeSearch1.getModel();
			info=timeSearch1.getInfo();
			photo=timeSearch1.getPhoto();
			fee=timeSearch1.getFee();

			System.out.println(timeSearch1.getRentalId() + "/" + timeSearch1.getPlaceName());
		}
		out.print("<tr id='row'>");
		out.print("<td id='col1' name='col1'>"+id+"</td>");
		out.print("<td id='col2' name='col2'>"+name+"</td>");
		out.print("<td id='col3' name='col3'>"+orderDate+"</td>");
		out.print("<td id='col4' name='col4'>"+orderTime+"</td>");
		out.print("<td id='col5' name='col5'>"+cate+"</td>");
		out.print("<td id='col6' name='col6'>"+model+"</td>");
		out.print("<td id='col7' name='col7'>"+info+"</td>");
		out.print("<td id='col8' name='col8'>"+"<img src='"+request.getContextPath()+"/images/"+photo+"'></td>");
		out.print("<td id='col9' name='col9'>"+fee+"</td>");
		out.print("</tr>");
	}
	if (full == false) {
		out.print("<h1>이 시간에는 예약이 불가능합니다.</h1>");
	
	}
%>
