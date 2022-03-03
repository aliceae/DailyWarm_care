package com.meal.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.util.SessionConfig;

import com.meal.model.service.MealService;
import com.meal.model.vo.MealVO;

import oracle.net.aso.s;

@WebServlet("/back-end/meal/meal.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MealDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String LIST_ALL_MEAL_URL = "listAllMeal.jsp";
	final String ADD_MEAL_URL = "addMeal.jsp";
	final String UPDATE_MEAL_URL = "modifyMeal.jsp";
 	

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");


		if ("insert".equals(action)) { // 來自addMeal.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理************************/
				String mealNo = req.getParameter("mealno").trim();
				String mealNoReg = "^[(a-zA-Z0-9_)]{2,10}$";

				if (mealNo == null || mealNo.trim().length() == 0) {
					errorMsgs.add("餐點編號: 請勿空白");
				} else if(mealNo.trim().length() > 5){
					errorMsgs.add("餐點編號: 請勿輸入大於6碼");
				} else if(!mealNo.trim().matches(mealNoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("餐點編號: 英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				String mealName = req.getParameter("mealname").trim();
				String mealNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,30}$";
				
				if (mealName == null || mealName.trim().length() == 0) {
					errorMsgs.add("餐點名稱: 請勿空白");
				}else if(!mealName.trim().matches(mealNameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("餐點名稱: 只能是中、英文字母、數字和_ , 且長度必需在1到30之間");
		        }

				BigDecimal mealPrice = new BigDecimal(req.getParameter("mealprice"));
				BigDecimal zero = new BigDecimal("0");
				if (mealPrice.compareTo(zero)<1) {
					errorMsgs.add("餐點價格: 請勿輸入小於或等於0的數值");
				}
				
				String mealIntroduce = req.getParameter("mealintro");
				if (mealIntroduce == null || mealIntroduce.trim().length() == 0) {
					errorMsgs.add("餐點介紹: 請勿空白");
				}
				String savePath = this.getServletContext().getRealPath("Files");
				List<Part> mealPicList = (List<Part>) req.getParts();
				MealVO mealVO = new MealVO();
				List<byte[]> mealPicListString = mealPicList.stream().filter(part -> "pic".equals(part.getName()) && part.getSize() > 0)
						.map(part -> {
							byte[] data = null;
							try (InputStream inputStream = part.getInputStream()) {
								data =inputStream.readAllBytes();
							} catch (IOException e) {
								e.printStackTrace();
							}
							return data;
						}).filter(data -> data != null).collect(Collectors.toList());
				mealVO.setMealNo(mealNo);
				mealVO.setMealName(mealName);
				mealVO.setMealPrice(mealPrice);
				mealVO.setMealIntroduce(mealIntroduce);
				mealVO.setFileContent(mealPicListString);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mealVO", mealVO); // 含有輸入格式錯誤的mealVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher(ADD_MEAL_URL);
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				MealService empSvc = new MealService();
				boolean isInsertSuccess = empSvc.insertMael(mealVO);
				System.out.println(isInsertSuccess);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listAllMeal.jsp
//				successView.forward(req, res);				
				res.sendRedirect(LIST_ALL_MEAL_URL);
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println("上傳失敗");
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher(ADD_MEAL_URL);
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String mealNo = new String(req.getParameter("mealno"));
				/***************************2.開始查詢資料****************************************/
				MealService mealSvc = new MealService();
				MealVO mealVO = mealSvc.getOneMeal(mealNo);
				System.out.println(mealVO.getMealNo());

				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/ 
				req.setAttribute("mealVO", mealVO);         // 資料庫取出的mealVO物件,存入req	    
				RequestDispatcher successView = req.getRequestDispatcher(UPDATE_MEAL_URL);// 成功轉交 modifyMeal.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(LIST_ALL_MEAL_URL);
				failureView.forward(req, res);
			}
		}
		if ("update".equals(action)) { // 來自modifyMeal.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理************************/
				String mealNo = req.getParameter("mealno").trim();
				String mealName = req.getParameter("mealname").trim();
				String mealNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,10}$";
				
				if (mealName == null || mealName.trim().length() == 0) {
					errorMsgs.add("餐點名稱: 請勿空白");
				} else if(!mealName.trim().matches(mealNameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("餐點名稱: 只能是中、英文字母、數字和_ , 且長度必需在1到10之間");
	            }
				
				BigDecimal mealPrice = new BigDecimal(req.getParameter("mealprice"));
				BigDecimal zero = new BigDecimal("0");
				BigDecimal maxPrice =  new BigDecimal("10000000000"); 
				if (mealPrice.compareTo(zero)<1) {
					errorMsgs.add("餐點價格: 請勿輸入小於或等於0的數值");
				}else if(mealPrice.compareTo(maxPrice)>=1) {
					errorMsgs.add("餐點價格: 請勿輸入大於10位數之數值");
				}
				
				String mealIntroduce = req.getParameter("mealintro");
				if (mealIntroduce == null || mealIntroduce.trim().length() == 0) {
					errorMsgs.add("餐點介紹: 請勿空白");
				}
				String mealStatus = req.getParameter("status");
				String savePath = this.getServletContext().getRealPath("Files");
				List<Part> mealPicList = (List<Part>) req.getParts();
				InputStream is = null;
				MealVO mealVO = new MealVO();
				List<byte[]> mealPicListString = mealPicList.stream().filter(part -> "pic".equals(part.getName()) && part.getSize() > 0)
						.map(part -> {
							byte[] data = null;
							try (InputStream inputStream = part.getInputStream()) {
								data =inputStream.readAllBytes();
							} catch (IOException e) {
								e.printStackTrace();
							}
							return data;
						}).filter(data -> data != null).collect(Collectors.toList());
				
				String changePics = req.getParameter("select_pic");
				System.out.println(changePics);
				String[] subs = new String[3];
				for(String changePic : changePics.split("\\|")) {
					if(!"".equals(changePic)) {
						int i = 0;
						System.out.println(changePic);
						subs[i]=changePic;
						i++;
					}
				}
				
				mealVO.setMealNo(mealNo);
				mealVO.setMealName(mealName);
				mealVO.setMealPrice(mealPrice);
				mealVO.setMealStatus(mealStatus);
				mealVO.setMealIntroduce(mealIntroduce);
				mealVO.setFileContent(mealPicListString);
				mealVO.setUpdatePics(subs);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("mealVO", mealVO); // 含有輸入格式錯誤的mealVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher(UPDATE_MEAL_URL);
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				MealService mealSvc = new MealService();
				int isUpdateSuccess = mealSvc.updateOneMeal(mealVO);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				RequestDispatcher successView = req.getRequestDispatcher(LIST_ALL_MEAL_URL); // 成功轉交 listAllMeal.jsp
				successView.forward(req, res);				
//				res.sendRedirect(LIST_ALL_MEAL_URL);
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(UPDATE_MEAL_URL);
				failureView.forward(req, res);
			}
		}
		if ("delete".equals(action)) { // 來自modifyMeal.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理************************/
				String mealNo = req.getParameter("mealno").trim();

			
				/***************************2.開始刪除資料***************************************/
				MealService mealSvc = new MealService();
				int isUpdateSuccess = mealSvc.deleteOneMeal(mealNo);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listAllMeal.jsp
//				successView.forward(req, res);	
				res.sendRedirect("/CFA104G6/back-end/meal/listAllMeal.jsp");
				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(LIST_ALL_MEAL_URL);
				failureView.forward(req, res);
			}
		}
	
	}
}
