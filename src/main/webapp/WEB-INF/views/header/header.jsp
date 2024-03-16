<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript"
	src="<c:url value='/sweetalert2/sweetalert2.min.js'/>">
</script>
<link href="<c:url value='/sweetalert2/sweetalert2.min.css'/>"
	rel="stylesheet" type="text/css">
<style>
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: black;
	min-width: 180px;
	height: 250px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content .dd {
	color: white;
	border: 1px solid blue;
	height: 36px;
	width: 150px;
	float: left;
	margin-top: 15px;
	margin-left: 10px;
	padding-top: 5px;
}

.dropdown-content .dd:hover {
	color: blue;
	background: pink;
	border: 1px solid blue;
	height: 36px;
	width: 150px;
	float: left;
	margin-top: 15px;
	margin-left: 10px;
	padding-top: 5px;
	border: 1px solid blue;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<script>
	function logout() {
			 const swalWithBootstrapButtons = Swal.mixin({
				  customClass: {
				    confirmButton: 'btn btn-success',
				    cancelButton: 'btn btn-danger'
				  },
				  buttonsStyling: false
				})

				swalWithBootstrapButtons.fire({
				  title: 'Bạn muốn đăng xuất phải không?',
				  text: "Trở về về trang chủ!",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonText: 'Yes',
				  cancelButtonText: 'No',
				  reverseButtons: true
				}).then((result) => {
				  if (result.isConfirmed) {
					  window.location.href = "${url}/account/logout";
			            Swal.fire('Đăng xuất thành công', '', 'success')
				  }
				})
	}	

</script>
<div class="header" id="home">
	<div class="container">
		<ul>

			<li><i class="fa fa-phone" aria-hidden="true"></i> Sđt :
				0386602039</li>
			<li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a
				href="mailto:tienbmps15611@fpt.edu.vn">vuongtvph29288@fpt.edu.vn</a></li>

			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<li><a href="/user/account/login" data-toggle="modal"> <i
							class="fa fa-unlock-alt" aria-hidden="true"></i> Đăng nhập
					</a></li>
					<li><a href="/user/account/sign-up" data-toggle="modal"><i
							class="fa fa-pencil-square-o" aria-hidden="true"></i>Đăng kí </a></li>
				</c:when>
				<c:otherwise>
					<li><i class="fas fa-user-check" aria-hidden="true">
							<div class="dropdown">
								Tài khoản:<span> ${sessionScope.user.username}</span>
								<div class="dropdown-content">
									<a class="dd" href="/user/account/change">Đổi mật khẩu</a> <br> <a
										class="dd" href="/user/account/edit/${sessionScope.user.username}">Chỉnh sửa thông tin</a> <br> <a
										class="dd" href="/user/order/history">Lịch sử đơn hàng</a> <br> 
										<a class="dd"
										href="/user/order/list">Danh sách sản phẩm đã mua</a> <br>
								</div>
							</div>
					</i></li>
					<li><i class="fa fa-sign-out" aria-hidden="true"></i><a
						href="javascript:logout()"> Đăng xuất</a></li>

				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>