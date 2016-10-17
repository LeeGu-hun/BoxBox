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
	String postId = request.getParameter("post");
	System.out.println("포스트 아이디 : " + postId);
	List post = new ArrayList();
	post = daoAjax.comboPlace(postId);
	System.out.println("포스트 사이즈 : " + post.size());

	out.print("<table class='placeDisplayTable'>");
	out.print("<tr id='head'><td id='col1'>지역번호</td><td id='col2'>시</td><td id='col3'>구</td><td id='col4'>동</td><td id='col5'>관리소명</td></tr>");
	for (int i = 0; i < post.size(); i++) {
		Place place = (Place) post.get(i);
		out.print("<tr id='row'>");
		out.print("<td id='col1'>"+place.getPostId()+"</td>");
		out.print("<td id='col2'>"+place.getCity()+"</td>");
		out.print("<td id='col3'>"+place.getGu()+"</td>");
		out.print("<td id='col4'>"+place.getDong()+"</td>");
		out.print("<td id='col5'>"+place.getName()+"</td>");
		out.print("</tr>");
		
	}
	out.print("</table>");
%>
<!-- String id, String city, String gu, String dong, String street, String name, String postId -->


