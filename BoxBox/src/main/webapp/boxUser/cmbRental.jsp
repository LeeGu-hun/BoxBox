<%@page import="rental.Rental"%>
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
	String postId = request.getParameter("place");
	List place = new ArrayList();
	place = daoAjax.rentalCate(postId);
	// 	if (postId.equals("0")) {

	// 	}
	out.print("<option value = '0'>대여물품 카테고리를 선택하세요.</option>");
	for (int i = 0; i < place.size(); i++) {
		Rental rental = (Rental) place.get(i);
		out.print("<option value = '" + (i+1));
		out.print("'>" + rental.getCate() + " - " + rental.getModel() +"</option>");
	}
%>