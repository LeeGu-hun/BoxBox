<%@page import="place.Gu"%>
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
	String city = request.getParameter("city");
	System.out.println(city);
	List gu = new ArrayList();
	gu = daoAjax.comboGu(city);
	out.print("<option value='0' >구 선택	</option>");
	for (int i = 0; i < gu.size(); i++) {
		Gu gu1 = (Gu) gu.get(i);
		out.print("<option value='"+gu1.getGu()+"' >"+gu1.getGu()+"</option>");
		System.out.println(gu1.getGu());
		
	}
%>
<!-- String id, String city, String gu, String dong, String street, String name, String postId -->




