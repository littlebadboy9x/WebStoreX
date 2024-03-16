<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/user" var="url" />
<div class="losi-bg">
	<div class="container">
		<h3>
			Quên<span> Mật Khẩu</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home">Evos Shop</a><i>|</i></li>
					<li>Quên Mật Khẩu</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>
<br />
<div class="container">
	<div class="dang-nhap">
		<mark style="color: red; font-weight: bold; background: pink;">${message}</mark> <br> <br>
		<div class="modal-content">
			<div class="modal-body modal-body-sub_agile">
				<div class="col-md-8 modal_body_left modal_body_left1">
					<h3 class="agileinfo_sign">
						Quên <span>Mật Khẩu</span>
					</h3>
					<form action="/user/account/forgot" method="post" >
						<div class="styled-input agile-styled-input-top">
							<input type="text" name="username" required="required"/> <label>Tên đăng nhập</label>
							<span></span>
						</div>
						<div class="styled-input agile-styled-input-top">
							<input type="email" name="email" required="required" /> <label>Email</label>
							<span></span>
						</div>
						<input type="submit" value="Lấy Lại Mật Khẩu">
					</form>
					<div class="clearfix"></div>

				</div>
				<div class="col-md-4 modal_body_right modal_body_right1">
					<img src="${url}/images/beatiful.jpg" alt="" />
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<br />
<br />

<style>
.dang-nhap {
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}
</style>