<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<c:url value="/user" var="url" />
<c:url value="/admin" var="admin" />
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="row mt-3">

			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Thống kê loại hàng</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col"><span>Loại hàng</th>
										<th scope="col">Tổng giá</th>
										<th scope="col">Số sản phẩm</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="1" var="i" />
									<c:forEach items="${items}" var="item">
										<tr>
											<th scope="row">${i}</th>
											<td>${item.group.name}</td>
											<td><f:formatNumber value="${item.sum}"
													pattern="#,### ₫" /></td>
											<td>${item.count }</td>
										</tr>
										<c:set var="i" value="${i+1}" />
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Thống kê sản phẩm đã bán</h5>
						<div class="col-md-3"
							style="float: left; position: absolute; top: 10px; left: 350px">
							<form action="/admin/report">
								<select class="form-control valid" style="float: left;"
									class="col-md-8" aria-invalid="false" name="category">
									<c:forEach items="${cateList }" var="cate">
										<option value="${cate.id }">${cate.name }</option>
									</c:forEach>
								</select>
								<button class="col-md-3 btn btn-primary"
									style="position: absolute; left: 350px">Lọc</button>
							</form>

						</div>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col"><span>Tên mặt hàng</th>
										<th scope="col">Số lượng</th>
										<th scope="col">Giá</th>
										<th scope="col">Giảm giá</th>
										<th scope="col">Tổng tiền</th>
									</tr>
								</thead>
								<tbody>

									<c:set value="1" var="i" />
									<c:forEach items="${listob}" var="item">

										<c:choose>
											<c:when test="${item.group.category.id == category}">
													<tr>
														<th scope="row">${i}</th>
														<td>${item.group.name}</td>
														<td>${item.sum}</td>
														<td><f:formatNumber value="${item.group.price }"
																pattern="#,### vn₫" /></td>
														<td>${item.group.discount}%</td>
														<c:choose>
															<c:when test="${item.group.discount != 0}">
																<td><f:formatNumber
																		value="${item.group.price * item.sum * (1-(item.group.discount/100)) }"
																		pattern="#,### vn₫" /></td>
															</c:when>
															<c:otherwise>
																<td><f:formatNumber
																		value="${item.group.price * item.sum }"
																		pattern="#,### vn₫" /></td>
															</c:otherwise>
														</c:choose>

													</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<th scope="row">${i}</th>
													<td>${item.group.name}</td>
													<td>${item.sum}</td>
													<td><f:formatNumber value="${item.group.price }"
															pattern="#,### vn₫" /></td>
													<td>${item.group.discount}%</td>
													<c:choose>
														<c:when test="${item.group.discount != 0}">
															<td><f:formatNumber
																	value="${item.group.price * item.sum * (1-(item.group.discount/100)) }"
																	pattern="#,### vn₫" /></td>
														</c:when>
														<c:otherwise>
															<td><f:formatNumber
																	value="${item.group.price * item.sum }"
																	pattern="#,### vn₫" /></td>
														</c:otherwise>
													</c:choose>

												</tr>
											</c:otherwise>
										</c:choose>

										<c:set var="i" value="${i+1}" />
									</c:forEach>
									<tr>
										<th>Tổng doanh thu: <f:formatNumber
												value="${tongdoanhthu }" pattern="#,### vn₫" /></th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>