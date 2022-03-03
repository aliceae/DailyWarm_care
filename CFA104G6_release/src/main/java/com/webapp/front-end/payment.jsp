<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>付款頁面-Daily Warm照護媒合</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/front-end/assets/healthcare.png" />
<!-- Bootstrap Icons-->
<link type="text/css" rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
<!-- Font Awesome icons (free version)-->
<script type="text/javascript"
	src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
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
<link type="text/css"
	href="<%=request.getContextPath()%>/front-end/css/styles.css"
	rel="stylesheet" />
	
<!-- sweet alert css -->
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />	
	
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

#card-inline {
	display:inline-block;
}
</style>
</head>
<body>
<body id="page-top">
	<!-- Navigation 導覽列 -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top1 py-3"
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
					<li class="nav-item dropdown"><a class="nav-link"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <i class="fas fa-user-circle fa-2x "></i>
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">切換帳號</a></li>
							<li><a class="dropdown-item" href="#">登出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Payment -->
	<section class="page-section bg-primary" id="services">
		<div class="div1">
	<h1>付款頁面</h1>
		<%-- errorMessage --%>
			<c:if test="${not empty errorMsgs}">
				<div>
				<font style="color:red"><span>&#9888;</span> 請檢查欄位</font>
				<ol>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ol>
				</div>
			</c:if>
			
			<FORM METHOD="post" ACTION="payment">
			<div>
				<label class="control-label col-sm-2">付款人姓名：</label>
				<input type="text" class="form-control" name="memName" value"{動態帶姓名過來}" >
			
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">信用卡卡號:</label>
				<div class="col-sm-10">
					<%-- take out: class="form-control" --%>
					<input type="text" class="form-control" id="card-inline" style="width: 62px" name="firstBlockOfCard"
						maxlength="4" name="cdno1" size="5" onkeyup="cdno(1);"> <span id="card-inline">─</span>
					<input type="text" class="form-control" id="card-inline" style="width: 62px" name="secondBlockOfCard"
						maxlength="4" name="cdno2" size="5" onkeyup="cdno(2);"> <span id="card-inline">─</span>
					<input type="text" class="form-control" id="card-inline" style="width: 62px" name="thirdBlockOfCard"
						maxlength="4" name="cdno3" size="5" onkeyup="cdno(3);"> <span id="card-inline">─</span>
					<input type="text" class="form-control" id="card-inline" style="width: 62px" name="fourthBlockOfCard"
						maxlength="4" name="cdno4" size="5">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2"></label>
				<div class="col-sm-10">
					<label class="radio-inline"> <input type="radio"
						name="inlineRadioOptions" id="inlineRadio1" value="option1"
						checked="">VISA
					</label> <label class="radio-inline"> <input type="radio"
						name="inlineRadioOptions" id="inlineRadio2" value="option2">
						MasterCard
					</label> <label class="radio-inline"> <input type="radio"
						name="inlineRadioOptions" id="inlineRadio3" value="option3">
						JCB
					</label>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">信用卡截止日:</label>
				<div class="col-sm-10">
					<select class="form-control" name="expiryMonth">
						<option value="" selected="">請選擇</option>

						<option value="1">1</option>

<!-- 						<option value="2">2</option> -->

<!-- 						<option value="3">3</option> -->

<!-- 						<option value="4">4</option> -->

<!-- 						<option value="5">5</option> -->

<!-- 						<option value="6">6</option> -->

<!-- 						<option value="7">7</option> -->

<!-- 						<option value="8">8</option> -->

<!-- 						<option value="9">9</option> -->

<!-- 						<option value="10">10</option> -->

<!-- 						<option value="11">11</option> -->

<!-- 						<option value="12">12</option> -->

					</select>月 <select class="form-control" name="expire_year">
						<option value="">請選擇</option>

						<option value="2022">2022</option>

					</select>年
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">安全驗證碼:</label>
				<div class="col-sm-10">
					<input type="text" name="expire_safe" class="form-control"
						placeholder="請輸入安全驗證碼" maxlength="5">
				</div>
			</div>
			
<!-- 				<div class="form-group"> -->
<!-- 					<div class="col-sm-offset-2 col-sm-10"> -->
<!-- 				         <button type="button" id="btn" class="order" style="display: inline-block;">確認付款</button> -->
<!-- 	                </div> -->
<!-- 				</div>		 -->
				
				<div>
					<label class="control-label col-sm-2">付款金額：</label>
					<div class="col-sm-10">
					<input type="text" name="expire_safe" class="form-control"
						value="${amount}" maxlength="5">
					</div>
				</div>
				
				<input type="hidden" name="action" value="${location}">
				<input type="submit" class="button" id="button" value="送出">

	</FORM>
			
		</div>
	</section>

	<!-- Footer -->
	<footer class="bg-light py-5">
		<div class="container px-4 px-lg-5">
			<div class="small text-center text-muted">Copyright &copy; 2021
				- Daily Warm</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- SimpleLightbox plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
	<!-- Core theme JS-->
	<script src="<%=request.getContextPath()%>/front-end/js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<%/* <script type="text/javascript"> -->
var btn = document.getElementById('btn');
btn.addEventListener('click', function() {
// $("#button").submit(function(e, params){
// 	var localParams = params || {};
	
//     if (!localParams.send) {
//         e.preventDefault();
//     }
// $("#button").submit(()=>{
    
    swal({
        title: "確定付款？",
        html: "按下確定鍵以付款",
        type: "question", // type can be "success", "error", "warning", "info", "question"
        showCancelButton: true,
        showCloseButton: true,
    }).then(function(result) {
        if (result) {
            swal("完成!", "已完成付款", "success");
        }
    }, function(dismiss) { // dismiss can be "cancel" | "overlay" | "esc" | "cancel" | "timer"
        swal("取消", "已取消付款", "error");
    }).catch(swal.noop);
});

</script> */%>

<script type="text/javascript">
function cdno(arg){
    if(eval('document.myForm.cdno'+arg+'.value.length') == 4){
		   eval('document.myForm.cdno'+(arg+1)+'.focus()');
	}
}
    
function check(arg){
			
	if(arg.receiver.value==""){
		arg.receiver.focus();
		swal({title:'請輸入收件人姓名!', type:"error"});
		return false;
	}
	if(arg.zone1.value.length == 0){
		arg.zone1.focus();
		swal({title:'請選擇縣市!', type:"error"});
		return false;
	}
	if(arg.zone2.value.length == 0){
		arg.zone2.focus();
		swal({title:'請選擇鄉鎮市區!', type:"error"});
		return false;
	}
	if(arg.subaddress.value==""){
		arg.subaddress.focus();
		swal({title:'請輸入地址!', type:"error"});
		return false;
	}
	var re =/^09\d{2}\d{6}$/;
	if(!re.test(arg.rec_phone.value)){
		arg.rec_phone.focus();
		swal({title:'請輸入正確的手機號碼', type:"error"});
		return false;
		
	}
	if(arg.cdno1.value.length != 4 || arg.cdno2.value.length != 4 || arg.cdno3.value.length != 4 || arg.cdno4.value.length != 4){
		arg.cdno1.focus();
		swal({title:'請輸入完整的信用卡號碼', type:"error"});
		return false;
	}
	if(arg.expire_month.value.length == 0){
		arg.expire_month.focus();
		swal({title:'請選擇信用卡截止月', type:"error"});
		return false;
	}
	if(arg.expire_year.value.length == 0){
		arg.expire_year.focus();
		swal({title:'請選擇信用卡截止年', type:"error"});
		return false;
	}
	if(arg.expire_safe.value.length==0  || arg.expire_safe.value.length <=2){
		arg.expire_safe.focus();
		swal({title:'請輸入正確的安全碼', type:"error"});
		return false;
		
	}
	
	var rec_zip=$("input[name='zipcode']").val();
    $("#rec_zip").val(rec_zip);
    var rec_address=$("#zone1").val()+$("#zone2").val()+$('input[name="subaddress"]').val();
    $("#rec_address").val(rec_address);
	
	if(document.getElementsByName(myForm)){
	   setTimeout("$('#myForm').submit()", 3600);
       setTimeout('swal({   title: "已付款成功-並傳送email通知",   text: "感謝您的購買，謝謝!",   imageUrl: "/TibameF2_MVC_ShoppingCart-X-menu/images/thanks.gif" ,  imageSize: "150x42",   showConfirmButton: false})', 3200);
       return swal({   title: "信用卡授權中",   text: "請耐心等候，謝謝！",   imageUrl: "/TibameF2_MVC_ShoppingCart-X-menu/images/loading.gif" , timer: 3000,  showConfirmButton: false});
	}
}
</script>
</body>
</html>