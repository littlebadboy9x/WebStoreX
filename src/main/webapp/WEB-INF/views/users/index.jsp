<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url value="/user" var="url" />
<!DOCTYPE html>
<html>
<head>
<%@include file="../confix/link_css_js.jsp"%>
<style type="text/css">
textarea {
	resize: vertical;
	height: 100px !important;
}
</style>
</head>

<body>
	<!-- Loading -->
	<tiles:insertAttribute name="loading" />
	<!-- Loading -->
	<!-- header -->
	<tiles:insertAttribute name="header" />
	<!-- //header -->
	<!-- menu_banner -->
	<%@include file="../banner/_menu.jsp"%>
	<!-- //menu_banner -->
	<%@include file="../filter/_filter.jsp"%>

	<!--Phần nạp trang-->
	<tiles:insertAttribute name="body" />
	<!--end Phần nạp trang-->

	<%@include file="../banner/banner-bot.jsp"%>

	<!-- footer -->
	<tiles:insertAttribute name="footer" />
	<!-- //footer -->

	<!-- js-footer -->
	<tiles:insertAttribute name="script" />
	<!-- //js-footer -->
</body>
</html>