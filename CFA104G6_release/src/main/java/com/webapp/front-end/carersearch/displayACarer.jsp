<%@page import="com.collection.model.CollectionService"%>
<%@page import="com.carermem.model.CarerMemVO"%>
<%@page import="com.utils.DecodeCookieUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>

<%
int id = (int) DecodeCookieUtil.getMemId(request);
//如果要帶到下一頁
HttpSession session1 = request.getSession();
int memId = (int)session1.getAttribute("memId");
%>
<%
CarerMemVO carerMemVO = (CarerMemVO) request.getAttribute("carerVO");
CollectionService collectSvc = new CollectionService();
Boolean checkCollected = collectSvc.isCollected(memId, carerMemVO.getCarerID());
String checkCollectedStr = collectSvc.isCollectedStr(memId, carerMemVO.getCarerID());

%>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>照護員資料 - listOneCarer.jsp</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/healthcare.png" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Font Awesome icons (free version)-->
<script type="text/javascript" src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link type="text/css"
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link type="text/css"
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link type="text/css" href="../css/styles.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.twodiv {
	display: -webkit-box;
}

.div1 {
	margin: 10px 10px 10px 10px;
	padding: 50px;
	border: 1px solid rgb(245, 164, 13);
	border-radius: 10px;
	background-color: rgb(233, 226, 190);
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
</style>

</head>
<body id="page-top">

	<section class="page-section bg-primary" id="services">
		<div class="div1">
			<div>
				<h4>
					<a href="<%=request.getContextPath()%>/front-end/carersearch/carerSearch.jsp">回搜尋頁面 您的id為<%=memId %></a>
				<a href="javascript:history.back()">回上一頁</a>
				</h4>
			</div>
			<div>
				<h2>${carerVO.searchName}${carerVO.searchGender}</h2>
			</div>
			<div>
			    <img src="data:image/jpg;base64,${fileVO.fileContentString}" width="200" height="200"/>
			</div>
			<div>
				<div><b>簡介</b></div>
				<div>${carerVO.intro}</div>
			</div>
			<div>
				<div><b>服務地區</b></div>
				<div>${carerVO.searchCounty}${carerVO.searchDist}</div>
			</div>

			<div>
				<div><b>照護證照</b></div>
				<div>${certi}</div>
			</div>

			<div>
				<div><b>照護技能</b></div>
				<div>
				【基本技能】
				</div>
				<div>
				${normalSkill}</div>
				<div>
				【進階技能】
				</div>
				<div>
				${proSkill}
				</div>
			</div>
			
			<div>
				<div><b>服務類型</b></div>
				<div class="serviceType">${carerVO.serviceType}</div>
			</div>

			<div>
				<div>
					<b>費用</b>
					<ul>
						<li>未滿12小時之時薪：${Math.round(carerVO.priceHour)} 元</li>
						<li>12-24小時之時薪：${Math.round(carerVO.priceHalfday)} 元</li>
						<li>24小時以上之時薪：${Math.round(carerVO.priceDay)} 元</li>
					</ul>
				</div>
			</div>
			
			<div>
			
			
			</div>
			<b><%=checkCollectedStr %></b>
<%-- 			<%=checkCollected %> --%>
			<%--收藏照護員 --%>
			<c:choose>
				<c:when test="<%=checkCollected%>">
				<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/carersearch/collection">
				<input type="hidden" name="memId" value="<%=memId%>"> 
				<input type="hidden" name="carerId" value="${carerVO.carerID}"> 
				<input type="hidden" name="action" value="delete"> 
				<input type="submit" value="取消收藏" class="button">
				</FORM>
				</c:when>
				<c:otherwise>
				<form action="<%=request.getContextPath()%>/carersearch/collection" method="post">
		        <input type="hidden" name="memId" value="<%=memId%>">
		        <input type="hidden" name="carerId" value="${carerVO.carerID}">
		        <input type="hidden" name="action" value="add">
		        <button type="submit"><i class="bi bi-star-fill"></i>收藏照護員</button>
			    </form>
				
				</c:otherwise>
			
			</c:choose>
			<div>
			<%--串接至刊登需求單 --%>
			
			 <form action="<%=request.getContextPath()%>/front-end/careRequest/careRequest" method="post">
		        <input type="hidden" name="carerId" value="${carerVO.carerID}">
		        <input type="hidden" name="carerName" value="${carerVO.searchName}${carerVO.searchGender}">
		        <input type="hidden" name="action" value="goto_post_request">
		        <input type="submit" value="刊登需求單">
		    </form>
		    
			</div>
			

		</div>
	</section>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="../js/spilitstring.js"></script>
</body>
</html>