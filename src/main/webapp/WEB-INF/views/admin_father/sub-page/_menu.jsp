	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>--%>
<c:url value="/admin" var="url" />
<div id="sidebar-wrapper" data-simplebar=""
	data-simplebar-auto-hide="true">
	<div class="brand-logo">
		<a href="${url}/home"> <img src="${url}/images/Logo_TechShop.jpg"
			class="logo-icon" alt="logo icon">
			<h5 class="logo-text">Admin Evos Shop</h5>
		</a>
	</div>
	<ul class="sidebar-menu do-nicescrol">
		<li class="sidebar-header">MENU ADMIN</li>
		<li><a href="${url}/home"> <i
				class="zmdi zmdi-view-dashboard"></i> <span>Tổng quan</span>
		</a></li>

		<li><a href="${url}/admin/list"> <i
				class="zmdi zmdi-account-box"></i> <span>Quản lí Admin</span>
		</a></li>
		<li><a href="${url}/user/list"> <i class="zmdi zmdi-accounts"></i>
				<span>Quản lí User</span>
		</a></li>
		<li><a href="${url}/category"> <i class="zmdi zmdi-grid"></i>
				<span>Danh Mục</span>
		</a></li>
		<li><a href="${url}/product"> <i class="zmdi zmdi-widgets"></i>
				<span>Danh Sách Sản Phẩm</span>
		</a></li>
		<li><a href="${url}/order"> <i
				class="zmdi zmdi-shopping-cart"></i> <span>Đơn Hàng</span>
		</a></li>
		<li><a href="${url}/review"> <i
				class="zmdi zmdi-calendar-check"></i> <span>Review</span>
		</a></li>
		<li><a href="${url}/new"> <i class="icon-envelope-open"></i>
				<span>Tin tức</span>
		</a></li>
		<li><a href="${url}/report"> <i class="fa fa-bar-chart"
				aria-hidden="true"></i> <span>Thống kê</span>
		</a></li>
	</ul>
</div>