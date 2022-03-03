<%@page import="com.file.model.FileVO"%>
<%@page import="com.file.model.FileService"%>
<%@page import="com.carermemapplymgt.model.CarerMemApplyMgtVO"%>
<%@page import="com.carermemapplymgt.model.CarerMemApplyMgtService"%>
<%@page import="com.member.model.dao.impl.MemberDaoImpl"%>
<%@page import="com.member.model.vo.MemberVO"%>
<%@page import="com.member.model.dao.MemberDao"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="com.common.model.service.JWTokenUtils"%>

<%
CarerMemApplyMgtService cmamSvc = new CarerMemApplyMgtService();
CarerMemApplyMgtVO carerMemApplyMgtVo = (CarerMemApplyMgtVO) request.getAttribute("carerMemApplyMgtVo");
pageContext.setAttribute("carerMemApplyMgtVo", carerMemApplyMgtVo);
%>

<jsp:useBean id="photoresult" scope="request"
	type="java.util.List<FileVO>" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>申請者資料</title>

<!-- Custom fonts for this template -->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="../vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>
<style>
#table1 td {
	padding: 10px 0;
}

#table1 tr:nth-child(even) {
	background: #ffdea08c;
}
</style>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="../index.html">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Daily Warm照護管理後台</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">會員資料管理</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../member/memberList.html"> <i class="fas fa-fw fa-table"></i>
					<span>一般會員管理</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">照護管理</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../carermgt/carerMgt.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>照護員管理</span>
			</a></li>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../carermemapplymgt/CarerMemApplyMgt.jsp"> <i
					class="fas fa-fw fa-table"></i> <span>照護員申請審核</span>
			</a></li>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../careorder/careOrder.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>照護訂單管理</span>
			</a></li>



			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">派車管理</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../driver/driver.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>司機基本資料管理</span>
			</a></li>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../driverschedule/driverSchedule.jsp"> <i
					class="fas fa-fw fa-table"></i> <span>司機班表管理</span>
			</a></li>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../driveorder/driveorder.html"> <i
					class="fas fa-fw fa-table"></i> <span>派車訂單管理</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">送餐管理</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../meal/listAllMeal.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>餐點資料管理</span>
			</a></li>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../meal/mealOrder.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>餐點訂單管理</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">後台功能權限管理</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="../auth/auth.jsp">
					<i class="fas fa-fw fa-table"></i> <span>權限功能群組管理</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="../auth/empAuth.jsp"> <i class="fas fa-fw fa-table"></i> <span>員工權限群組管理</span>
			</a></li>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">員工管理</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="../emp/emp.jsp">
					<i class="fas fa-fw fa-table"></i> <span>員工資料維護</span>
			</a></li>
			<!-- Heading -->
			<div class="sidebar-heading">前台管理</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../infomanage/news.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>最新消息</span>
			</a></li>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../infomanage/intro.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>服務簡介</span>
			</a></li>
			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link"
				href="../infomanage/faq.jsp"> <i class="fas fa-fw fa-table"></i>
					<span>常見問題</span>
			</a></li>


			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="../img/undraw_profile_1.svg"
											alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="	" alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="../img/undraw_profile_3.svg"
											alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas
									McGee</span> <img class="img-profile rounded-circle"
								src="../img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">申請者資料</h1>
					<h5>
						<a href="CarerMemApplyMgt.jsp">返回訂單列表</a>
					</h5>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"
							style="justify-content: space-between; display: flex"></div>
						<div class="card-body">
							<%-- 錯誤表列 --%>
							<c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>
							<div class="table-responsive"
								style="width: 70%; margin: 0px auto">
								<form method="post" id="form"
									action="<%=request.getContextPath()%>/back-end/carermemapplymgt/carerMemApplyMgt.do">
									<table class="table table-bordered" id="dataTable">
										<table id="table1" style="color: black" width="100%"
											cellspacing="0">
											<tr>
												<td width="150px">申請單號:</td>
												<td width="250px">${carerMemApplyMgtVo.applyID}</td>
											</tr>
											<tr>
												<td>申請者帳號:</td>
												<td>${carerMemApplyMgtVo.memAcct}</td>
											</tr>
											<tr>
												<td>申請者姓名:</td>
												<td>${carerMemApplyMgtVo.memName}</td>
											</tr>
											<tr>
												<td>申請者性別:</td>
												<c:if test="${carerMemApplyMgtVo.memGender == 0}">
													<td>男</td>
												</c:if>
												<c:if test="${carerMemApplyMgtVo.memGender == 1}">
													<td>女</td>
												</c:if>
											</tr>
											<tr>
												<td>申請者年齡:</td>
												<td>${carerMemApplyMgtVo.memAge}</td>
											</tr>
											<tr>
												<td>申請者電話:</td>
												<td>${carerMemApplyMgtVo.memPhone}</td>
											</tr>
											<tr>
												<td>申請者Email:</td>
												<td>${carerMemApplyMgtVo.memEmail}</td>
											</tr>
											<tr>
												<td>申請者聯絡地址:</td>
												<td>${carerMemApplyMgtVo.memAddr}</td>
											</tr>
											<tr>
												<td>照護服務類型:</td>
												<c:if test="${carerMemApplyMgtVo.serviceType == 0}">
													<td>居家照護</td>
												</c:if>
												<c:if test="${carerMemApplyMgtVo.serviceType == 1}">
													<td>醫院看護</td>
												</c:if>
												<c:if test="${carerMemApplyMgtVo.serviceType == 2}">
													<td>居家照護及醫院看護</td>
												</c:if>
											</tr>
											<tr>
												<td>照護服務地區:</td>
												<td>${carerMemApplyMgtVo.serviceDistNo}</td>
											</tr>
											<tr>
												<td>提供的服務:</td>
												<td>
													<div>【基本技能】</div>
													<div>${normalSkill}</div>
													<div>【進階技能】</div>
													<div>${proSkill}</div>
												</td>
											</tr>
											<tr>
												<td>未滿12小時之時薪:</td>
												<td>${carerMemApplyMgtVo.priceHour.intValue()}</td>
											</tr>
											<tr>
												<td>12-24小時之時薪:</td>
												<td>${carerMemApplyMgtVo.priceHalfday.intValue()}</td>
											</tr>
											<tr>
												<td>24小時以上之時薪:</td>
												<td>${carerMemApplyMgtVo.priceDay.intValue()}</td>
											</tr>
											<tr>
												<td>簡介:</td>
												<td>${carerMemApplyMgtVo.intro}</td>
											</tr>
											<tr>
												<td>銀行代碼:</td>
												<td>${carerMemApplyMgtVo.bankCode}</td>
											</tr>
											<tr>
												<td>銀行帳號:</td>
												<td>${carerMemApplyMgtVo.bankAcct}</td>
											</tr>
											<tr>
												<td>申請時間:</td>
												<td>${carerMemApplyMgtVo.createTime.toString().substring(0, 16)}</td>
											</tr>

											<table border="1" style="color: black">
												<tr>證件照片:
												</tr>
												<tr>
													<th>檔案名稱</th>
													<th>照片</th>
												</tr>
												<c:forEach var="fileVo" items="${photoresult}">
													<tr>
														<td>${fileVo.fileTypeName}</td>
														<td><img
															src="data:image/jpg;base64,${fileVo.applyFileContent}"
															width="325" height="225" /></td>
													</tr>
												</c:forEach>
											</table>

											<br>
											<h5>
												<a href="CarerMemApplyMgt.jsp">返回訂單列表</a>
											</h5>
											<br>
											<input type="hidden" name="applyID"
												value="${carerMemApplyMgtVo.applyID}">
											<input type="button" id="success" value="審核成功"></input>
											<input type="button" id="fail" value="審核失敗"></input>
											<input type="hidden" id="apply" name="action"></input>

										</table>
									</table>
								</form>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	const apply = document.querySelector('#apply');
	const form = document.querySelector('#form');

	document.querySelector('#success').addEventListener('click', () => {
// 	    alert('成功');

	    apply.value = 'success';

	    form.submit();
	});

	document.querySelector('#fail').addEventListener('click', () => {
// 	    alert('失敗');

	    apply.value = 'fail';

	    form.submit();
	});
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->

	<!-- Page level custom scripts -->

</body>

</html>