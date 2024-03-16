<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>--%>
<c:url value="/admin" var="url" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript"
	src="<c:url value='/sweetalert2/sweetalert2.min.js'/>">
</script>
<link href="<c:url value='/sweetalert2/sweetalert2.min.css'/>"
	rel="stylesheet" type="text/css">
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
				  text: "Trở về về trang đăng nhập!",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonText: 'Yes',
				  cancelButtonText: 'No',
				  reverseButtons: true
				}).then((result) => {
				  if (result.isConfirmed) {
					  window.location.href = "${url}/logout";
			            Swal.fire('Đăng xuất thành công', '', 'success')
				  }
				})
	}	

</script>
<header class="topbar-nav">
	<nav class="navbar navbar-expand fixed-top">
		<ul class="navbar-nav mr-auto align-items-center">
			<li class="nav-item"><a class="nav-link toggle-menu"
				href="javascript:void();"> <i class="icon-menu menu-icon"></i>
			</a></li>
		</ul>

		<ul class="navbar-nav align-items-center right-nav-link">
			<li class="nav-item"><a
				class="nav-link dropdown-toggle dropdown-toggle-nocaret"
				data-toggle="dropdown" href="#"> <span class="user-profile"><img
						src="/user/images/${sessionScope.user.photo}" class="img-circle"
						alt="user avatar"></span>
			</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li class="dropdown-item user-details"><a
						href="javaScript:void();">
							<div class="media">
								<div class="avatar">
									<img class="align-self-start mr-3"
										src="/user/images/${sessionScope.user.photo}"
										alt="user avatar">
								</div>
								<div class="media-body">
									<h6 class="mt-2 user-title">Evos Shop</h6>
									<b> Admin: ${sessionScope.user.username }</b>
								</div>
							</div>
					</a></li>

					<li class="dropdown-divider"></li>
					<li class="dropdown-item"><i class="icon-power mr-2"></i><a
						href="javascript:logout()"> Đăng xuất</a></li>
				</ul></li>
		</ul>
	</nav>
</header>