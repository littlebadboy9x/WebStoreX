<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/admin" var="url" />
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-8">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="card-title col-md-6">Thêm danh mục</div>
							<span style="color: red; font-weight: bold;"
							class="col-md-6">${message}</span>
						</div>
						<hr>
						<form:form action="${url}/category/create" method="post"
							modelAttribute="cate">
							<div class="form-group">
								<form:label for="input-1" path="id">Id danh mục</form:label>
								<form:input path="id" type="text" class="form-control"
									id="input-1" placeholder="Nhập id danh mục?" name="cate-name"  required="required"
									pattern=".{1,4}"
									title="Id danh mục bắt buộc phải nhỏ hơn 4 kí tự!"/>
								<br>
							</div>
							<div class="form-group">
								<form:label for="input-2" path="name">Tên danh mục</form:label>
								<form:input path="name" placeholder="Nhập tên danh mục?" required="required"
									class="form-control" />
								<br>
							</div>
							<div class="form-footer">
								<form:button class="btn btn-danger">
									<i class="fa fa-times"></i>
									<a href="/admin/product">Hủy</a>
								</form:button>
								<form:button type="submit" class="btn btn-success">
									<i class="fa fa-check-square-o"></i> Thêm
								</form:button>
								<a href="${url}/category/create" class="btn btn-dark">
									<i class="fa fa-refresh" aria-hidden="true"></i> Làm mới
								</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>