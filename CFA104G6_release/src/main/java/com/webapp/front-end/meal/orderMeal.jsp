<%@page import="com.mealorder.model.MealOrderVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mealorder.model.*"%>
<%@ page import="com.meal.model.*"%>
<%@page import="com.meal.model.service.MealService"%>
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
  <link rel="icon" type="image/x-icon" href="c:/src/main/webapp/healthcare.png" />
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
  .brline {
	display: inline-block;
/* 	border: 2px solid yellow; */
	border-radius: 7px;
	padding: 7px;
	margin: 5px;
	max-width: 300px;
	word-wrap:break-word;
}

.onemeal {
	padding: 200px 60px 10px 60px;
	position: relative;
}

.all {
	padding: 0 15px;
	
}
</style>

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
          <!-- 關於我們 -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
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
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
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
            <a class="nav-link" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
<!-- 內容 -->

    <div class="container pt-5 pb-5">
      <div class="">
        <h2 class="mb-2 mt-5 fw-bold">餐點外送下單</h2>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
        <form method="post" action="order" name="form">

        <div class="all">
         <% int i=1; %>
<c:forEach var="mealVO" items="${list}">
          <div class="brline">
            <c:forEach var="mealImgVO" items="${mealImgSvc.all}">
            	<c:if test="${mealImgVO.mealNo==mealVO.mealNo}">
                		<img src="data:image/jpg;base64,${mealImgVO.mealImgFile}"
                			width="200"height="200" style="position:absolute; margin:0px 30px">
				</c:if>
				
           </c:forEach>
          
           <div class="onemeal">
           <input type="checkbox" name="meal" id="meal<%=  i%>" value="${mealVO.mealNo}" onchange="check(<%= i%>)" >${mealVO.mealName}
            
            <label id="price<%= i%>" value="${mealVO.mealPrice}">$${mealVO.mealPrice}</label><br>
              <label>數量</label>
				<input type="number" id="qty<%= i%>" name="qty" class="" min="0" max="50" placeholder="≤50" disabled="disabled" onblur="countAmount(<%= i%>)"/>
			<% i++; %>
			</div>
			
          </div>
</c:forEach>
        </div>
          <p>總金額<label id="orderamount" name="orderamount"></label></p>
          <div class="mt-2">
            <label>起始日</label>
            <input type="date" class="mt-2" name="startdate" id="mealdate">
          </div>
          <div class="mt-2">
            <label for="totaldays">天數</label>
            <input type="text" class="mt-2" name="totaldays" placeholder="請輸入≤60的數字">
          </div>
          <div class="mt-2">
            <label>餐點時間</label>
            <input type="checkbox" class="mt-2" id="breakfast" value="1" name="mealtime">
            <label for="breakfast">早餐</label>
            <input type="checkbox" class="mt-2" id="lunch" value="2" name="mealtime">
            <label for="lunch">午餐</label>
            <input type="checkbox" class="mt-2" id="dinner" value="3" name="mealtime">
            <label for="dinner">晚餐</label>
          </div>
          <div class="mt-2">
            <label for="contactName">姓名</label>
            <input type="text" class="mt-2" name="contactname" placeholder="請輸入文字"/>
<!--             <button>同會員資料</button> -->
          </div>
          <div class="mt-2">
            <label for="contactNumber">電話</label>
            <input type="text" class="mt-2" name="contactnumber" placeholder="請輸入號碼">
          </div>
          <div class="mt-2">
            <label for="addr">地址</label>
            <input type="text" class="mt-2" name="addr" placeholder="請輸入文字">
          </div>

          <input type="hidden" name="action" value="insert"> 
          <input type="submit" class="btn w-100 btn-lg mt-3 btn-primary" value="送出訂單">
          
        </form>
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
  <!-- <script src="js/scripts.js"></script> -->
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <!-- * *                               SB Forms JS                               * *-->
  <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
  <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
  <!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
  <script>
  let arrayLength = <%= i%>;
  let mealAmount = new Array(<%= i%>);
    function check(num) {
    	var checkBox = document.getElementById("meal"+num);
    	if(checkBox.checked==true){
    		document.getElementById("qty"+num).disabled = false;
    		document.getElementById("qty"+num).value = 1;
    		countAmount(num);
//     		alert($("#price"+num).html()); // 取得price的值
    	}else{
    		document.getElementById("qty"+num).disabled = true;
    		document.getElementById("qty"+num).value = 0;
    		countAmount(num);
    	}
    }
    function countAmount(num){
    let qty = document.getElementById("qty"+num).value;
    console.log(qty);
    
    if(qty>50){
    	document.getElementById("qty"+num).value = 0;
    	countAmount(num);
    	alert("數量不可大於50");
    } else if(qty<0) {
    	document.getElementById("qty"+num).value = 0;
    	countAmount(num);
    	alert("數量不可小於50");
    } else {
    	let price = document.getElementById("price"+num).innerText.substring(1);
        price = Number(price);
        console.log(price);
        let amount = qty*price;
//         alert(amount);
        total(num,amount);
    }
    
  }
    function total(num,amount){
      mealAmount[num-1] = amount;
      let totalAmount =0;
      for(let i=0;i<arrayLength;i++){
        if(mealAmount[i]>0){
          console.log(mealAmount[i]);
          totalAmount = totalAmount+mealAmount[i];
        }
      }
      document.getElementById("orderamount").innerHTML=totalAmount;
    }
  </script>

	<script>
        let dd = new Date();
        let ss = dd.getFullYear() + "-" +  ((dd.getMonth() + 1) < 10 ? "0" + (dd.getMonth() + 1) : (dd.getMonth() + 1)) + "-" + (dd.getDate() < 10 ? "0" + dd.getDate() : dd.getDate());  
        console.log(ss);
        dd.setDate(dd.getDate() + 60);//獲取AddDayCount天后的日期  
        let y = dd.getFullYear();
        let m = (dd.getMonth() + 1) < 10 ? "0" + (dd.getMonth() + 1) : (dd.getMonth() + 1);//獲取當前月份的日期，不足10補0  
        let d = dd.getDate() < 10 ? "0" + dd.getDate() : dd.getDate();//獲取當前幾號，不足10補0  
        let ss2 = y + "-" + m + "-" + d;   
        document.querySelector("#mealdate").setAttribute("min",ss);
        document.querySelector("#mealdate").setAttribute("max",ss2);
    </script>
    
</body>
</html>