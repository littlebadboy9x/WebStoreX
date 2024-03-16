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
					<li><a href="${url}/home">Evos Shop</a><i>|</i></li>
					<li>Đăng Kí Tài Khoản</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>
<div class="container">
	<div class="dang-nhap">
		<mark style="color: red; font-weight: bold; background: pink;">${message}</mark>
		<br> <br>
		<div class="modal-content">
			<div class="modal-body modal-body-sub_agile">
				<div class="col-md-8 modal_body_left modal_body_left1">
					<h3 class="agileinfo_sign">
						Đăng Kí <span>Thành Viên</span>
					</h3>
					<form action="/user/account/sign-up" method="post"
						enctype="multipart/form-data">
						<div class="styled-input agile-styled-input-top">
							<input type="text" name="username" required="required"> <label>Tên
								đăng nhập</label> <span></span>
						</div>
						<div class="styled-input">
							<input type="text" name="fullname" required="required"> <label>Họ
								tên</label> <span></span>
						</div>
						<div class="styled-input">
							<input type="email" name="email" required="required"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
								title="Email không hợp lệ"> <label>Email</label> <span></span>
						</div>

						<div class="styled-input">
							<input type="password" name="password" required="required"
								pattern=".{6,}" title="Họ tên phải từ 6 ký tự trở lên">
							<label>Mật khẩu</label> <span></span>
						</div>
						<input name="attach" id="attach" class="form-control"
							required="required" type="file" /> <br> <input
							type="submit" value="Đăng kí">
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
					<label> <img src="${url}/images/${filename}"
						alt="${filename}" width="140px" height="160px"
						style="object-fit: cover" />
					</label>
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