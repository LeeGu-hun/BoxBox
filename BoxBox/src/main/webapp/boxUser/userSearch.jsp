<%@page import="rental.RentalSearch"%>
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
	DaoAjax daoAjax = new DaoAjax();
	String placeName = request.getParameter("place");
	List place = new ArrayList();
	place = daoAjax.rentalSearch(placeName);
	out.print("<tr id='head'>");
	out.print("<td id='col1'>지역</td>");
	out.print("<td id='col2'>대여관리소</td>");
	out.print("<td id='col3'>카테고리</td>");
	out.print("<td id='col4'>종류</td>");
	out.print("<td id='col5'>설명</td>");
	out.print("<td id='col6'>대여금액(시간당)</td>");
	out.print("<td id='col7'>사진</td>");
	out.print("<td id='col8'>결제</td>");
	out.print("</tr>");
	for (int i = 0; i < place.size(); i++) {
		RentalSearch rentalSearch = (RentalSearch) place.get(i);
		out.print("<tr id='rentalRow'>");
		out.print("<td id='col1'>" + rentalSearch.getGu() + "</td>");
		out.print("<td id='col2'>" + rentalSearch.getPlace() + "</td>");
		out.print("<td id='col3'>" + rentalSearch.getCate() + "</td>");
		out.print("<td id='col4'>" + rentalSearch.getModel() + "</td>");
		out.print("<td id='col5'>" + rentalSearch.getInfo() + "</td>");
		out.print("<td id='col6'>" + rentalSearch.getFee() + "</td>");
		out.print("<td id='col7'>" +"<image src="+request.getContextPath()+"/images/"+rentalSearch.getPhoto()+" /></td>");
		out.print("<td id='col8'>"+"<a href='"+request.getContextPath()+"/payment'><input type='button' id='btn' value='결제' /></a>");
		out.print("</td></tr>");
		System.out.println(rentalSearch.getPlaceId());
		out.print("<input type='hidden' id='placeId' name='placeId' value='"+rentalSearch.getPlaceId()+"'/>");
	}
%>
