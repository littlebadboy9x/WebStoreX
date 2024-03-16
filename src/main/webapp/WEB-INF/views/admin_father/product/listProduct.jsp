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
				<button class="add-catalog" style="float: left;">
					<a href="/admin/product/create">Thêm sản phẩm</a>
				</button>
				<div class="col-md-3" style="float: left; position: absolute; top: 10px; left: 350px ">
					<form action="/admin/product">
						<select class="form-control valid" style="float: left;"
							class="col-md-8" aria-invalid="false" name="category">
							<c:forEach items="${cateList }" var="cate">
								<option value="${cate.id }">${cate.name }</option>
							</c:forEach>
						</select>
						<button class="col-md-3 btn btn-primary" style="position: absolute; left: 350px">Lọc</button>
					</form>
					
				</div>
				<span class="btn btn-dark" style="float: right">${page.number+1}
					of ${page.totalPages}</span> <br> <br> <a
					href="/admin/product?${cate }field=${column}&t=${s > 0 ? 1:0 }&p=${page.totalPages-1 }"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px">|></a><a
					href="/admin/product?${cate}field=${column}&t=${s > 0 ? 1:0 }&p=${(page.number+1) > (page.totalPages -1) ? page.totalPages -1 : page.number+1}"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px">>></a> <a
					href="/admin/product?${cate}field=${column}&t=${s > 0 ? 1:0 }&p=${(page.number-1) < 0 ? 0 : page.number-1}"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px"><<</a> <a
					href="/admin/product?${cate}field=${column}&t=${s > 0 ? 1:0 }&p=0"
					class="btn btn-dark"
					style="float: right; color: white; font-size: 20px"><|</a>

			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Danh sách sản phẩm</h5>
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col"><a
											href="/admin/product?${cate}field=name&t=${s > 0 ? 0:1 }"><span>Tên
													sản phẩm</a></th>
										<th scope="col">Hình ảnh</th>
										<th scope="col"><a
											href="/admin/product?${cate}field=category&t=${s > 0 ? 0:1 }">ID
												danh mục</a></th>
										<th scope="col"><a
											href="/admin/product?${cate}field=price&t=${s > 0 ? 0:1 }">Giá</a></th>
										<th scope="col">Trạng thái</th>
										<th scope="col"><a
											href="/admin/product?${cate}field=discount&t=${s > 0 ? 0:1 }">Giảm
												giá</a></th>
										<th scope="col"><a
											href="/admin/product?${cate}field=createdate&t=${s > 0 ? 0:1 }">Ngày
												tạo</a></th>
										<th scope="col">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="1" var="i" />
									<c:forEach items="${page.content}" var="pd">
										<tr>
											<th scope="row">${i}</th>
											<td>${pd.name }</td>
											<td><img
												style="width: 80px; height: 80px; object-fit: cover; border: 1px solid #fff;"
												src="${url}/images/${pd.image}" alt="${pd.image }"></td>
											<td>${pd.category.id }</td>
											<td><f:formatNumber value="${pd.price}"
													pattern="#,### ₫" /></td>
											<td>${pd.avaliable ? 'Còn hàng' : 'Đã bán hết' }</td>
											<td>${pd.discount }%</td>
											<td>${pd.createdate }</td>
											<td>
												<button class="btn btn-danger">
													<a href="javascript:deleteProduct('${pd.id}')">Xóa</a>
												</button>

												<button class="btn btn-success">
													<a href="/admin/product/edit/${pd.id }">Sửa</a>
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
	function deleteProduct(id) {
		if (confirm("Bạn muốn xóa sản phẩm " + id + " phải không?") == true) {
			window.location.href = "${admin}/product/delete/" + id;
		}
	}
</script>