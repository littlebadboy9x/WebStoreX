<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<c:url value="/user" var="url" />
<!-- /banner_bottom_agile_info -->
<div class="checkout-bg">
	<div class="container">
		<h3 style="color: black;">
			Thanh<span style="color: black; font-weight: bold;"> Toán</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home"
						style="font-weight: bold; font-size: 20px">Evos Shop</a><i>|</i></li>
					<li style="color: black;">Thông tin thanh toán</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>

<!-- Cart view section -->
<section id="checkout">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="checkout-area">
					<form action="/user/cart/checkout" method="post">
						<div class="row">
							<div class="col-md-8">
								<div class="checkout-left">
									<div class="panel-group">
										<!-- Shipping Address -->
										<div class="panel panel-default aa-checkout-billaddress">
											<div class="panel-heading">
												<h4 class="panel-title" style="color: #754110">Địa chỉ
													giao hàng</h4>
											</div>
											<div id="collapseFour">
												<div class="panel-body">
													<div class="row">
														<div class="col-md-12">
															<div class="aa-checkout-single-bill">
																<input type="text" value="${sessionScope.user.fullname}"
																	name="fullname" disabled="disabled">
															</div>
														</div>

													</div>

													<div class="row">
														<div class="col-md-6">
															<div class="aa-checkout-single-bill">
																<input type="email" value="${sessionScope.user.email}"
																	 name="email" disabled="disabled">
															</div>
														</div>
														<div class="col-md-6">
															<div class="aa-checkout-single-bill">
																<input type="number" placeholder="Số điện thoại*"
																	required="required" name="phone" min="0">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="aa-checkout-single-bill">
																<textarea cols="8" rows="3" required="required"
																	placeholder="Địa chỉ*" name="address"></textarea>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12">
															<div class="aa-checkout-single-bill">
																<textarea cols="8" rows="3" placeholder="Ghi chú"
																	name="message"></textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="checkout-right">
									<h4>Thông tin đơn hàng</h4>
									<div class="aa-order-summary-area">
										<table class="table table-responsive">
											<thead>
												<tr>
													<th>Sản phẩm</th>
													<th>Số tiền</th>
												</tr>
											</thead>
											<tbody>

											</tbody>
											<tfoot>
												<tr>
													<th>Tạm tính</th>
													<td><f:formatNumber value="${TT}" pattern="#,###" />VNĐ</td>
												</tr>
												<tr>
													<th>Thuế</th>
													<td>0 VNĐ</td>
												</tr>
												<tr>
													<th>Tổng cộng</th>
													<td><strong><f:formatNumber value="${TT}"
																pattern="#,###" /> VNĐ</strong></td>
												</tr>
											</tfoot>
										</table>
									</div>
									<h4>Hình thức thanh toán</h4>
									<div class="aa-payment-method">
										<label for="cashdelivery"><input type="radio"
											id="cashdelivery" name="payment" checked value="0">
											Thanh toán khi nhận hàng (COD) </label> <label for="paypal"><input
											type="radio" id="paypal" name="payment" value="1">
											Thanh toán bằng thể ngân hàng (ATM) </label> <img
											src="${url}/images/paypal.jpg" border="0"
											alt="PayPal Acceptance Mark"> <input type="submit"
											value="Đặt hàng" class="aa-browse-btn" id="tt">
									</div>
									<c:if test="${sessionScope.user != null && SLTGH == 0}">
										<br>
										<p style="color: red; font-weight: bold; font-size: 20px">${message}</p>
									</c:if>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="clearfix"></div>
<!-- / Cart view section -->


