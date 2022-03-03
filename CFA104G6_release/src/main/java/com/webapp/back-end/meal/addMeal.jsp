<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.meal.model.vo.*"%>
<%@ page import="com.meal.model.service.*"%>

<%
MealVO mealVO = (MealVO) request.getAttribute("mealVO");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>新增餐點資料</title>

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
										<img class="rounded-circle" src="../img/undraw_profile_2.svg"
											alt="...">
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
					<h1 class="h3 mb-2 text-gray-800">餐點資料管理</h1>
					<p class="mb-4">
						備註：未經審核、照護需求者 <a target="_blank" href="https://datatables.net">official
							DataTables documentation</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"
							style="margin: 5px; padding: 5px; display: flex; justify-content: space-between; align-items: center;">
							<div>
								<h6 class="m-0 font-weight-bold text-primary divleft">新增餐點資料
								</h6>
							</div>
							<div>
								<a href="listAllMeal.jsp">回餐點首頁 </a>
							</div>

						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<FORM METHOD="post"
										ACTION="<%=request.getContextPath()%>/back-end/meal/meal.do"
										name="form1" enctype="multipart/form-data">
										<tr>
											<td style="white-space: nowrap">餐點編號:</td>
											<td><input type="TEXT" name="mealno" size="45"
												maxlength="5"></td>
										</tr>
										<tr>
											<td>餐點名稱:</td>
											<td><input type="TEXT" name="mealname" size="45"
												maxlength="30"></td>
										</tr>
										<tr>
											<td>餐點金額:</td>
											<td><input name="mealprice" id="mealprice" type="number"
												maxlength="10"></td>
										</tr>
										<tr>
											<td>餐點介紹:</td>
											<td><input type="TEXT" name="mealintro" size="500"
												maxlength="500" /></td>
										</tr>
										<tr>
											<td style="white-space: nowrap">餐點照片1:</td>
											<td><input type="file" name="pic" id="addimg1" value="1"
												onchange="showImg(this)"> <img id="img1"></td>
										</tr>
										<tr>
											<td>餐點照片2:</td>
											<td><input type="file" name="pic" id="addimg2" value="2"
												onchange="showImg(this)"> <img id="img2"></td>
										</tr>
										<tr>
											<td>餐點照片3:</td>
											<td><input type="file" name="pic" id="addimg3" value="3"
												onchange="showImg(this)"> <img id="img3"></td>
										</tr>
										<div style="display: inline-block">
											<input type="hidden" name="action" value="insert"> <input
												type="submit" value="新增" style="margin-right: 5px"
												class="m-0 font-weight-bold text-primary divleft">
										</div>
									</FORM>
									<script type="text/javascript">
										function showImg(item) {
											let img = item.nextElementSibling;
											img.src = URL
													.createObjectURL(item.files[0]);
											img.width = 300;
											img.height = 225;
										}
									</script>

									<jsp:useBean id="mealSvc" scope="page"
										class="com.meal.model.service.MealService" />
								</table>

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

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../js/demo/datatables-demo.js"></script>

</body>

</html>