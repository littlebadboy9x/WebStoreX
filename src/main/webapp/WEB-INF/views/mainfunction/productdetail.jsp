<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!-- /banner_bottom_agile_info -->
<div class="prddetail-bg">
	<div class="container">
		<h3>
			CHI TIẾT <span>SẢN PHẨM</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home">Evos Shop</a><i>|</i></li>
					<li>Sản Phẩm</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>

<!-- banner-bootom-w3-agileits -->
<div class="banner-bootom-w3-agileits">
	<div class="container">
		<div class="col-md-4 single-right-left ">
			<div class="grid images_3_of_2">
				<div class="flexslider">

					<div data-thumb="/user/images/${pd.image }">
						<div class="thumb-image">
							<img src="/user/images/${pd.image }" data-imagezoom="true"
								class="img-responsive">
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="col-md-8 single-right-left simpleCart_shelfItem">
			<h3>${pd.name }</h3>
			<c:choose>
				<c:when test="${pd.discount == 0}">
					<p>
						<span class="item_price"><f:formatNumber
								value="${pd.price}" pattern="#,###₫" /></span>
					</p>
				</c:when>
				<c:otherwise>
					<p>
						<span class="item_price"><f:formatNumber
								value="${pd.price*(1-(pd.discount/100))}" pattern="#,###₫" /></span>
						<del>
							<f:formatNumber value="${pd.price}" pattern="#,###₫" />
						</del>
					</p>
				</c:otherwise>
			</c:choose>
			<c:forEach items="${listob }" var="item">
				<c:if test="${item.group.id == pd.id}">
									Đã bán: <span style="color: red; font-weight: bold;">
						${item.sum}</span> sản phẩm
				</c:if>
			</c:forEach>
			<div class="rating1">
				<span class="starRating"> <input id="rating5" type="radio"
					name="rating" value="5"> <label for="rating5">5</label> <input
					id="rating4" type="radio" name="rating" value="4"> <label
					for="rating4">4</label> <input id="rating3" type="radio"
					name="rating" value="3" checked=""> <label for="rating3">3</label>
					<input id="rating2" type="radio" name="rating" value="2"> <label
					for="rating2">2</label> <input id="rating1" type="radio"
					name="rating" value="1"> <label for="rating1">1</label>
				</span>
			</div>
			<div>
				<div>${pd.content }</div>
				<div>
					<b>Tình trạng:</b> ${pd.avaliable?'còn hàng':'đã bán hết' }
				</div>
				<div>
					<b>Danh mục:</b> <span style="color: #2fdab8">
						${pd.category.name }</span>
				</div>
			</div>
			<form action="${url}/add/cart/product/${pd.id}" method="post">
				<div class="color-quality">
					<div class="color-quality-right">
						<h5>
							<b>Quality :</b>
						</h5>
						<input type="number" class="form-control" min="1" step="1"
							value="${gia }" name="quality">
					</div>
				</div>
				<div class="occasion-cart">
					<div
						class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">

						<input type="submit" name="submit" value="Thêm giỏ hàng"
							class="button">

					</div>

				</div>
			</form>
			<ul
				class="social-nav model-3d-0 footer-social w3_agile_social single_page_w3ls">
				<li class="share">Chia sẻ với:</li>
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
		<div class="clearfix"></div>
		<!-- /new_arrivals -->
		<div class="responsive_tabs_agileits">
			<div id="horizontalTab">
				<ul class="resp-tabs-list">
					<li>Mô tả</li>
					<li>Đánh giá sản phẩm</li>
					<li>Thông tin cấu hình</li>
				</ul>
				<div class="resp-tabs-container">
					<!--/tab_one-->
					<div class="tab1">

						<div class="single_page_agile_its_w3ls">
							<h6>${pd.name }</h6>
							<p class="w3ls_para">.</p>
						</div>
					</div>
					<!--//tab_one-->
					<div class="tab2">

						<div class="single_page_agile_its_w3ls">
							<div class="bootstrap-tab-text-grids">
								<div class="bootstrap-tab-text-grid">
									<c:forEach var="rv" items="${listrv}">
										<div class="bootstrap-tab-text-grid-left">
											<img src="/user/images/${rv.account.photo}" width="130px"
												height="108px" style="object-fit: cover;"
												alt="${rv.account.photo}">
										</div>
										<div class="aa-product-review-area">
											<ul class="aa-review-nav">
												<li>
													<div class="media"
														style="border: solid 1px #ccc; padding: 10px;">
														<div class="media-body">
															<h4 class="media-heading">
																<strong>${rv.account.fullname}</strong> - <span>${rv.created}</span>
															</h4>
															<div class="aa-product-rating" style="color: #ff6600;">
																<span class="fa fa-star"></span> <span
																	class="fa fa-star"></span> <span class="fa fa-star"></span>
																<span class="fa fa-star"></span> <span
																	class="fa fa-star"></span>
															</div>
															<p style="font-family: monospace; font-size: 18px">${rv.content }</p>
														</div>
													</div>

												</li>

											</ul>
										</div>
										<br>
									</c:forEach>
									<h3>
										<b>Thêm đánh giá</b>
									</h3>
									<br>
									<!-- review form -->
									<form action="/user/review/create" method="post"
										class="aa-review-form">
										<div class="form-group">
											<label for="name">Tên</label> <input type="text"
												style="font-size: 20px" class="form-control" id="name"
												value="${sessionScope.user.fullname }" placeholder="Họ tên?"
												name="name">
										</div>
										<div class="form-group">
											<label for="email">Email</label> <input type="email"
												style="font-size: 20px" class="form-control" id="email"
												value="${sessionScope.user.email }" placeholder="Email?"
												name="email">
										</div>
										<div class="form-group">
											<label for="message">Đánh giá của bạn</label>
											<textarea class="form-control" rows="3" id="content"
												style="font-size: 20px" name="content"></textarea>
										</div>
										<input type="hidden" name="prdid" value="${pd.id}" />
										<button type="submit" class="btn btn-info aa-review-submit">Gửi</button>
									</form>
								</div>
							</div>

						</div>
					</div>
					<div class="tab3">
						<c:if test="${cf!=null }">
							<div class="single_page_agile_its_w3ls">
								<h6>${cf.product.name }</h6>
								<p class="w3ls_para" style="width: 150px">
								<div class="btn btn-primary col-md-5" style="float: left;">Màn
									hình: ${cf.manhinh}</div>
								<div class="btn btn-primary col-md-6" style="float: right;">Hệ
									điều hành: ${cf.hedieuhanh}</div>
								<br> <br>
								<div class="btn btn-warning col-md-5" style="float: left;">Camera
									sau: ${cf.camerasau}</div>
								<div class="btn btn-warning col-md-6" style="float: right;">Camera
									trước: ${cf.cameratruoc}</div>
								<br> <br>
								<div class="btn btn-primary col-md-5" style="float: left;">Chip:
									${cf.chip}</div>
								<div class="btn btn-primary col-md-6" style="float: right;">RAM:
									${cf.ram}</div>
								<br> <br>
								<div class="btn btn-warning  col-md-5" style="float: left;">Bộ
									nhớ trong: ${cf.bonhotrong}</div>
								<div class="btn btn-warning col-md-6" style="float: right;">SIM:
									${cf.sim}</div>
								<br> <br>
								<div class="btn btn-primary col-md-5" style="float: left;">Hỗ
									trợ 5G: ${cf.hotro5g?'Có':'Không' }</div>
								<div class="btn btn-primary col-md-6" style="float: right;">Pin,
									Sạc: ${cf.pin_sac}</div>
								<br> <br>
								</p>
							</div>
						</c:if>
						<c:if test="${cf==null }">
							<div class="single_page_agile_its_w3ls">
								<p>
									<span>Chưa cập nhật được cấu hình!</span>
								</p>
							</div>
						</c:if>

					</div>
				</div>
			</div>
		</div>
		<!-- //new_arrivals -->
		<!--/slider_owl-->

		<div class="w3_agile_latest_arrivals">
			<h3 class="wthree_text_info">
				Sản Phẩm <span>Liên Quan</span>
			</h3>
			<%@include file="productCorrelative.jsp"%>
		</div>
	</div>
	<!--  -->
</div>
<!--//single_page-->