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
	
	for (int i = 0; i < place.size(); i++) {
		RentalSearch rentalSearch= (RentalSearch) place.get(i);
		out.print("<tr id='row"+(i+1)+"'>");
		out.print("<td id='col1'>" +rentalSearch.getGu()+ "</td>");
		out.print("<td id='col2'>" +rentalSearch.getPlace()+ "</td>");
		out.print("<td id='col3'>" +rentalSearch.getCate()+ "</td>");
		out.print("<td id='col4'>" +rentalSearch.getModel()+ "</td>");
		out.print("<td id='col5'>" +rentalSearch.getInfo()+ "</td>");
		out.print("<td id='col6'>" +rentalSearch.getFee()+ "</td>");
		out.print("<td id='col7'>" +rentalSearch.getPhoto()+ "</td>");
		out.print("</td>");
	}
%>
