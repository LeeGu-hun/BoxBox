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
	timeSearch = daoAjax.timeSearch1(rentalId);

	out.print("<tr>");
	out.print("<td class='time' colspan='24'>오늘 예약된 시간 </td>");
	out.print("</tr>");
	out.print("<tr>");
	for (int i = 0; i < 24; i++) {
		if (i < 9) {
			out.print("<td class='time' id='time0" + i + "' name='time0" + i + "'>" + "0" + i + "~0" + (i + 1)
					+ "시</td>");
		} else if (i == 9) {
			out.print("<td class='time' id='time0" + i + "' name='time0" + i + "'>" + "0" + i + "~" + (i + 1)
					+ "시</td>");
		} else {
			out.print(
					"<td class='time' id='time" + i + "' name='time" + i + "'>" + i + "~" + (i + 1) + "시</td>");
		}
	}
	out.print("</tr>");
	System.out.println("for문진입"+timeSearch.size());
	out.print("<tr>");
	for (int i = 0; i < timeSearch.size(); i++) {
		String style = "style='background:white;'";
		TimeSearch timeSearch1 = (TimeSearch) timeSearch.get(i);
		String full=timeSearch1.getRentalFull();
		String start = timeSearch1.getStartTime();
		if(full.equals("1")){
			out.print("<td class='time' id='time' name='time' "+style+"></td>");
		}
		if(full.equals("0")){
			out.print("<td class='time' id='time' name='time'>예약 가능</td>");
		}
	}
	out.print("</tr>");

%>