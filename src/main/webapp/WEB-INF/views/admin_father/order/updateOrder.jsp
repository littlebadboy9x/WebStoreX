<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">Cập nhật đơn hàng</div>
						<span style="float: right; background: blue; color: white"
							class="alert alert-primary">${message1 }</span> <span
							style="float: right; background: blue; color: red"
							class="alert alert-danger">${message2 }</span>
						<hr>
						<form:form method="post" action="/admin/order/update/${id}"
							modelAttribute="ord">

							<div class="form-group">
								<form:label for="id" path="id">Mã đơn hàng</form:label>
								<form:input path="id" type="text" class="form-control"
									readonly="true" id="id" placeholder="Mã sản phẩm" />
							</div>

							<div class="form-group">
								<form:label for="account.fullname" path="account.fullname">Tên khách hàng</form:label>
								<form:input type="text" class="form-control" readonly="true"
									path="account.fullname" />
							</div>

							<div class="form-group">
								<form:label for="account.address" path="account.email">Email</form:label>
								<form:input type="text" class="form-control" readonly="true"
									id="account.address" path="account.email" />
							</div>

							<div class="form-group">
								<form:label for="phone" path="phone">Số điện thoại</form:label>
								<form:input type="text" class="form-control" id="phone"
									readonly="true" path="phone" />
							</div>


							<div class="form-group">
								<form:label for="address" path="address" class="col-form-label">Địa chỉ</form:label>
								<div>
									<form:textarea class="form-control" rows="4" id="address"
										readonly="true" required="required" path="address"></form:textarea>
								</div>
							</div>
							<div class="form:form-group">
								<form:label for="message" class="col-form-label" path="message">Ghi chú</form:label>
								<div>
									<form:textarea path="message" class="form-control" rows="4"
										readonly="true" id="message" name="order-mess"></form:textarea>
								</div>
							</div>

							<div class="form-group">
								<form:label for="total" path="total">Tổng tiền</form:label>
								<form:input type="text" path="total" name="path"
									value="${total}" readonly="true" class="form-control"
									id="total" />
							</div>
							<form:hidden path="payment"/>
							<div class="form-group">
								<label for="input">Phương thức thanh toán</label>
								<div>
									<form:select path="payment" class="form-control valid" disabled="true"
										id="input" aria-invalid="true">
										<form:option value="1" >Thẻ nội địa ATM</form:option>
										<form:option value="0">COD</form:option>
									</form:select>
								</div>
							</div>
							
							<div class="form:form-group">
								<form:label for="payment" path="payment">Trạng thái</form:label>
								<div>
									<form:select class="form-control valid" path="status"
										id="status" aria-invalid="false">
										<form:option value="Đã thanh toán">Đã thanh toán</form:option>
										<form:option value="Chưa thanh toán">Chưa
											thanh toán</form:option>
									</form:select>
								</div>
							</div>
							<br>
							<br>
							<form:input path="account.username" type="hidden" />
							<form:input path="created" class="form-control" type="hidden" />
							<div class="form-footer">
								<button class="btn btn-danger">
									<a href="/admin/order">Hủy</a>
								</button>

								<button type="submit" class="btn btn-success">Cập nhật</button>

								<button class="btn btn-dark">
									<a href="/admin/order/detail/${id}">Xem danh sách sản phẩm</a>
								</button>
							</div>

						</form:form>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>