<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!-- /banner_bottom_agile_info -->
<div class="prddetail-bg">
	<div class="container">
		<h3>
			SO SÁNH <span>SẢN PHẨM</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home">Evos Shop</a><i>|</i></li>
					<li>So Sánh Sản Phẩm</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>

<section id="aa-blog-archive">
	<c:forEach var="item" items="${items}">

		<div class="col-md-4" style="margin: 20px 0 0 20px; width: 450px;">
			<div class="card" style="border: green 2px solid">
				<div class="card-footer text-center bg bg-primary"
					style="height: 50px; font-weight: bold;">
					<a href="/user/product/productdetail/${item.product.id}">${item.product.name}</a>
					<a class="bg bg-warning remove"
						href="/user/conf/delete/${item.product.id}"
						style="float: right; font-size: 30px"><fa class="fa fa-close"></fa></a>
				</div>
				<a href="/user/product/productdetail/${item.product.id}"><img
					src="/user/images/${item.product.image}" width="180px"
					height="200px" style="object-fit: cover; margin-left: 100px"></a>
				<div class="card-footer text-center" style="height: 50px">
					<c:choose>
						<c:when test="${pd.discount == 0}">
							<strike><f:formatNumber value="${item.product.price}"
									pattern="#,###₫" /></strike>
						</c:when>
						<c:otherwise>
							<strike><f:formatNumber value="${item.product.price}"
									pattern="#,###₫" /></strike>
							<f:formatNumber
								value="${item.product.price*(1-(item.product.discount/100))}"
								pattern="#,###₫" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</c:forEach>
</section>
<div class="clearfix"></div>
<br>
<br>
<br>
<div class="card-footer bg bg-danger">Tổng quan</div>
<br> <br>
<div class="card-footer">Thông tin cấu hình</div><br>
<c:forEach var="item" items="${items}">
		<div class="w3ls_para col-md-4" style="border: 2px solid black">
		<div class="btn btn-primary">Màn hình: ${item.manhinh}</div>
		<br> <br>
		<div class="btn btn-primary">Hệ điều hành: ${item.hedieuhanh}</div>
		<br> <br>
		<div class="btn btn-warning">Camera sau: ${item.camerasau}</div>
		<br> <br>
		<div class="btn btn-warning">Camera trước: ${item.cameratruoc}</div>
		<br> <br>
		<div class="btn btn-primary">Chip: ${item.chip}</div>
		<br> <br>
		<div class="btn btn-primary ">RAM: ${item.ram}</div>
		<br> <br>
		<div class="btn btn-warning">Bộ nhớ trong: ${item.bonhotrong}</div>
		<br> <br>
		<div class="btn btn-warning">SIM: ${item.sim}</div>
		<br> <br>
		<div class="btn btn-primary">Hỗ trợ 5G: ${item.hotro5g?'Có':'Không' }</div>
		<br> <br>
		<div class="btn btn-primary">Pin, Sạc: ${item.pin_sac}</div>
		<br> <br>
		</div>
</c:forEach>
<div class="clearfix"></div>
<br>
<br>