<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<div class="new_arrivals_agile_w3ls_info" style="margin-top: 60px;">
	<div class="container">
		<h3 class="wthree_text_info">
			Sản<span>Phẩm</span>
		</h3>

		<div id="horizontalTab">
			<ul class="resp-tabs-list">
				<li><i class="header-menu__item-icon fas fa-mobile-alt"
					style="margin-left: 20px;"></i> ĐIỆN THOẠI</li>
				<li><i class="header-menu__item-icon fas fa-laptop"></i> Laptop</li>
				<li><i class="header-menu__item-icon fas fa-tablet-alt"></i>
					Tablet</li>
				<li><i class="header-menu__item-icon fas fa-headphones-alt"></i>
					Phụ Kiện</li>
			</ul>
			<div class="resp-tabs-container">
				<%@include file="product/phone.jsp"%>
				<%@include file="product/laptop.jsp"%>
				<%@include file="product/tablet.jsp"%>
				<%@include file="product/headphones.jsp"%>
			</div>
		</div>
	</div>
</div>