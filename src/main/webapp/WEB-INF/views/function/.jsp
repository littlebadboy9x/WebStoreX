<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<!-- Modal content-->
<div class="losi-bg">
	<div class="container">
		<h3>
			Đăng Kí<span> Tài Khoản</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home">Tech Shop</a><i>|</i></li>
					<li>Đăng Kí Tài Khoản</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>
<div class="container">
	<div class="dang-nhap">
		<mark style="color: red;
		font-weight: bold; background: pink;">${param.message}</mark><br> <br>
		<div class="modal-content">
			<div class="modal-body modal-body-sub_agile">
				<div class="col-md-8 modal_body_left modal_body_left1">
					<h3 class="agileinfo_sign">
						Đăng Kí <span>Thành Viên</span>
					</h3>
					<form action="#" method="post">
						<div class="styled-input agile-styled-input-top">
							<input type="text" name="Name" required=""> <label>Tên
								đăng nhập</label> <span></span>
						</div>
						<div class="styled-input">
							<input type="email" name="Email" required=""> <label>Email</label>
							<span></span>
						</div>
						<div class="styled-input">
							<input type="password" name="password" required=""> <label>Mật
								khẩu</label> <span></span>
						</div>
						<div class="styled-input">
							<input type="password" name="Confirm Password" required="">
							<label>Nhập lại mật khẩu</label> <span></span>
						</div>
						<input type="submit" value="Đăng kí">
					</form>
					<ul
						class="social-nav model-3d-0 footer-social w3_agile_social top_agile_third">
						<li><a href="#" class="facebook">
								<div class="front">
									<i class="fa fa-facebook" aria-hidden="true"></i>
								</div>
								<div class="back">
									<i class="fa fa-facebook" aria-hidden="true"></i>
								</div>
						</a></li>
						<li><a href="#" class="twitter">
								<div class="front">
									<i class="fa fa-twitter" aria-hidden="true"></i>
								</div>
								<div class="back">
									<i class="fa fa-twitter" aria-hidden="true"></i>
								</div>
						</a></li>
						<li><a href="#" class="instagram">
								<div class="front">
									<i class="fa fa-instagram" aria-hidden="true"></i>
								</div>
								<div class="back">
									<i class="fa fa-instagram" aria-hidden="true"></i>
								</div>
						</a></li>
						<li><a href="#" class="pinterest">
								<div class="front">
									<i class="fa fa-linkedin" aria-hidden="true"></i>
								</div>
								<div class="back">
									<i class="fa fa-linkedin" aria-hidden="true"></i>
								</div>
						</a></li>
					</ul>
					<div class="clearfix"></div>
					<p>
						<a href="#">Bằng cách nhấp vào đăng ký, bạn đồng ý với các
							điều khoản của chúng tôi.</a>
					</p>

				</div>
				<div class="col-md-4 modal_body_right modal_body_right1">
					<img src="${url}/images/beatiful.jpg" alt=" " />
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