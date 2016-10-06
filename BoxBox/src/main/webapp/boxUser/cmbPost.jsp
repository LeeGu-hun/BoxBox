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
// 	if (postId.equals("0")) {
// 	}
	out.println("<option value = '0'>지역을 선택하세요.</option>");
	for (int i = 0; i < post.size(); i++) {
		Place place = (Place) post.get(i);
		out.print("<option value = " + place.getPostId());
		out.print(">" + place.getName() + "</option>");
	}
%>



