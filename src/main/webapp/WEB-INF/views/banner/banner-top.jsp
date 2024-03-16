<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value = "/user" var="url"/>
<div class="ban-top">
	<div class="container">
		<div class="top_nav_left">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class="active menu__item menu__item--current"><a
								class="menu__link" href="${url}/home"> <i
									class="header-menu__item-icon fas fa-home"></i>
									<p class="header-menu__item-name">EVOS SHOP</p> <span
									class="sr-only">(current)</span>
							</a></li>
							<li class=" menu__item"><a class="menu__link"
								href="${url}/about"> <i
									class="header-menu__item-icon fas fa-info-circle"></i>
									<p class="header-menu__item-name">GIỚI THIỆU</p>
							</a></li>
							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false"> <i
									class="header-menu__item-icon fas fa-mobile-alt"
									style="margin-left: 20px;"></i>
									<p class="header-menu__item-name">ĐIỆN THOẠI</p> <span
									class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="agile_inner_drop_nav_info">
										<div class="col-sm-3 multi-gd-img1 multi-gd-text ">
											<a href="#"><img src="images/Ip13proMax.png"
												alt=" " /></a>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<span style="color: red; font-weight: bold;">Hãng sản
												xuất</span>
											<ul class="multi-column-dropdown">
												<li><a href="#">Apple</a></li>
												<li><a href="#">Samsung</a></li>
												<li><a href="#">Xiaomi</a></li>
												<li><a href="#">Oppo</a></li>
												<li><a href="#">Vivo</a></li>
												<li><a href="#">LG</a></li>
												<li><a href="#">OnePlus</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<br>
											<ul class="multi-column-dropdown">
												<li><a href="#">Asus</a></li>
												<li><a href="#">Vsmart</a></li>
												<li><a href="#">Nokia</a></li>
												<li><a href="#">Sony</a></li>
												<li><a href="#">Realme</a></li>
												<li><a href="#">Lenovo</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<span style="color: red; font-weight: bold;">Mức giá</span>
											<ul class="multi-column-dropdown">
												<li><a href="#">Dưới 1 triệu</a></li>
												<li><a href="#">Dưới 2 triệu</a></li>
												<li><a href="#">Dưới 3 triệu</a></li>
												<li><a href="#">Dưới 5 triệu</a></li>
												<li><a href="#">Dưới 8 triệu</a></li>
												<li><a href="#">Dưới 10 triệu</a></li>
												<li><a href="#">Trên 10 triệu</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
									<hr>
									<div class="text-center">
										<i class="fas fa-trophy"></i> <span
											style="color: red; font-weight: bold;">Xếp hạng điện
											thoại</span>
									</div>
								</ul></li>

							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false"> <i
									class="header-menu__item-icon fas fa-laptop"></i>
									<p class="header-menu__item-name">Laptop</p> <span
									class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="agile_inner_drop_nav_info">
										<div class="col-sm-3 multi-gd-img1 multi-gd-text ">
											<a href="#"><img src="images/laptop.jpg" alt=" " /></a>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<span style="color: red; font-weight: bold;">Hãng sản
												xuất</span>
											<ul class="multi-column-dropdown">
												<li><a href="#">MacBook</a></li>
												<li><a href="#">Asus</a></li>
												<li><a href="#">hp</a></li>
												<li><a href="#">Lenovo</a></li>
												<li><a href="#">Acer</a></li>
												<li><a href="#">DELL</a></li>
												<li><a href="#">LG</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<br>
											<ul class="multi-column-dropdown">
												<li><a href="#">GIGABYTE</a></li>
												<li><a href="#">Intel</a></li>
												<li><a href="#">itel</a></li>
												<li><a href="#">CHUWI</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<span style="color: red; font-weight: bold;">Mức giá</span>
											<ul class="multi-column-dropdown">
												<li><a href="#">Dưới 10 triệu</a></li>
												<li><a href="#">Dưới 15 triệu</a></li>
												<li><a href="#">Dưới 20 triệu</a></li>
												<li><a href="#">Dưới 30 triệu</a></li>
												<li><a href="#">Dưới 40 triệu</a></li>
												<li><a href="#">Dưới 50 triệu</a></li>
												<li><a href="#">Trên 50 triệu</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
									<hr>
									<div class="text-center">
										<i class="fas fa-trophy"></i> <span
											style="color: red; font-weight: bold;">Xếp hạng laptop</span>
									</div>
								</ul></li>

							<li class="dropdown menu__item"><a href="#"
								class="dropdown-toggle menu__link" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false"> <i
									class="header-menu__item-icon fas fa-tablet-alt"></i>
									<p class="header-menu__item-name">Tablet</p> <span
									class="caret"></span>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
									<div class="agile_inner_drop_nav_info">
										<div class="col-sm-3 multi-gd-img1 multi-gd-text ">
											<a href="#"><img src="images/tablet.jpg" alt=" " /></a>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<span style="color: red; font-weight: bold;">Hãng sản
												xuất</span>
											<ul class="multi-column-dropdown">
												<li><a href="#">iPad</a></li>
												<li><a href="#">Samsung</a></li>
												<li><a href="#">Xiaomi</a></li>
												<li><a href="#">Lenovo</a></li>
												<li><a href="#">Masstel</a></li>
												<li><a href="#">Nokia</a></li>
												<li><a href="#">Alcatel</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<br>
											<ul class="multi-column-dropdown">
												<li><a href="#">Acer</a></li>
												<li><a href="#">Sony</a></li>
											</ul>
										</div>
										<div class="col-sm-3 multi-gd-img">
											<span style="color: red; font-weight: bold;">Mức giá</span>
											<ul class="multi-column-dropdown">
												<li><a href="#">Dưới 10 triệu</a></li>
												<li><a href="#">Dưới 15 triệu</a></li>
												<li><a href="#">Dưới 20 triệu</a></li>
												<li><a href="#">Dưới 30 triệu</a></li>
												<li><a href="#">Dưới 40 triệu</a></li>
												<li><a href="#">Dưới 50 triệu</a></li>
												<li><a href="#">Trên 50 triệu</a></li>
											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
									<hr>
									<div class="text-center">
										<i class="fas fa-trophy"></i> <span
											style="color: red; font-weight: bold;">Xếp hạng tablet</span>
									</div>
								</ul></li>
							<li class="menu__item dropdown"><a class="menu__link"
								href="#" class="dropdown-toggle" data-toggle="dropdown"> <i
									class="header-menu__item-icon fas fa-headphones-alt"></i>
									<p class="header-menu__item-name">PHỤ KIỆN</p> <b class="caret"></b>
							</a>
								<ul class="dropdown-menu multi-column columns-3">
                                        <div class="agile_inner_drop_nav_info">
                                            <div class="col-sm-6 multi-gd-img1 multi-gd-text ">
                                                <a href="#"><img src="images/phukien.jpg" alt=" " /></a>
                                            </div>
                                            <div class="col-sm-3 multi-gd-img">
                                                <span style="color: red; font-weight: bold;">Loại phụ kiện</span>
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="#">Phụ kiện cho iPhone</a></li>

                                                    <li><a href="#">Tai nghe</a></li>
                                                    <li><a href="#">Đồng hồ thông minh</a></li>
                                                    <li><a href="#">Chuột máy tính</a></li>
                                                    <li><a href="#">Loa bluetooth</a></li>
                                                    <li><a href="#">Củ sạc và cap sạc</a></li>
                                                    <li><a href="#">Bàn phím máy tính</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-3 multi-gd-img">
                                                <br>
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="#">Phụ kiện cho samsung</a></li>
                                                    <li><a href="#">Pin sạc dự phòng</a></li>
                                                    <li><a href="#">Đồ chơi công nghệ</a></li>
                                                    <li><a href="#">Tay cầm chơi game</a></li>
                                                    <li><a href="#">Miếng lót chuột</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </ul></li>
							<li class=" menu__item"><a class="menu__link"
								href="${url}/news"> <i
									class="header-menu__item-icon fas fa-newspaper"></i>
									<p class="header-menu__item-name">TIN TỨC</p>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		 <div class="top_nav_right">
                <div class="wthreecartaits wthreecartaits2 cartcart cart box_1" style="height: 138px; ">
				<li class="menu__item"><a href="${url}/cart">
					<div class="w3view-cart" value="">
						<i class="fa fa-cart-arrow-down" aria-hidden="true"></i>
					</div>
				</a>
				<c:if test="${SLTGH !=null}">
					<div class="cart-amount">${SLTGH}</div>
				</c:if>
				</li>
			</div>
            </div>
		<div class="clearfix"></div>
	</div>
</div>