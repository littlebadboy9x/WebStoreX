<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value = "/user" var="url"/>
<div class="footer">
	<div class="footer_agile_inner_info_w3l">
		<div class="col-md-3 footer-left">
			<h2>
				<a href="${url}/home"><span>E</span>Evos Shop </a>
			</h2>
			<p>là một cửa hàng chuyên bán các mặt liên quan đến sản phẩm công
				nghệ khá có danh tiếng tại TP Cần Thơ.</p>
			<ul class="social-nav model-3d-0 footer-social w3_agile_social two">
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
		</div>
		<div class="col-md-9 footer-right">
			<div class="sign-grds">
				<div class="col-md-4 sign-gd">
					<h4>
						Danh<span> Mục</span>
					</h4>
					<ul>
						<li><a href="${url}/home">Evos Shop</a></li>
						<li><a href="${url}/about">Giới thiệu</a></li>
						<li><a href="#">Điện thoại</a></li>
						<li><a href="#">Laptop</a></li>
						<li><a href="#">Tablet</a></li>
						<li><a href="#">Phụ kiện</a></li>
						<li><a href="${url}/news">Tin tức</a></li>
					</ul>
				</div>

				<div class="col-md-5 sign-gd-two">
					<h4>
						Thông tin<span> thêm</span>
					</h4>
					<div class="w3-address">
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-phone" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Sđt:</h6>
								<p>0288008888</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Địa chỉ email:</h6>
								<p>
									Email :<a href="mailto:tienbmps15611@fpt.edu.vn">tienbmps15611@fpt.edu.vn</a>
								</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="w3-address-grid">
							<div class="w3-address-left">
								<i class="fa fa-map-marker" aria-hidden="true"></i>
							</div>
							<div class="w3-address-right">
								<h6>Địa chỉ:</h6>
								<p>Tòa nhà Cao đẳng FPT</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 sign-gd flickr-post">
					<h4>
						Review <span>Người Dùng</span>
					</h4>
					<ul>
						<li><a href="#"><img src="${url}/images/t1.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t5.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t4.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t9.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t11.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t10.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t7.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t6.jpg" alt=" "
								class="img-responsive" /></a></li>
						<li><a href="#"><img src="${url}/images/t8.jpg" alt=" "
								class="img-responsive" /></a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="agile_newsletter_footer">
			<div class="col-sm-6 newsleft">
				<h3>ĐĂNG KÝ ĐỂ NHẬN THÊM THÔNG TIN !</h3>
			</div>
			<div class="col-sm-6 newsright">
				<form action="#" method="post">
					<input type="email" placeholder="Nhập email của bạn..."
						name="email" required=""> <input type="submit" value="Gửi">
				</form>
			</div>

			<div class="clearfix"></div>
		</div>
		<p class="copy-right">
			&copy2023. Evos Shop</a>
		</p>
	</div>
</div>