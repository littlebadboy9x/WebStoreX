<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Chi tiết đơn hàng</h5>
						<span style="float: right;"> <c:set value="1" var="i" /> <c:forEach
								items="${listorderdetail}" var="orderdetail">
								<c:if test="${i == 1}">
									<button class="btn btn-success">
										<a href="/admin/order/edit/${orderdetail.pay.id}">Trở về</a>
									</button>
								</c:if>
								<c:set var="i" value="${i+1}" />
							</c:forEach>

						</span>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">ID Đơn Hàng</th>
										<th scope="col">ID Sản Phẩm</th>
										<th scope="col">Tên Sản Phẩm</th>
										<th scope="col">Giá</th>
										<th scope="col">Số lượng</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="1" var="i" />
									<c:forEach items="${listorderdetail}" var="orderdetail">
										<tr>
											<td scope="row">${i }</td>
											<td>${orderdetail.pay.id }</td>
											<td>${orderdetail.product.id }</td>
											<td>${orderdetail.product.name }</td>
											<td><f:formatNumber value="${orderdetail.product.price}"
													pattern="#,###" /> VNĐ</td>
											<td>${orderdetail.amount }</td>
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