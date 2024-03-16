<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value="/user" var="url" />
<a href="#home" class="scroll" id="toTop" style="display: block;"> <span
	id="toTopHover" style="opacity: 1;"> </span>
</a>
<!-- js -->
<script type="text/javascript" src="${url}/js/jquery-2.1.4.min.js"></script>
<!-- script for responsive tabs -->
<script src="${url}/js/easy-responsive-tabs.js"></script>
<script>
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true, // 100% fit in a container
			closed : 'accordion', // Start closed if in accordion view
			activate : function(event) { // Callback function if tab is switched
				var $tab = $(this);
				var $info = $('#tabInfo');
				var $name = $('span', $info);
				$name.text($tab.text());
				$info.show();
			}
		});
		$('#verticalTab').easyResponsiveTabs({
			type : 'vertical',
			width : 'auto',
			fit : true
		});
	});
</script>
<!-- //script for responsive tabs -->
<!-- //js -->

<!-- //stats -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="${url}/js/move-top.js"></script>
<script type="text/javascript" src="${url}/js/jquery.easing.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- here stars scrolling icon -->
<script type="text/javascript">
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});

	});
</script>
<script type="text/javascript" src="${url}/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${url}/js/js_loading/jquery.simpleGallery.js"></script>
<script type="text/javascript"
	src="${url}/js/js_loading/jquery.simpleLens.js"></script>
<script type="text/javascript" src="${url}/js/js_loading/slick.js"></script>
<script type="text/javascript" src="${url}/js/js_loading/custom.js"></script>