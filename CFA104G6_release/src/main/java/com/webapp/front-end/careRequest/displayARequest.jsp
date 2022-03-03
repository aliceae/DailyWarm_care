<%@page import="com.utils.DecodeCookieUtil"%>
<%@page import="com.carerequest.model.CareRequestService"%>
<%@page import="com.carerequest.model.CareRequestVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%
int id = (int) DecodeCookieUtil.getMemId(request);
//如果要帶到下一頁
HttpSession session1 = request.getSession();
int carerId = (int)session1.getAttribute("carerId");
%>
<%
CareRequestVO careRequestVO = (CareRequestVO) request.getAttribute("careRequestVO");
CareRequestService careRequestSvc = new CareRequestService();

Integer numOfAppliers = careRequestSvc.getAppliersNum(careRequestVO.getRequestId());
String normalService = careRequestSvc.isNormalServiceExisted(careRequestVO.getRequestId());
String certiService = careRequestSvc.isCertiServiceExisted(careRequestVO.getRequestId());
String normalTab = careRequestSvc.displayTabsOfService(careRequestVO.getRequestId(), "01");
String certiTab = careRequestSvc.displayTabsOfService(careRequestVO.getRequestId(), "02");
String hasAppliedStr = careRequestSvc.hasAppliedStr(carerId, careRequestVO.getRequestId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>瀏覽需求單-Daily Warm照護媒合</title>
	   <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../front-end/assets/healthcare.png" />
    <!-- Bootstrap Icons-->
    <link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
    <!-- Font Awesome icons (free version)-->
    <script type="text/javascript" src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link type="text/css" href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
    <link type="text/css" href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
        rel="stylesheet" type="text/css" />
    <!-- SimpleLightbox plugin CSS-->
    <link type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
<link type="text/css" href="${pageContext.request.contextPath}/front-end/css/styles.css"
	rel="stylesheet" />

<style type="text/css">
.div1 {
   margin: 10px 10px 10px 10px;
   padding: 50px;
   border: 1px solid rgb(253, 253, 252);
   border-radius: 10px;
   background-color: rgb(255, 255, 255);
   opacity: 60%;
}


hr.style-one {
	border: 0;
	height: 1px;
	background: #333;
	background-image: linear-gradient(to right, #ccc, #333, #ccc);
}
.button {
    margin: 10px;
    background-color: hsl(36, 82%, 56%);
    color: #3b2205;
    font-size: 14px;
    border-radius: 8px;
    padding: 6px;
    border: 2px;
    width: 80px;
    transition-duration: 0s;
  }
  
  .button:hover {
    background-color: #e6bb94;
    color: black;
  }
  
 .disable_button{
    margin: 10px;
    background-color: grey;
    color: white;
    font-size: 14px;
    border-radius: 8px;
    padding: 6px;
    border: 2px;
    width: 80px;
 }
</style>
</head>
<body id="page-top">
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
                    <!-- 專業服務 -->
                    <li class="nav-item"><a class="nav-link" href="#">專業服務</a></li>
                    <!-- 需求列表 -->
                    <li class="nav-item"><a class="nav-link" href="#">需求列表</a></li>
                    <!-- 服務列表 -->
                    <li class="nav-item"><a class="nav-link" href="#">服務列表</a></li>
                    <!-- 個人資料設定 -->
                    <li class="nav-item"><a class="nav-link" href="#">個人資料設定</a></li>
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
                            <li><a class="dropdown-item" href="#">登出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<!-- Services 服務內容 -->
<section class="page-section bg-primary" id="services">
<div class="div1">
	<div>
		<h4>
			<a href="<%=request.getContextPath()%>/front-end/careRequest/requestSearch.jsp">回搜尋頁面</a><br>
			<a href="javascript:history.back()">回上一頁</a>
		</h4>
		<p>您的id為<%=carerId %></p>
	</div>
	<div>
		<div><b>需求單編號</b></div>
		<div>${careRequestVO.requestId} </div>
	</div>
	<div>
		<div><b>需求者</b></div>
		<div>${careRequestVO.patientName}${careRequestVO.patientGender} </div>
	</div>
	<div>
		<div><b>年紀</b></div>
		<div>${careRequestVO.patientAge} </div>
	</div>
	<div>
		<div><b>服務類型</b></div>
		<div>${careRequestVO.serviceType}</div>
	</div>
	<div>
		<div><b>地區</b></div>
		<div>${careRequestVO.patientAddr} </div>
	</div>
	<div>
		<div><b>服務需求項目</b></div>
		<div>
			<%=normalService %>
			<%=normalTab%>
			<%=certiService %>
			<%=certiTab %>
		</div>
		
	</div>
	<div>
		<div><b>服務起始時間</b></div>
		<div>${careRequestVO.startTime} </div>
	</div>
	<div>
		<div><b>服務結束時間</b></div>
		<div>${careRequestVO.endTime} </div>
	</div>
	<div>
		<div><b>備註</b></div>
		<div>${careRequestVO.note} </div>
	</div>
	<div>
		<div><b>狀態</b></div>
		<div>${careRequestVO.status} </div>
	</div>
	<div>
		<div><b>目前應徵人數</b></div>
		<div><%=numOfAppliers%> </div>
		<div><%=hasAppliedStr%> </div>
	</div>
	
	<div>
		
		
		<jsp:useBean id="carerSvc" scope="page" class="com.carermem.model.CarerMemService" />
		<%/* test : 應徵*/ %>
		<FORM onSubmit="if(!confirm('應徵後不能取消，是否確定應徵？')){return false;}"　method="post" action="<%=request.getContextPath()%>/request/requestsearch">
<%-- 		<FORM method="post" id="tmbhunit" action="<%=request.getContextPath()%>/request/requestsearch"> --%>
		<input type="hidden" name="requestId" value="${careRequestVO.requestId}" />
		<input type="hidden" name="carerId" value="<%=carerId %>" />
		<input type="hidden" name="action" value="applyToRequest">
		<c:choose>
			<c:when test="<%=\"您已應徵過此張需求單\".equals(hasAppliedStr) %>">
			<input type="button" id="disable_button" class="disable_button" value="已應徵過" />
			</c:when>
			<c:otherwise>
			<input type="submit" id="button" class="button" value="應徵">
			</c:otherwise>
		</c:choose>
		</FORM>
		
	</div>
</div>
    </section>

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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->
	<script type="text/javascript">
// 	$("#tmbhunit").submit(function(e) {
// 		  e.preventDefault();
// 		  var nm_unit = $("#namaunit").val();
// 		  var almtunit = $("#almtunit").val();
// 		  var form = this;

// 		  swal({
// 		    title: "Are you sure?",
// 		    type: "warning",
// 		    showCancelButton: true,
// 		    confirmButtonColor: "#DD6B55",
// 		    confirmButtonText: "Yes!",
// 		    cancelButtonText: "Cancel",
// 		    closeOnConfirm: true
// 		  }, function(isConfirm) {
// 		    if (isConfirm) {
// 		      form.submit();
// 		    }
// 		  });
// 		});
	</script>
</body>
</html>