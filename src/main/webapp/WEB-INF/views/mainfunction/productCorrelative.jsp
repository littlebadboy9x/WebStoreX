<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<ul>
	<c:forEach items="${listpd}" var="pdo">
		<c:if test="${pdo.category.id == pd.category.id}">
			<div class="col-md-3 product-men">
				<div class="men-pro-item simpleCart_shelfItem">
					<div class="men-thumb-item">
						<img src="${url}/images/${pdo.image}" alt="${pdo.name }"
							class="pro-image-front"> <img
							src="${url}/images/${pdo.image}" alt="${pdo.name }"
							class="pro-image-back">
						<div class="men-cart-pro">
							<div class="inner-men-cart-pro">
								<a href="${url }/product/productdetail/${pdo.id}"
									class="link-product-add-cart">Xem Chi Tiết</a>
							</div>
						</div>
						<span class="item-right">
							<c:forEach items="${listob }" var="item">
								<c:if test="${item.group.id == pd.id}">
									Đã bán: <span style="color: red; font-weight: bold;">
										${item.sum}</span>
								</c:if>
							</c:forEach>
						</span>
						<span class="product-new-top">${pdo.other }</span>

					</div>
					<div class="item-info-product ">
						<h4 style="height: 60px; word-wrap:break-word; ">
							<a href="${url }/product/productdetail/${pdo.id}">${pdo.name }</a>
						</h4>

						<c:choose>
							<c:when test="${pdo.discount == 0}">
								<div class="info-product-price">
									<span class="item_price"><f:formatNumber
											value="${pdo.price}" pattern="#,###₫" /></span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="info-product-price">
									<span class="item_price"><f:formatNumber
											value="${pdo.price*(1-(pdo.discount)/100)}" pattern="#,###₫" /></span>
									<del>
										<f:formatNumber value="${pdo.price}" pattern="#,###₫" />
									</del>
								</div>
							</c:otherwise>
						</c:choose>

						<div
							class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
							<form action="${url}/add/cart/product/${pdo.id}" method="post">
								<input type="submit" name="submit" value="Thêm giỏ hàng"
									class="button" />
							</form>
						</div>

					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	<div class="clearfix"></div>
</ul>