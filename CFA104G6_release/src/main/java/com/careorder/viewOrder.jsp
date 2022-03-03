<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>A6</title>
<style>
.text_center {
	text-align: center;
}
</style>
</head>
<body>
	<main style="background-color: rgb(136, 143, 122);">
		<div>
			<!-- back A4 -->
			<a href="">訂單管理</a>
		</div>
		<div class="text_center">
			<h1>訂單資訊</h1>
		</div>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<div
			style="display: flex; margin-left: 15%; margin-right: 15%; height: 400px;">
			<div style="flex: 1; background-color: rgb(75, 75, 99);">
				<h2 class="text_center" style="height: 10%;">照護員</h2>
				<div style="overflow: auto; word-break: break-all; height: 88%;">
					<img src="data:image/jpg;base64,${fileVO.fileContentString}" width="50%" style="margin-left: 25%;"/>

					<div style="height: 2%"></div>

					<ul>
						<li>姓名：<a href="<%=request.getContextPath()%>/carer/carersearch?action=displayACarer&carerId=${carerVO.carerID}">${carerVO.searchName}</a></li>

						<li>
							<c:if test="${carerVO.searchGender == 0}">性別：男</c:if>
							<c:if test="${carerVO.searchGender == 1}">性別：女</c:if>
						</li>

						<li>年紀：${carerVO.searchAge}</li>

						<li>電話：${carerVO.phoneNumber}</li>

						<li>信箱：${carerVO.emailAccount}</li>
					</ul>
				</div>
			</div>
			<div style="flex: 1; background-color: rgb(116, 62, 83);">
				<h2 class="text_center" style="height: 10%;">服務對象</h2>
				<div style="overflow: auto; word-break: break-all; height: 88%;">
					<ul>
						<li>姓名：${careOrderSVO.patientName}</li>

						<li>
							<c:if test="${careOrderSVO.patientGender == 0}">性別：男</c:if> 
							<c:if test="${careOrderSVO.patientGender == 1}">性別：女</c:if>
						</li>

						<li>年紀：${careOrderSVO.patientAge}</li>

						<li>服務地點類型： <c:if test="${careOrderSVO.serviceType == 0}">
       							居家照護
      						</c:if> <c:if test="${careOrderSVO.serviceType == 1}">
       							醫院看護
     						</c:if>
						</li>

						<li>服務地址：${careOrderSVO.patientAddr}</li>

						<li>開始時間：${careOrderSVO.startTime}</li>

						<li>結束時間：${careOrderSVO.endTime}</li>

						<li>訂單狀態： <c:if test="${careOrderSVO.status == 0}">
       							已取消
      						</c:if> <c:if test="${careOrderSVO.status == 1}">
       							待執行
      						</c:if> <c:if test="${careOrderSVO.status == 2}">
       							執行中
      						</c:if> <c:if test="${careOrderSVO.status == 3}">
       							已結單
      						</c:if> <c:if test="${careOrderSVO.status == 4}">
       							訂單完成
      						</c:if>
						</li>

						<li>訂單金額：${careOrderSVO.amount}</li>

						<li>備註：${careOrderSVO.note}</li>
					</ul>
				</div>
			</div>
			<div style="flex: 1; background-color: rgb(140, 141, 85);">
				<h2 class="text_center" style="height: 10%;">服務項目</h2>
				<div style="overflow: auto; word-break: break-all; height: 88%;">
					<ul>
						<c:forEach var="requestTabPVO" items="${requestTabList}">
							<li>${requestTabPVO.serviceTabName}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div style="height: 50px;"></div>
	</main>
</body>
</html>