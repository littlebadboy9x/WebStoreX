<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="bg bg-info">
	<div class="row col-md-12">
		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 180px; height: 38px; margin: 10px 20px 0 10px; margin: 10px 20px 0 0px; padding-top: 5px; background: #D9EDF7">
			<i class="fas fa-filter"></i> <span>Bộ lọc sản phẩm</span>
		</div>

		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 100px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Hãng <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<button id="ip" value="iphone">
						<input type="hidden">iPhone
					</button>
					<button value="Samsung" id="ss">
						<input type="hidden">Samsung
					</button>
				</ul>

			</div>
		</div>

		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 100px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Giá <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" style="width: 300px; padding: 7px;">
					<button id="do" value="1000000">
						<input type="hidden">Dưới 1 triệu
					</button>
					<button value="2000000" id="dt">
						<input type="hidden">Dưới 2 triệu
					</button>
					<button id="dth" value="3000000">
						<input type="hidden">Dưới 3 triệu
					</button>
					<br>
					<br>
					<button value="5000000" id="df">
						<input type="hidden">Dưới 5 triệu
					</button>
					<button id="de" value="8000000">
						<input type="hidden">Dưới 8 triệu
					</button>
					<button value="10000000" id="dte">
						<input type="hidden">Dưới 10 triệu
					</button>
					<br>
					<br>
					<button value="100000000" id="tte">
						<input type="hidden">Trên 10 triệu
					</button>
				</ul>
			</div>
		</div>

		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 160px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Loại điện thoại <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<button id="ios" value="ios">
						<input type="hidden">iPhone(iOS)
					</button>
					<button value="other" id="other">
						<input type="hidden">Android
					</button>
				</ul>
			</div>
		</div>
		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 180px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Hiệu năng & pin <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">Chơi game / cấu hình cao</a></li>
					<li><a href="#">Pin khủng trên 5000 mAh</a></li>
					<li><a href="#">Sạc pin nhanh</a></li>
			</div>
		</div>
		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 100px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Ram <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">2GB</a></li>
					<li><a href="#">3GB</a></li>
					<li><a href="#">4GB</a></li>
					<li><a href="#">6GB</a></li>
					<li><a href="#">8GB</a></li>
					<li><a href="#">12GB</a></li>
			</div>
		</div>
		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 160px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Bộ nhớ trong <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">8GB</a></li>
					<li><a href="#">16GB</a></li>
					<li><a href="#">32GB</a></li>
					<li><a href="#">64GB</a></li>
					<li><a href="#">128GB</a></li>
					<li><a href="#">256GB</a></li>
					<li><a href="#">512GB</a></li>
			</div>
		</div>
		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 120px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Thiết kế <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">Tràn viền</a></li>
					<li><a href="#">Mỏng nhẹ</a></li>
					<li><a href="#">Mặt lưng kính</a></li>
			</div>
		</div>
		<div class="col-md-1"
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 180px; margin: 10px 20px 0 10px; margin: 10px 20px 0 5px; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Tính năng đặt biệt <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">Hỗ trợ 5G</a></li>
					<li><a href="#">Kháng nước, bụi</a></li>
					<li><a href="#">Bảo mật khuôn mặt</a></li>
					<li><a href="#">Bảo mật vân tay</a></li>
					<li><a href="#">Sạc không dây</a></li>
			</div>
		</div>

	</div>
</div>
<!-- Bộ lọc -->
<div class="bg bg-info">
	<div class="row col-md-12" style="margin: 30px 0 0 0px;">
		<div class="col-md-1">
			<c:if test="${not empty slsptt}">
				<span style="font-weight: bold; font-size: 20px"
					class="bg bg-primary">${slsptt } sản phẩm </span>
			</c:if>
		</div>
		<div class="col-md-1"
			style="width: 160px; background: cyan; color: chartreuse;">
			<input type="checkbox"> <label for=""> <img
				src="images/icon-thunder.png" alt="" height="18px"> GIAO NHANH
			</label>
		</div>
		<div class="col-md-1">
			<input type="checkbox"> <label for="">Giảm giá</label>
		</div>
		<div class="col-md-1">
			<input type="checkbox"> <label for="">Góp 0%</label>
		</div>
		<div class="col-md-1">
			<input type="checkbox"> <label for="">Độc quyền</label>
		</div>
		<div class="col-md-1">
			<input type="checkbox"> <label for="">Mới</label>
		</div>
		<div class="col-md-3">
			<form action="/user/home">
				<select path="category" class="form-control valid"
					style="float: left;" class="col-md-8" aria-invalid="false"
					name="category">
					<c:forEach items="${cateList }" var="cate">
						<option value="${cate.id }">${cate.name }</option>
					</c:forEach>
				</select>
				<button class="col-md-3 btn btn-primary"
					style="position: absolute; left: 400px">Lọc</button>
			</form>

		</div>
		<div
			style="border: 2px solid #2fdab8; border-radius: 10px; width: 132px; margin: 10px 20px 30px 10px; float: right; background: #EFEFEF">
			<div class="dropdown">
				<button class="btn btn-dark dropdown-toggle" type="button"
					data-toggle="dropdown">
					Sắp xếp theo <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="/user/home?field=name">Nổi bật</a></li>
					<li><a href="/user/home?filter=top">Top 10 sản phẩm giảm
							giá</a></li>
					<li><a href="/user/home?field=discount&t=1">% Giảm giá</a></li>
					<li><a href="/user/home?field=price&t=1">Giá cao đến thấp</a></li>
					<li><a href="/user/home?field=price&t=0">Giá thấp đến cao</a></li>
			</div>
		</div>
	</div>
</div>
<!-- Name -->
<script type="text/javascript">
let tenDienThoai= document.querySelector('#ip');
let tenDienThoai2= document.querySelector('#ss');
tenDienThoai.addEventListener('click', () => {
	name = document.getElementById('ip').value;
	window.location.replace("/list/search/product/name?name="+name);
});
tenDienThoai2.addEventListener('click', () => {
	name = document.getElementById('ss').value;
	window.location.replace("/list/search/product/name?name="+name);
});
</script>
<!-- price -->
<script type="text/javascript">
let price= document.querySelector('#do');
let price2= document.querySelector('#dt');
let price3= document.querySelector('#dth');
let price4= document.querySelector('#df');
let price5= document.querySelector('#de');
let price6= document.querySelector('#dte');
let price7= document.querySelector('#tte');
price.addEventListener('click', () => {
	price = document.getElementById('do').value;
	window.location.replace("/list/search/product/price?price="+price);
});
price2.addEventListener('click', () => {
	price = document.getElementById('dt').value;
	window.location.replace("/list/search/product/price?price="+price);
});
price3.addEventListener('click', () => {
	price = document.getElementById('dth').value;
	window.location.replace("/list/search/product/price?price="+price);
});
price4.addEventListener('click', () => {
	price = document.getElementById('df').value;
	window.location.replace("/list/search/product/price?price="+price);
});
price5.addEventListener('click', () => {
	price = document.getElementById('de').value;
	window.location.replace("/list/search/product/price?price="+price);
});
price6.addEventListener('click', () => {
	price = document.getElementById('dte').value;
	window.location.replace("/list/search/product/price?price="+price);
});
price7.addEventListener('click', () => {
	price = document.getElementById('tte').value;
	window.location.replace("/list/search/product/price?price="+price);
});
</script>
<!-- Cate -->
<script type="text/javascript">
let loaiDienThoai= document.querySelector('#ios');
let loaiDienThoai2= document.querySelector('#other');
loaiDienThoai.addEventListener('click', () => {
	name = document.getElementById('ios').value;
	window.location.replace("/list/search/product/cate/name?id=MOB&name="+name);
});
loaiDienThoai2.addEventListener('click', () => {
	name = document.getElementById('other').value;
	window.location.replace("/list/search/product/cate/name?id=MOB&name="+name);
});
</script>