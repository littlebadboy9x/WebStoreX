<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- Start header section -->
<c:url value="/admin" var="url" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Evos Shop</title>
<%@include file="sub-page/header/link_js_css.jsp"%>
</head>

<body class="bg-theme bg-theme1">
	<!-- Loading -->
	<tiles:insertAttribute name="loading" />
	<!-- Loading -->
	<!-- start loader -->
	<div id="wrapper">
		<tiles:insertAttribute name="menu" />
		<!-- //header -->
		<!-- header -->
		<tiles:insertAttribute name="header" />
		<!-- //header -->

		<!--Phần nạp trang-->
		<tiles:insertAttribute name="body" />
		<!--end Phần nạp trang-->

		<!-- footer -->
		<tiles:insertAttribute name="footer" />
		<!-- //footer -->

		<!-- js-footer -->
		<tiles:insertAttribute name="script" />
		<!-- //js-footer -->
	</div>
</body>
</html>