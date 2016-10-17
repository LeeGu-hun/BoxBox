<%@page import="rental.RentalSearch"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoAjax"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	DaoAjax daoAjax = new DaoAjax();
	String placeName = request.getParameter("place");
	List place = new ArrayList();
	place = daoAjax.rentalSearch(placeName);
	out.print("<tr id='head'>");
	out.print("<td id='col0'>관리소번호</td>");
	out.print("<td id='col1'>지역</td>");
	out.print("<td id='col2'>대여관리소</td>");
	out.print("<td id='col3'>주소</td>");
	out.print("</tr>");
	for (int i = 0; i < place.size(); i++) {
		RentalSearch rentalSearch = (RentalSearch) place.get(i);
		out.print("<tr id='rentalRow'>");
		out.print("<td id='col0'>" + rentalSearch.getPlaceId() + "</td>");
		out.print("<td id='col1'>" + rentalSearch.getGu() + "</td>");
		out.print("<td id='col2'>" + rentalSearch.getPlace() + "</td>");
		out.print("<td id='col3'>" + rentalSearch.getCate() + "</td>");
	out.print("</td></tr>");
 		System.out.println(rentalSearch.getPlaceId());
// 		out.print("<input type='hidden' id='placeId" + i + "' name='placeId" + i + "' value='"
// 				+ rentalSearch.getPlaceId() + "'/>");
	}
%>