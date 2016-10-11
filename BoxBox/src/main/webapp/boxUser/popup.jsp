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
	out.print("<tr>");
	for (int i = 0; i < 24; i++) {
		if(i<9){
			out.print("<td class='time' id='time0" + i + "' name='time0" + i + "'>" +"0"+ i + "~0" + (i + 1) + "시</td>");
		}else if(i==9){
			out.print("<td class='time' id='time0" + i + "' name='time0" + i + "'>" +"0"+ i + "~" + (i + 1) + "시</td>");
		}else{
		out.print("<td class='time' id='time" + i + "' name='time" + i + "'>" + i + "~" + (i + 1) + "시</td>");
		}
	}
	out.print("</tr>");
	out.print("<tr>");
	for (int i = 0; i < 24; i++) {
		if(i<9){
			out.print("<td class='time' id='time" + "0"+ i + "' name='time" +"0"+ i + "'></td>");
		}else if(i==9){
			out.print("<td class='time' id='time" + "0"+ i + "' name='time" +"0"+ i + "'></td>");
		}else{
		out.print("<td class='time' id='time" + i + "' name='time" + i + "'></td>");
		}
	}
	out.print("</tr>");
%>