<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url value = "/user" var="url"/>
    <div class="header-bot">
        <div class="header-bot_inner_wthreeinfo_header_mid">
            <div class="col-md-4 header-middle">
                <form action="/list/search/product/searchname" method="post">
                    <input type="search" name="searchname" placeholder="Bạn muốn mua gì...?" >
                    <input type="submit" value=" ">
                    <div class="clearfix"></div>
                </form>
            </div>
            <!-- header-bot -->
            <div class="col-md-4 logo_agile">
                <h1><a href="${url}/home"> <span>E</span>vos Shop </a></h1>
                <img src="${url}/images/Logo_Asm1.jpg" alt="" width="120px" ; height="80px" style="top: -10px;
                    right: -60px; position: absolute;">
            </div>
            <!-- header-bot -->
            <div class="col-md-4 agileits-social top_content">
                <ul class="social-nav model-3d-0 footer-social w3_agile_social">
                    <li class="share">Chia sẻ với : </li>
                    <li><a href="#" class="facebook">
                            <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
                        </a></li>
                    <li><a href="#" class="twitter">
                            <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
                        </a></li>
                    <li><a href="#" class="instagram">
                            <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
                        </a></li>
                    <li><a href="#" class="pinterest">
                            <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                            <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
                        </a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    