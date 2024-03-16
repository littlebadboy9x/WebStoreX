<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="url" value="/admin"/>
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<!--End Row-->
		<div class="row">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a href="${url }/category/create">Thêm danh mục</a>
				</button>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách danh mục</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Id danh mục</th>
										<th scope="col">Tên danh mục</th>
										<th scope="col">Hành động</th>

									</tr>
								</thead>
								<tbody>
									<c:set value="1" var="i" />
									<c:forEach items="${listcate}" var="cate">
										<tr>
											<td>${i}</td>
											<td>${cate.id}</td>
											<td>${cate.name}</td>
											<td>
												<button class="btn btn-danger">
													<a href="javascript:deleteUser('${cate.id}')">Xóa</a>
												</button>

												<button class="btn btn-success">
													<a href="${url}/category/edit/${cate.id}">Sửa</a>
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
	function deleteUser(id) {
		if (confirm("Bạn muốn xóa id danh mục " + id + " phải không?") == true) {
			window.location.href = "${url}/category/delete/" + id;
		}
	}
</script>
