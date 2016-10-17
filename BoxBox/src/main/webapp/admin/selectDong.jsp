<%@page import="place.Dong"%>
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
	String gu = request.getParameter("gu");
	System.out.println(gu);
	List dong = new ArrayList();
	dong = daoAjax.comboDong(gu);
	out.print("<option value='0' >동 선택	</option>");
	for (int i = 0; i < dong.size(); i++) {
		Dong dong1= (Dong) dong.get(i);
		out.print("<option value='"+dong1.getDong()+"' >"+dong1.getDong()+"</option>");
		System.out.println(dong1.getDong());
		
	}
%>