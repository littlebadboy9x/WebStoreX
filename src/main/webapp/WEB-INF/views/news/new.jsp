<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value = "/user" var="url"/>
<!-- /banner_bottom_agile_info -->
<div class="news-bg">
	<div class="container">
		<h3>
			Tin <span>Tức</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home">Evos Shop</a><i>|</i></li>
					<li>Tin Tức</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>
<!-- /banner_bottom_agile_info -->
<!-- main content -->
<section id="aa-blog-archive">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-blog-archive-area">
            <div class="row">
              <div class="col-md-12">
                <div class="aa-blog-content">
                  <div class="row">
                  <c:forEach items="${boardnewlist}" var="boardnew">
                    <div class="col-md-4 col-sm-4">
                      <article class="aa-blog-content-single">                        
                        <h4><a href="/user/new/detail/${boardnew.id}">${boardnew.title}</a></h4>
                        <figure class="aa-blog-img">
                          <a href="/user/new/detail/${boardnew.id}"><img src="/user/images/${boardnew.image}" alt="farm products" height="180px" width="300px"></a>
                        </figure>
                        <p class="desc-boardnews">${boardnew.content}</p>
                        <div class="aa-article-bottom">
                          <div class="aa-post-author">
                            Đăng bởi <a href="#">${boardnew.account.username}</a>
                          </div>
                          <div class="aa-post-date">${boardnew.created}</div>
                        </div>
                      </article>
                    </div>
                    </c:forEach>
                  </div>
                </div>
                <!-- Blog Pagination -->
               
              </div>
             
            </div>
          </div>
        </div>
      </div>
	</div>
  </section>
<div class="clearfix"></div>

<!--  end content-->
