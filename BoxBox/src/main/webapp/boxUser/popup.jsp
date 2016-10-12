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
	out.print("<td class='time' colspan='24'>예약된 시간 </td>");
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
	System.out.print("for문진입");
	for (int i = 0; i < timeSearch.size(); i++) {
		String style = "style='background:white;'";
		TimeSearch timeSearch1 = (TimeSearch) timeSearch.get(i);
		int start = Integer.parseInt(timeSearch1.getStartTime().split(" ")[1]);
		int end = Integer.parseInt(timeSearch1.getEndTime().split(" ")[1]);
		out.print("<tr>");
		if (start < end) {
			for (int j = 0; j < start; j++) {
				out.print("<td class='time' id='time" + j + "' name='time" + j + "'>예약가능</td>");
			}
			for (int j = start; j < end; j++) {
				out.print("<td class='time' id='time" + j + "' name='time" + j + "'" + style + "></td>");
			}
			for (int j = end; j < 24; j++) {
				out.print("<td class='time' id='time" + j + "' name='time" + j + "'>예약가능</td>");
			}
		}

		if (start > end) {
			for (int j = 0; j < end; j++) {
				out.print("<td class='time' id='time" + j + "' name='time" + j + "'" + style + ">예약가능</td>");
			}
			for (int j = end; j < start; j++) {
				out.print("<td class='time' id='time" + j + "' name='time" + j + "'>예약가능</td>");
			}
			for (int j = start; j < 24; j++) {
				out.print("<td class='time' id='time" + j + "' name='time" + j + "'" + style + ">예약가능</td>");
			}
		}
		out.print("</tr>");

	}

	// 		if (i < 9) {
	// 			out.print("<td class='time' id='time" + "0" + i + "' name='time" + "0" + i + "'></td>");
	// 		} else if (i == 9) {
	// 			out.print("<td class='time' id='time" + "0" + i + "' name='time" + "0" + i + "'></td>");
	// 		} else {
	// 			out.print("<td class='time' id='time" + i + "' name='time" + i + "'></td>");
	// 		}
%>