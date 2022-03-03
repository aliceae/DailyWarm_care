<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.List"%>

<%@page import="com.service.model.ServiceService"%>
<%@page import="com.servicetab.model.ServiceTabService"%>
<%@page import="com.service.model.ServiceVO"%>
<%@page import="com.servicetab.model.ServiceTabVO"%>

<%
List<ServiceVO> serviceList = new ServiceService().getServiceList();
List<ServiceTabVO> serviceTabList = new ServiceTabService().getServiceTabList();

pageContext.setAttribute("serviceList", serviceList);
pageContext.setAttribute("serviceTabList", serviceTabList);
%>

<html>
<head>
<title>Daily Warm照護媒合</title>
<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link rel="stylesheet" type="text/css" href="datetimepicker/jquery.datetimepicker.css" />
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/jquery.datetimepicker.full.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/healthcare.png" />
<!-- Bootstrap Icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
<style>
.text_center {
	text-align: center;
}

.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
</head>
<body>
<!-- Navigation 導覽列 -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container px-4 px-lg-0">
			<a class="navbar-brand" href="#page-top">Daily Warm</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto my-2 my-lg-0">

					<!-- 首頁 -->
					<li class="nav-item"><a class="nav-link" href="#">首頁</a></li>
					<!-- 關於我們 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							關於我們 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">最新消息</a></li>
							<li><a class="dropdown-item" href="#">網站簡介</a></li>
							<li><a class="dropdown-item" href="#">常見問題</a></li>
						</ul></li>
					<!-- 服務項目 -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							服務項目 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">照護</a></li>
							<li><a class="dropdown-item" href="#">餐點</a></li>
							<li><a class="dropdown-item" href="#">派車</a></li>
						</ul></li>
					<!-- 通知 -->
					<li class="nav-item"><a class="nav-link" href="#">通知</a></li>
					<!-- 會員 -->
					<li class="nav-item dropdown"><a class="nav-link"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fas fa-user-circle fa-2x "></i>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">切換帳號</a></li>
							<li><a class="dropdown-item" href="#">申請成為照護員</a></li>
							<li><a class="dropdown-item" href="#">登出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<main style="background-color: #F0DC84;">
		<div>
			<a href="<%= request.getContextPath() %>/front-end/careRequest/requestMgt.jsp">返回照護需求單管理</a><br>
		</div>
		<div style="margin-left: 20%; margin-right: 20%;">
			<div class="text_center">
				<h1>更改需求</h1>
			</div>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<form action="careRequest" method="post" style="height: 600px;">
				<div style="display: flex; height: 550px;">
					<div style="flex: 1; overflow:auto;  padding-top: 3%; border-radius: 20px 0px 0px 20px; background-color: #F7F3E3; border: 1px solid #000; border-top: none;border-bottom: none;border-left: none;">
						<div style="margin-left: 10%;">
							<label for="name">姓名：${careRequestVO.patientName}</label><br>
<!-- 	                        <input type="text" id="name" disabled  -->
<%-- 	                        	value="${careRequestVO.patientName}"><br> --%>
							
	                        <label>性別：${(careRequestVO.patientGender == 0) ? '男' : '女'}</label><br>
<%-- 							<span>${(careRequestVO.patientGender == 0) ? '男' : '女'}</span><br> --%>
	                        
							<label for="age">年紀：${careRequestVO.patientAge}</label><br>
<!-- 	                        <input type="number" id="age" disabled  -->
<%-- 	                        	value="${careRequestVO.patientAge}"><br> --%>
							
							<label>服務地點類型</label><br>						
	                        <input type="radio" id="home" name="serviceType" value="0"
	                        	${(careRequestVO.serviceType == 0) ? 'checked' : ''}>
	                        <label for="home">居家照護</label>
	                        <input type="radio" id="hospital" name="serviceType" value="1"
	                        	${(careRequestVO.serviceType == 1) ? 'checked' : ''}>
	                        <label for="hospital">醫院看護</label><br>
	                        	
							<label for="address">地址</label><br>
	                        <input type="text" id="address" name="patientAddr" style="width: 300px;"
	                        	value="${careRequestVO.patientAddr}"><br>
							
							<label for="start_dateTime">服務開始時間</label><br>
	                        <input type="text" id="start_dateTime" name="startTime" autocomplete="off" style="width: 175px;"
	                        	value="${careRequestVO.startTime.toString().substring(0, 16)}"><br>
	                        <label for="end_dateTime">服務結束時間</label><br>
							<input type="text" id="end_dateTime" name="endTime" autocomplete="off" style="width: 175px;"
								value="${careRequestVO.endTime.toString().substring(0, 16)}"><br>
							
							<label for="note">備註</label><br>
	                        <textarea id="note" name="note" placeholder="身體狀況與注意事項等等..." style="resize: none; width: 300px; height: 100px">${careRequestVO.note}</textarea>
                        </div>
					</div>
					<div style="flex: 1; overflow:auto; border-radius: 0px 20px 20px 0px; background-color: #F7F3E3;">
						<ol style="margin-top: 20px">
							<c:forEach var="serviceVO" items="${serviceList}">
								<li>${serviceVO.serviceName}
									<ul>
										<c:forEach var="serviceTabVO" items="${serviceTabList}">
											<c:set var="no" value="${serviceTabVO.serviceTabNo}" />
											<c:if test="${serviceTabVO.serviceNo==serviceVO.serviceNo}">
												<li style="list-style-type: none;">
													<input type="checkbox" id="${no}" name="serviceTabNo" value="${no}"> 
													<label for="${no}">${serviceTabVO.serviceTabName}</label>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ol>
					</div>
				</div>
				<div class="text_center" style="height: 50px;">
				 	<input type="hidden" name="requestId" value="${careRequestVO.requestId}">
				 	<input type="hidden" name="patientName" value="${careRequestVO.patientName}">
				 	<input type="hidden" name="patientGender" value="${careRequestVO.patientGender}">
				 	<input type="hidden" name="patientAge" value="${careRequestVO.patientAge}">
				 	<input type="hidden" name="action" value="edit_request">
                    <button type="submit" style="border-radius: 5px; border-color: #B68D40; height: 50px; width: 100%; background-color: #F4EBD0;">更改</button>
                </div>
			</form>
		</div>
	</main>
	
	<!-- Footer -->
	<footer class="bg-light py-5">
		<div class="container px-4 px-lg-5">
			<div class="small text-center text-muted">Copyright &copy; 2021
				- Daily Warm</div>
		</div>
	</footer>
	
	<script type="text/javascript">
		const address = document.querySelector('#address');
		
		document.querySelector('#home').addEventListener('change', () => {
	    	address.value = '';
	    	address.removeAttribute('placeholder');
	    });

	    document.querySelector('#hospital').addEventListener('change', () => {
	    	address.value = '';
	    	address.setAttribute('placeholder', '填寫縣市、醫院名稱、病房號碼、病床號碼');
	    });
	
		<c:forEach var="requestTabPVO" items="${requestTabList}">
			document.querySelector('#${requestTabPVO.serviceTabNo}').setAttribute('checked', true);
		</c:forEach>
		
		<c:forEach var="no" items="${requestTabArray}">
			document.querySelector('#${no}').setAttribute('checked', true);
		</c:forEach>

		// datetimepicker
		var min = new Date(new Date().getTime() + 3 * 86400 * 1000); // 三天後
		var max = new Date(new Date().getTime() + 60 * 86400 * 1000); // 兩個月後

		$.datetimepicker.setLocale('zh'); // kr ko ja en
		$(function() {
			$('#start_dateTime').datetimepicker(
					{
						theme : 'dark',
						format : 'Y-m-d H:i',
						step : 60,
						minDate : min,
						onShow : function() {
							this.setOptions({
								maxDate : $('#end_dateTime').val() ? $(
										'#end_dateTime').val() : false
							})
						}
					});
			$('#end_dateTime').datetimepicker(
					{
						theme : 'dark',
						format : 'Y-m-d H:i',
						step : 60,
						maxDate : max,
						onShow : function() {
							this.setOptions({
								minDate : $('#start_dateTime').val() ? $(
										'#start_dateTime').val() : false
							})
						}
					});
		});
	</script>
</body>

</html>