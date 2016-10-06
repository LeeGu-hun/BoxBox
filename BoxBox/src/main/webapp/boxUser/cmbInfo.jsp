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
	String rentalInfo= request.getParameter("cmbRental").split(" - ")[1];
	System.out.println(rentalInfo);
	List info= new ArrayList();
	info = daoAjax.rentalInfo(rentalInfo);
	// 	if (postId.equals("0")) {

	// 	}
	out.print("<option value = '0'>대여물품을 선택하세요.</option>");
	for (int i = 0; i < info.size(); i++) {
		Rental rental = (Rental) info.get(i);
		out.print("<option value = '" + (i+1));
		out.print("'>" + rental.getInfo()+"</option>");
	}
%>