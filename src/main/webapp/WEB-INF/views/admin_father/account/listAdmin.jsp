<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="url" value="/admin" />
<title>Danh Sách Admin</title>
<div class="clearfix"></div>
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<button class="add-catalog">
					<a href="/admin/admin/create">Thêm Admin</a>
				</button>
				<div class="col-md-3"
					style="float: left; position: absolute; top: 10px; left: 350px">
					<form action="/admin/admin/list">
						<input type="text" name="fullname" class="form-control valid"
							style="float: left;" class="col-md-8" aria-invalid="false"
							placeholder="Họ tên muốn tìm..." ]>
						<button class="col-md-3 btn btn-primary"
							style="position: absolute; left: 350px">Lọc</button>
					</form>

				</div>
				<span class="btn btn-dark" style="float: right">${page.number+1}
					of ${page.totalPages}</span> <br> <br> <a
					href="/admin/admin/list?${fullname}field=${column}&t=${s > 0 ? 1:0 }&p=${page.totalPages-1 }"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px">|></a><a
					href="/admin/admin/list?${fullname}field=${column}&t=${s > 0 ? 1:0 }&p=${(page.number+1) > (page.totalPages -1) ? page.totalPages -1 : page.number+1}"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px">>></a> <a
					href="/admin/admin/list?${fullname}field=${column}&t=${s > 0 ? 1:0 }&p=${(page.number-1) < 0 ? 0 : page.number-1}"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px"><<</a> <a
					href="/admin/admin/list?${fullname}field=${column}&t=${s > 0 ? 1:0 }&p=0"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px"><|</a>

			</div>
		</div>
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách Admin</h5>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col"><a
										href="/admin/admin/list?${cate}field=username&t=${s > 0 ? 0:1 }">Tên
											đăng nhập</a></th>
									<th scope="col"><a
										href="/admin/admin/list?${cate}field=fullname&t=${s > 0 ? 0:1 }">Tên
											Admin</a></th>
									<th scope="col">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:set value="1" var="i" />
								<c:forEach items="${page.content}" var="tk">
									<c:if test="${tk.admin==true}">
										<tr>
											<td>${i}</td>
											<td>${tk.username }</td>
											<td>${tk.fullname }</td>
											<td>
												<button class="btn btn-danger">
													<a href="javascript:deleteAdmin('${tk.username}')">Xóa</a>
												</button>

												<button class="btn btn-success">
													<a href="/admin/admin/edit/${tk.username }">Sửa</a>
												</button>
											</td>
										</tr>
										<c:set var="i" value="${i+1}" />
									</c:if>
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
	function deleteAdmin(id) {
		if (confirm("Bạn muốn xóa tài khoản " + id + " phải không?") == true) {
			window.location.href = "${url}/admin/delete/" + id;
		}
	}
</script>