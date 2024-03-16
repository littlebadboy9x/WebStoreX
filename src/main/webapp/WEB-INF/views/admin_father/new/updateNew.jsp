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
						<div class="card-title">Cập nhật tin tức</div>
						<hr>
						<form:form method="post" action="${url }/new/update"
							modelAttribute="new" enctype="multipart/form-data">

							<input type="file" placeholder="Photo?"
								name="attach" id="attach" style="visibility: hidden;"
								class="form-control" />
							<div class="form-group row" style="height: 180px">
								<div class="col-md-9">
									<div class="form-group">
										<form:label for="title" class="col-form-label" path="title">Tiêu đề</form:label>
										<div>
											<form:input path="title" class="form-control"
												placeholder="Tiêu đề tin tức" required="required" id="title"></form:input>
										</div>
									</div>
									<div class="form-group">
										<form:label for="id" class="col-form-label" path="content">Nội dung</form:label>
										<div>
											<form:textarea path="content" class="form-control"
												placeholder="Nội dung tin tức" required="required" id="id"></form:textarea>
										</div>
									</div>
								</div>
								<div class="col-md-3">
									<form:label path="" for="attach">
										<img alt="" src="${user}/images/${filename}" width="220px"
											height="220px"
											style="float: right; object-fit: cover; border: 1px solid #fff;">
									</form:label>
								</div>

							</div>
							<br>
							<br>
							<div class="form-group">
								<form:label path="" name="author">Người đăng</form:label>
								<div>
									<form:select path="account.username" class="form-control valid"
										aria-invalid="false" name="author">
										<c:forEach items="${accList }" var="acc">
											<form:option value="${acc.username }">${acc.fullname }</form:option>
										</c:forEach>
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<form:label for="the-date" path="created">Ngày</form:label>
								<form:input path="created" type="date" class="form-control"
									id="the-date" placeholder="Ngày đăng" />
								<form:input path="image" type="hidden" />
								<form:input path="id" type="hidden" />
							</div>
							<div class="form-footer">
								<form:button class="btn btn-danger">
									<i class="fa fa-times"></i>
									<a href="/admin/new">Hủy</a>
								</form:button>
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
${message }
