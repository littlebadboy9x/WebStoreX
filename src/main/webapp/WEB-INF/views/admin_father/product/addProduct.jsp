<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/admin" var="url" />
<c:url value="/user" var="user" />
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">Thêm sản phẩm</div>
						<hr>
						<form:form method="post" action="${url }/product/create"
							modelAttribute="prd" enctype="multipart/form-data">

							<form:input type="file" path="" placeholder="Photo?"
								name="attach" id="attach" style="visibility: hidden;"
								class="form-control" />
							<div class="form-group row" style="height: 180px">
									<div class="col-md-9">
										<form:label path="name" for="name">Tên sản phẩm</form:label>
										<form:input type="text" path="name" class="form-control" required="required"
											id="name" placeholder="Tên sản phẩm" />
										<br>

										<form:label path="category" name="category">Danh mục</form:label>
										<div>
											<form:select path="category" class="form-control valid"
												aria-invalid="false" name="category">
												<c:forEach items="${cateList }" var="cate">
													<form:option value="${cate.id }">${cate.name }</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
									<!--  -->
									<div class="col-md-3">
										<form:label path="" for="attach">
											<img alt="" src="${user}/images/${filename}" width="220px"
												height="220px" style="float: right; object-fit: cover; border: 1px solid #fff;">
										</form:label>
									</div>
							</div>
							<div class="form-group">
								<form:label for="the-date" path="createdate">Ngày</form:label>
								<form:input path="createdate" type="date" class="form-control"
									id="the-date" placeholder="Ngày đăng" />
							</div>
							<div class="form-group">
								<form:label for="price" path="price">Giá</form:label>
								<form:input path="price" type="number" class="form-control" required="required"
									step="1000" min="10000" id="price" placeholder="Giá" />
							</div>
							<div class="form-group">
								<form:label for="avaliable" path="avaliable">Trạng thái</form:label>
								<div>
									<form:select path="avaliable" class="form-control valid"
										id="avaliable" aria-invalid="false">
										<form:option value="1">Còn hàng</form:option>
										<form:option value="0">Hết hàng</form:option>
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<form:label for="discount" path="discount">Giảm giá</form:label>
								<div class="input-group">
									<form:input path="discount" class="form-control" type="number"
										id="discount" step="1" min="0" value="0" max="100"
										placeholder="Giảm ... %" />
									<div class="input-group-append">
										<form:button class="btn btn-light" type="button">%</form:button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<form:label for="description" class="col-form-label"
									path="description">Mô tả</form:label>
								<div>
									<form:textarea path="description" class="form-control" rows="4" required="required"
										id="description"></form:textarea>
								</div>
							</div>

							<div class="form-group">
								<form:label for="content" class="col-form-label" path="content">Nội dung</form:label>
								<div>
									<form:textarea path="content" class="form-control" rows="4" required="required"
										id="content"></form:textarea>
								</div>
							</div>

							<div class="form-group">
								<form:label for="other" path="image">Khác</form:label>
								<form:input path="other" type="text" class="form-control" required="required"
									id="other" placeholder="Thông tin khác?" />
							</div>
							<div class="form-footer">
								<form:button class="btn btn-danger">
									<i class="fa fa-times"></i>
									<a href="/admin/product">Hủy</a>
								</form:button>
								<form:button type="submit" class="btn btn-success">
									<i class="fa fa-check-square-o"></i> Thêm
								</form:button>
								<a href="/admin/product/create" class="btn btn-dark">
									<i class="fa fa-refresh" aria-hidden="true"></i> Làm mới
								</a>
							</div>
							<form:input path="image" type="hidden" />
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>
${message }
<script>
	var date = new Date();

	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();

	if (month < 10)
		month = "0" + month;
	if (day < 10)
		day = "0" + day;

	var today = year + "-" + month + "-" + day;

	document.getElementById('the-date').value = today;
</script>