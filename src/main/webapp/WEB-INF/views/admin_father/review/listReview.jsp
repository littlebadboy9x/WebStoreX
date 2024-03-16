<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách Review</h5>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Tên</th>
									<th scope="col">Email</th>
									<th scope="col">Tên Sản Phẩm</th>
									<th scope="col">Nội dung</th>
									<th scope="col">Ngày đánh giá</th>
									<th scope="col">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:set value="1" var="i" />
								<c:forEach items="${listReview}" var="r">
									<tr>
										<td scope="row">${i }</td>
										<td>${r.account.username}</td>
										<td>${r.account.email }</td>
										<td>${r.product.name }</td>
										<td>${r.content }</td>
										<td>${r.created }</td>
										<td>
											<button class="btn btn-danger">
												<a href="javascript:deleteReview('${r.id}')">Xóa</a>
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
<script>
	function deleteReview(id) {
		if (confirm("Bạn muốn xóa review có " + id
				+ " phải không?") == true) {
			window.location.href = "/admin/review/delete/" + id;
		}
	}
</script>