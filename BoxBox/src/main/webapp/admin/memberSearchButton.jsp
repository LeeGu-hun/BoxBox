<%@page import="memberAdmin.MemberSearchAdmin"%>
<%@page import="dao.DaoAjaxLee"%>
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
	DaoAjaxLee daoAjaxLee = new DaoAjaxLee();
	String phone = request.getParameter("userPhone");
	List Member = new ArrayList();
	member = daoAjaxLee.memberSearch(phone);
	
	out.pirnt("<tr id='head'>");
	out.print("<td id='col2'>성명</td>");			 
	out.print("<td id='col3'>휴대폰번호</td>");
	out.print("<td id='col1'>e-mail</td>");
	out.print("<td id='col4'>비밀번호</td>");						
	out.print("</tr>");
	for (int i = 0; i < member.size(); i++) {
		MemberSearchAdmin memberSearchAdmin = (MemberSearchAdmin) member.get(i);
		out.print("<tr id='row'>");
		out.print("<td id='col2'>.</td>");	
		out.print("<td id='col3'>.</td>");
		out.print("<td id='col1'>.</td>");	
		out.print("<td id='col4'>.</td>");		
		out.print("</tr>");
	}
%>
