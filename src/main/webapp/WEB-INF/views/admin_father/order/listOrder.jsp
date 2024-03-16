<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="col-md-3"
					style="float: left; position: absolute; top: 10px; left: 0px">
					<form action="/admin/order">
						<input type="date" id="the-date" class="form-control" name="from" style="position: absolute; left: 30px"/>
						<input type="date" id="the-date" class="form-control" name="to" style="position: absolute; left: 400px"/>
						<button class="col-md-3 btn btn-primary"
							style="position: absolute; left: 780px">Lọc</button>
					</form>

				</div>
				<span class="btn btn-dark" style="float: right">${page.number+1}
					of ${page.totalPages}</span> <br> <br> <a
					href="/admin/order?${cate }field=${column}&t=${s > 0 ? 1:0 }&p=${page.totalPages-1 }"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px">|></a><a
					href="/admin/order?${cate}field=${column}&t=${s > 0 ? 1:0 }&p=${(page.number+1) > (page.totalPages -1) ? page.totalPages -1 : page.number+1}"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px">>></a> <a
					href="/admin/order?${cate}field=${column}&t=${s > 0 ? 1:0 }&p=${(page.number-1) < 0 ? 0 : page.number-1}"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px"><<</a> <a
					href="/admin/order?${cate}field=${column}&t=${s > 0 ? 1:0 }&p=0"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px"><|</a>

			</div>

			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách đơn hàng</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col"><a
											href="/admin/order?field=account.username&t=${s > 0 ? 0:1 }">Tài khoản User</a></th>
										<th scope="col"><a
											href="/admin/order?field=account.fullname&t=${s > 0 ? 0:1 }">Họ Tên</a></th>
										<th scope="col"><a
											href="/admin/order?field=account.email&t=${s > 0 ? 0:1 }">Email</a></th>
										<th scope="col">SĐT</th>
										<th scope="col"><a
											href="/admin/order?field=address&t=${s > 0 ? 0:1 }">Địa chỉ</a></th>
										<th scope="col">Ghi chú</th>
										<th scope="col"><a
											href="/admin/order?field=total&t=${s > 0 ? 0:1 }">Tổng tiền</a></th>
										<th scope="col">Phương thức thanh toán</th>
										<th scope="col">Trạng thái</th>
										<th scope="col"><a
											href="/admin/order?field=created&t=${s > 0 ? 0:1 }">Ngày
												tạo</a></th>
										<th scope="col">Hành động</th>

									</tr>
								</thead>
								<tbody>
									<c:set value="1" var="i" />
									<c:forEach items="${page.content}" var="pay">
										<tr>
											<td scope="row">${i }</td>
											<td>${pay.account.username }</td>
											<td>${pay.account.fullname }</td>
											<td>${pay.account.email }</td>
											<td>${pay.phone }</td>
											<td>${pay.address }</td>
											<td>${pay.message }</td>
											<td><f:formatNumber value="${pay.total}" pattern="#,###" />
												VNĐ</td>
											<td><c:choose>
													<c:when test="${pay.payment == 0}">
														<c:out value="COD" />
													</c:when>
													<c:otherwise>
														<c:out value="Thẻ nội địa ATM" />
													</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${pay.status.length()==15}">
														<c:out value="Chưa thanh toán" />
													</c:when>
													<c:otherwise>
														<c:out value="Đã thanh toán" />
													</c:otherwise>
												</c:choose></td>
											<td>${pay.created}</td>


											<td>
												<button class="btn btn-success">
													<a href="/admin/order/edit/${pay.id}">Xem chi tiết</a>
												</button>
											</td>
										</tr>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function deleteOrder(id) {
		if (confirm("Bạn muốn xóa đơn hàng có id " + id + " phải không?") == true) {
			window.location.href = "${admin}/order/delete/" + id;
		}
	}
</script>