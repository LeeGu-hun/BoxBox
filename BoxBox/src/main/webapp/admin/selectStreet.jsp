
<%@page import="place.Street"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DaoAjax"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="place.Place"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<%
	DaoAjax daoAjax = new DaoAjax();
	String dong = request.getParameter("dong");
	System.out.println(dong);
	List street = new ArrayList();
	street = daoAjax.comboStreet(dong);
	out.print("<option value='0' >도로명 선택	</option>");
	for (int i = 0; i < street.size(); i++) {
		Street street1= (Street) street.get(i);
		out.print("<option value='"+street1.getPostId()+"' >"+street1.getStreet()+"</option>");
		System.out.println(street1.getStreet());
		
	}
%>