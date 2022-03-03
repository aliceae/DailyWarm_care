<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.List"%>

<%@page import="com.utils.DecodeCookieUtil"%>
<%@page import="com.carerequest.model.CareRequestService"%>
<%@page import="com.carerequest.model.CareRequestPVO"%>

<%
// int memId = (int) DecodeCookieUtil.getMemId(request);
int memId = 3344; 	

List<CareRequestPVO> careRequestList = new CareRequestService().getRequestList(memId); // 測試

pageContext.setAttribute("careRequestList", careRequestList);
%>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Daily Warm照護媒合</title>
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
.hide {
	display: none;
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

	<section class="pt-5 pb-5" style="background-color: #D0B49F;">
		<div class="container">
			<div class="row w-100">
				<div class="col-lg-12 col-md-12 col-12">
					<h1 class="mb-2 mt-5 fw-bold">照護清單</h1>
<!-- 					<p>注意事項：若服務開始前尚無挑選應徵照護員，需求單將自動關閉</p> -->
					<div>
						<span>需求單管理</span>
						<span>｜</span>
						<a href="<%= request.getContextPath() %>/front-end/careOrder/orderMgt.jsp"><span>訂單管理</span></a>
					</div>
					<div>
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>

						<div class="table-responsive">
							<table class="table table-striped text-start">
								<!-- TODO 排序 -->
								<thead>
									<tr>
										<th>需求單編號</th>
										<th>需求者</th>
										<th>開始時間</th>
										<th>結束時間</th>
										<th>狀態</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
								<%@ include file="page1.file" %>
									<c:forEach var="careRequestPVO" items="${careRequestList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
										<c:set var="careApplyList" value="${careRequestPVO.careApplyList}" />
										<c:set var="requestId" value="${careRequestPVO.requestId}" />
										<c:set var="size" value="${careApplyList.size()}" />
										<tr>
											<td><a
												href="careRequest?action=view_request&requestId=${requestId}">${requestId}</a></td>

											<td>${careRequestPVO.patientName}</td>

											<td>${careRequestPVO.startTime.toString().substring(0, 16)}</td>

											<td>${careRequestPVO.endTime.toString().substring(0, 16)}</td>

											<c:if test="${careRequestPVO.status == 0}">
												<td>已取消</td>

												<td></td>
											</c:if>
											<c:if test="${careRequestPVO.status == 2}">
												<c:if test="${size == 0}">
													<td>尚無應徵</td>
												</c:if>
												<c:if test="${size > 0}">
													<td><button onclick="choose(${requestId})">挑選照護員(${size})</button></td>
												</c:if>

												<td>
													<form action="careRequest" method="post">
														<input type="hidden" name="requestId" value="${requestId}">
														<input type="hidden" name="action" value="cancel_request">
														<input type="submit" value="❌取消需求">
													</form>
													<form action="careRequest" method="post">
														<input type="hidden" name="requestId" value="${requestId}">
														<input type="hidden" name="action" value="goto_edit_request"> 
														<input type="submit" value="✏️編輯需求">
													</form>
												</td>
											</c:if>
										</tr>
										<c:if test="${(careRequestPVO.status == 2) and (size > 0)}">
											<!-- <tr class="hide"> -->
											<tr class="hide" id="choose${requestId}">
												<th colspan="6">
													<button onclick="off(${requestId})" style="float: right">❌</button>
													<div style="background-color: #B1D8B7;">
														<table border="1" class="table table-striped text-start" style=" width: 900px; margin: auto;">
															<tr>
																<th>姓名</th>
																<th>性別</th>
																<th>電話</th>
																<th>信箱</th>
																<th>收費</th>
																<th>
																	<form action="careRequest" method="post">
																		<input type="hidden" name="requestId"
																			value="${requestId}"> 
																		<input type="hidden" name="action" value="refuse_all_apply"> 
																		<input type="submit" value="❌拒絕全部">
																	</form>
																</th>
															</tr>
															<c:forEach var="careApplyPVO" items="${careApplyList}">
																<tr>
																	<!-- TODO 接A1頁面 -->
																	<td><a href="">${careApplyPVO.memName}</a></td>
																	<td>${(careApplyPVO.memGender == 0) ? '男' : '女'}</td>
																	<td>${careApplyPVO.memPhone}</td>
																	<td>${careApplyPVO.memEmail}</td>
																	<td>${careApplyPVO.cost.intValue()}</td>
																	<td>
																		<!-- payment -->
																		<form action="careRequest" method="post">
																			<input type="hidden" name="requestId"
																				value="${requestId}"> 
																			<input type="hidden" name="carerId" 
																				value="${careApplyPVO.carerId}">
																			<input type="hidden" name="amount"
																				value="${careApplyPVO.cost}"> 
																			<input type="hidden" name="action" value="goto_payment">
																			<input type="submit" value="✔️付款">
																		</form>
																		
																		<form action="careRequest" method="post">
																			<input type="hidden" name="requestId"
																				value="${requestId}"> 
																			<input type="hidden" name="carerId" 
																				value="${careApplyPVO.carerId}">
																			<input type="hidden" name="action" value="refuse_apply"> 
																			<input type="submit" value="❌拒絕">
																		</form>
																	</td>
																</tr>
															</c:forEach>
														</table>
													</div>
												</th>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<%@ include file="page2.file" %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="bg-light py-5">
		<div class="container px-4 px-lg-5">
			<div class="small text-center text-muted">Copyright &copy; 2021
				- Daily Warm</div>
		</div>
	</footer>

	<script type="text/javascript">
		function choose(id) {
			document.querySelector('#choose' + id).removeAttribute('class');
		}
		
		function off(id) {
			document.querySelector('#choose' + id).setAttribute('class', 'hide');
		}
	</script>
</body>
</html>