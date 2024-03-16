<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="row">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a href="/admin/new/create">Thêm tin tức</a>
				</button>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách tin tức</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Tiêu đề</th>
										<th scope="col">Hình ảnh</th>
										<th scope="col">Người đăng</th>
										<th scope="col">Ngày đăng</th>
										<th scope="col">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="1" var="i" />
									<c:forEach items="${listNew}" var="n">
										<tr>
											<td scope="row">${i}</td>
											<td>
												${n.title}
											</td>
											<td><img
												style="width: 110px; height: 67px; object-fit: cover; border: 1px solid #fff;"
												src="/user/images/${n.image }"></td>
											<td>${n.account.fullname }</td>
											<td>${n.created }</td>
											<td>
												<button class="btn btn-danger">
													<a href="javascript:deleteNew('${n.id }')">Xóa</a>
												</button>

												<button class="btn btn-success">
													<a href="/admin/new/edit/${n.id}">Sửa</a>
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
	function deleteNew(id) {
		if (confirm("Bạn muốn xóa tin tức có " + id
				+ " phải không?") == true) {
			window.location.href = "/admin/new/delete/" + id;
		}
	}
</script>