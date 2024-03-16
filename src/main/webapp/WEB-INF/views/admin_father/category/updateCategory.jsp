<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/admin" var="url" />
<style>
.error {
	color: red;
	font-weight: bold;
	border: 2px solid pink;
	padding: 5px;
	margin: 3px;
	border-radius: 5px;
}
</style>
<div class="content-wrapper">
	<div class="container-fluid">

		<div class="row mt-3">
			<div class="col-lg-8">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="card-title col-md-6">Cập nhật danh mục</div>
							<span style="color: red; font-weight: bold;"
							class="col-md-6">${message}</span>
						</div>
						<hr>
						<form:form action="${url}/category/update" method="post"
							modelAttribute="cate">
							<div class="form-group">
								<label for="input-1">Id danh mục</label>
								<form:input path="id" type="text" class="form-control"
									id="input-1" name="cate-name" readonly="true"/>
							</div>
							<div class="form-group">
								<label for="input-2">Tên danh mục</label>
								<form:input path="name" placeholder="Sửa tên danh mục?" required="required" 
									class="form-control" />
								<br>
							</div>
							<div class="form-footer">
								<a href="${url}/category" class="btn btn-danger"> <i
									class="fa fa-times"></i> Hủy
								</a>
								<form:button type="submit" class="btn btn-success">
									<i class="fa fa-check-square-o"></i> Cập nhật
								</form:button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>