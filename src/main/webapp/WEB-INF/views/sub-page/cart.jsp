<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!-- /banner_bottom_agile_info -->
<div class="cart-bg">
	<div class="container">
		<h3>
			Giỏ<span>Hàng</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home">Evos Shop</a><i>|</i></li>
					<li>Giỏ Hàng</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>

<!-- Cart view section -->
<section id="cart-view">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="cart-view-area">
					<div class="cart-view-table">
						<form action="${url }/cart/update" method="post">
							<div class="table-responsive">
								<table
									class='table table-bordered border-secondary table-hover table-striped text-center'
									style="border: black; font-weight: bold;">
									<thead>
										<tr class="bg-secondary">
											<th>Bỏ chọn</th>
											<th>Mô tả</th>
											<th>Sản phẩm</th>
											<th>Giá</th>
											<th>Số lượng</th>
											<th>Giảm giá</th>
											<th>Thành Tiền</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list2}">
											<tr>
												<td><a class="remove" href="/user/cart/delete/${item.id}"><fa
															class="fa fa-close"></fa></a></td>
												<td><a href="#"><img
														src="${url}/images/${item.product.image}"
														alt="${item.product.name }"></a></td>
												<td><a class="aa-cart-title" href="#">${item.product.name}</a></td>
												<td><f:formatNumber value="${item.product.price}"
														pattern="#,###" /> VNĐ</td>
												<td><input class="aa-cart-quantity" type="number" onblur="this.form.submit()"
													name="${item.product.id}" value="${item.amount }" min=1></td>
												<td>${item.product.discount }%</td>
												<td><f:formatNumber
														value="${item.product.price*(1-(item.product.discount)/100)*item.amount}"
														pattern="#,###" /> VNĐ</td>
												
											</tr>
										</c:forEach>
										<tr>
											<td colspan="6" class=""><strong>TỔNG TIỀN</strong></td>
											<td><strong><f:formatNumber value="${TT}"
														pattern="#,###" /> VNĐ</strong></td>
										</tr>
										<tr>
											<td colspan="7" class="aa-cart-view-bottom"><input
												class="aa-cart-view-btn" type="submit"
												value="Cập nhật giỏ hàng" id="cn"></td>
										</tr>

									</tbody>
								</table>
							</div>
						</form>
						<!-- Cart Total view -->
						<div class="cart-view-total">
							<h4>Thông tin giỏ hàng</h4>
							<table class="aa-totals-table">
								<tbody>
									<tr>
										<th>Tạm tính</th>
										<td><f:formatNumber value="${TT}" pattern="#,###" /> VNĐ</td>
									</tr>
									<tr>
										<th>VAT</th>
										<td>0 VNĐ</td>
									</tr>
									<tr>
										<th>Tổng cộng</th>
										<td><strong><f:formatNumber value="${TT}"
													pattern="#,###" /> VNĐ</strong></td>
									</tr>
								</tbody>
							</table>
							<a href="${url}/cart/checkout" class="aa-cart-view-btn">Thanh
								toán</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- / Cart view section -->
<div class="clearfix"></div>
<!-- / Cart view section -->


