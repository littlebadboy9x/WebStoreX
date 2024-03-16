<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url value="/admin" var="url" />
<c:url value="/user" var="user" />
<title>Cập Nhật Admin</title>
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">Cập nhật Admin</div>
						<hr>
						<form:form method="post" action="${url }/admin/update"
							modelAttribute="acc" enctype="multipart/form-data">

							<form:input type="file" path="" placeholder="Photo?"
								name="attach" id="attach" style="visibility: hidden;"
								class="form-control" />
							<div class="form-group row" style="height: 180px">
								<div class="col-md-9">
									<div class="form-group">
										<form:label for="fullname" class="col-form-label"
											path="fullname">Họ tên</form:label>
										<div>
											<form:input path="fullname" class="form-control"
												placeholder="Họ tên" required="required" id="fullname"></form:input>
										</div>
									</div>

									<div class="form-group">
										<form:label for="email" class="col-form-label" path="email">Email</form:label>
										<div>
											<div>
												<form:input path="email" class="form-control"
													placeholder="Email" type="email"
													pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
													title="Email không hợp lệ" required="required"
													id="email"></form:input>
											</div>
										</div>
									</div>
									<div class="form-group">
										<form:label for="activated" path="activated">Trạng thái</form:label>
										<div>
											<form:select path="activated" class="form-control valid"
												id="activated" aria-invalid="false">
												<form:option value="1">Kích hoạt</form:option>
												<form:option value="0">Chưa kích hoạt</form:option>
											</form:select>
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
							<br>
							<form:label path="username" for="username">Tên Đăng Nhập</form:label>
							<form:input type="text" path="username" class="form-control"
								placeholder="Tên đăng nhập" />
							<br>
							<form:label path="password" for="password">Mật khẩu</form:label>
							<form:input path="password" class="form-control" id="myinput"
								pattern=".{6,}" title="Họ tên phải từ 6 ký tự trở lên"
								type="password" placeholder="Mật khẩu" />
							<br>
							<input type="checkbox" onclick="myFunction1()">Hiển
								thị mật khẩu
								<script>
									function myFunction1() {
										var x = document
												.getElementById("myinput");
										if (x.type === "password") {
											x.type = "text";
										} else {
											x.type = "password";
										}
									}
								</script>
							<br>
							<br>
							<div class="form-group">
								<form:label for="the-date" path="createdate">Ngày</form:label>
								<form:input path="createdate" type="date" class="form-control"
									id="the-date" placeholder="Ngày đăng" />
							</div>
							<div class="form-footer">
								<form:button class="btn btn-danger">
									<i class="fa fa-times"></i>
									<a href="/admin/admin/list">Hủy</a>
								</form:button>
								<form:button type="submit" class="btn btn-success">
									<i class="fa fa-check-square-o"></i> Cập nhật
								</form:button>
							</div>
							<form:input path="photo" type="hidden" />
							<form:input path="admin" type="hidden" value="1" />
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay toggle-menu"></div>
	</div>
</div>
${message }
