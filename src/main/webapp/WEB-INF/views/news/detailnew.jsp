<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value = "/user" var="url"/>
<!-- /banner_bottom_agile_info -->
<div class="news-bg">
	<div class="container">
		<h3>
			Chi tiết <span>Bài viết</span>
		</h3>
		<!--/w3_short-->
		<div class="services-breadcrumb">
			<div class="agile_inner_breadcrumb">

				<ul class="w3_short">
					<li><a href="${url}/home">Evos Shop</a><i>|</i></li>
					<li>Bài viết</li>
				</ul>
			</div>
		</div>
		<!--//w3_short-->
	</div>
</div>

  <!-- Blog Archive -->
  <section id="aa-blog-archive">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-blog-archive-area">
            <div class="row">
              <div class="col-md-9">
                <!-- Blog details -->
                <div class="aa-blog-content aa-blog-details">
                  <article class="aa-blog-content-single">                        
                    <h2><a href="#">${boardnew.title}</a></h2>
                     <div class="aa-article-bottom">
                      <div class="aa-post-author">
                        Đăng bởi <a href="#">${boardnew.account.username}</a>
                      </div>
                      <div class="aa-post-date">${boardnew.created}</div>
                    </div>
                    <figure class="aa-blog-img">
                      <a href="#"><img src="/user/images/${boardnew.image}" alt="fashion img"></a>
                    </figure>
                    <p>${boardnew.content}</p>
                    
                  </article>
                </div>
              </div>
              <!-- blog sidebar -->
              <div class="col-md-3">
                <aside class="aa-blog-sidebar">

                  <div class="aa-sidebar-widget">
                    <h3>Bài đăng gần đây</h3>
                    <div class="aa-recently-views">
                      <ul>
                   <c:forEach items="${boardnewlist}" var="boardnew" end="2">
                        <li>
                          <a class="aa-cartbox-img" href="/user/new/detail/${boardnew.id}"><img src="/user/images/${boardnew.image}" alt="img bài viết"></a>
                          <div class="aa-cartbox-info">
                            <h4><a href="/user/new/detail/${boardnew.id}"><b>${boardnew.title }</b></a></h4>
                            <p>${boardnew.created }</p>
                          </div>                    
                        </li>
                        </c:forEach>
                      </ul>
                    </div>                            
                  </div>
                </aside>
              </div>
            </div>           
          </div>
        </div>
      </div>
    </div>
  </section>
  <div class="clearfix"></div>
  
 
  
