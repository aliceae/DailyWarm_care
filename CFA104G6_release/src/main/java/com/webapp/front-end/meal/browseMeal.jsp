<%@page import="com.meal.model.service.MealService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.meal.model.*"%>
<%@ page import="com.mealimg.model.*"%>
<%@ page import="com.meal.model.vo.*" %>


<%
	MealService mealSvc = new MealService();
	List<MealVO> list = mealSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="mealImgSvc" scope="page" class="com.mealimg.model.MealImgService" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Warm照護媒合</title>
<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="healthcare.png" />
    <!-- Bootstrap Icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
        rel="stylesheet" type="text/css" />
    <!-- SimpleLightbox plugin CSS-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<style>
	a {text-decoration:none;}
	#pics{ position:relative;}
	#pics img{ 
	position:absolute;
	  /* 淡出淡入效果2秒 */
	  -webkit-transition: opacity 2s ease-in-out;
	  -moz-transition: opacity 2s ease-in-out;
	  -o-transition: opacity 2s ease-in-out;
	  transition: opacity 2s ease-in-out;
	 }
	 #pics img:last-child:hover{
		 /* 滑入時第一張透明度設0 */
		  opacity:0;}
	.pt-5{
	padding-bottom: 20rem !important
	}
</style>
<body>
<!-- Navigation 導覽列 -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top1 py-3" id="mainNav">
        <div class="container px-4 px-lg-0">
            <a class="navbar-brand" href="#page-top">Daily Warm</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto my-2 my-lg-0">

                    <!-- 首頁 -->
                    <li class="nav-item"><a class="nav-link" href="#">首頁</a></li>
                    <!-- 關於我們 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            關於我們
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">最新消息</a></li>
                            <li><a class="dropdown-item" href="#">網站簡介</a></li>
                            <li><a class="dropdown-item" href="#">常見問題</a></li>
                        </ul>
                    </li>
                    <!-- 服務項目 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            服務項目
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">照護</a></li>
                            <li><a class="dropdown-item" href="#">餐點</a></li>
                            <li><a class="dropdown-item" href="#">派車</a></li>
                        </ul>
                    </li>
                    <!-- 通知 -->
                    <li class="nav-item"><a class="nav-link" href="#">通知</a></li>
                    <!-- 會員 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            <i class="fas fa-user-circle fa-2x "></i>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">切換帳號</a></li>
                            <li><a class="dropdown-item" href="#">申請成為照護員</a></li>
                            <li><a class="dropdown-item" href="#">登出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 送餐 -->
        <div class="container" style="padding-top: 50px">
            <div class="row justify-content-center">
                <div class="col col-md-8 text-center">
                    <h2 class="mb-2 mt-5 fw-bold">餐點</h2>
                    <!-- <p class="text-h3">Vivamus sagittis lacus vel augue laoreet rutrum
                        faucibus dolor auctor. Duis mollis, est non commodo luctus.
                        Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor
                        auctor. -->
                        <!-- <a href="https://generator.ws">Duis mollis</a>. -->
                    </p>
                </div>
            </div>
        </div>
    <div>
        <button type="button" class="btn btn-warning fixed-bottom"><a href='<%=request.getContextPath()%>/front-end/meal/orderMeal.jsp'>購買餐點</a></button>
    </div>
    <c:forEach var="mealVO" items="${list}">
    <section class="pt-5 pb-5">
        <div class="container">
            <div class="row justify-content-around">
                <div class="col-5" id="pics">
                <c:forEach var="mealImgVO" items="${mealImgSvc.all}">
                	<c:if test="${mealImgVO.mealNo==mealVO.mealNo}">
                		<img src="data:image/jpg;base64,${mealImgVO.mealImgFile}"
                			width="400"height="400">
					</c:if>
				</c:forEach>
                </div>

                <div class="col-6">
                    <h3 class="mb-2 display-5 fw-bold text-yellow2">${mealVO.mealName}</h3>
                    <p class="lead">價錢：${mealVO.mealPrice}</p>
                    <p class="lead">介紹：${mealVO.mealIntroduce}</p>
                </div>

            </div>
        </div>
    </section>
    </c:forEach>
    
    <!-- Footer -->
    <footer class="bg-light py-5">
        <div class="container px-4 px-lg-5">
            <div class="small text-center text-muted">Copyright &copy; 2021 - Daily Warm</div>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- SimpleLightbox plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
    <!-- Core theme JS-->
    <!-- <script src="js/scripts.js"></script> -->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->
</body>
</html>