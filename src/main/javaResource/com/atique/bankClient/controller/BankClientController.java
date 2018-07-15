package com.atique.bankClient.controller;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.atique.bankClient.TO.AccountDetails;
import com.atique.bankClient.TO.AccountStatement;
import com.atique.bankClient.TO.UserMasterTO;
import com.atique.bankClient.entity.UserMaster;
import com.atique.bankClient.service.BankClientService;

@Controller
public class BankClientController {
	
	@Autowired
	BankClientService bClientService;
	
	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping(value="register.bapp")
	public String showRegisterPage(HttpServletRequest req) {
		System.out.println("showRegisterPage()");
		req.setAttribute("isRegisterPage", "YES");
		return "registerPage";
	}
	
	@RequestMapping(value="checkUserValidation.bapp")
	public @ResponseBody boolean checkUserValidation(HttpServletRequest req) {
		String uname=req.getParameter("uname");
		
		return bClientService.checkUserAvailibility(uname);
	}
	
	@RequestMapping(value="registerUser.bapp")
	public String registerUser(HttpServletRequest req) {
		
		System.out.println("registerUser()");
		String message="Successfully Registered";
		String returnPage="bankHomePage";
		Serializable loggedInId=0;
		if(req.getSession().getAttribute("FormSubmittedSuccessfully")==null) {
			loggedInId = bClientService.addUser(req);
			req.getSession().setAttribute("FormSubmittedSuccessfully",true);
			req.getSession().setAttribute("isLoggedIn",true);
			req.getSession().setAttribute("loggedInId", loggedInId);
		}else {
			loggedInId = Integer.parseInt(req.getSession().getAttribute("loggedInId").toString());
		}
		
		System.out.println("LoggedIn ID : "+loggedInId);
		if(loggedInId ==null) {
			message="Somthing Went Wrong! Try Again";
			returnPage="registerPage";
		}
		
		req.setAttribute("message", message);
		return returnPage;
	}
	
	@RequestMapping(value="editProfile.bapp")
	public String editProfile(HttpServletRequest req) {
		System.out.println("editProfile()");
		int loggedInId = Integer.parseInt(req.getSession().getAttribute("loggedInId").toString());
		req.setAttribute("userDetails", bClientService.getUserDetails(loggedInId));
		req.setAttribute("isEdit", "YES");
		return "userEditPage";
	}
	
	@RequestMapping(value="viewProfile.bapp")
	public String viewProfile(HttpServletRequest req) {
		System.out.println("viewProfile()");
		int loggedInId = Integer.parseInt(req.getSession().getAttribute("loggedInId").toString());
		req.setAttribute("userDetails", bClientService.getUserDetails(loggedInId));
		req.setAttribute("viewUsers", "YES");
		return "userEditPage";
	}
	
	@RequestMapping(value="updateProfile.bapp")
	public String updateProfile(HttpServletRequest req) {
		System.out.println("editProfile()");
		bClientService.updateUser(req);
		
		return "bankHomePage";
	}
	
	@RequestMapping(value="login.bapp")
	public String showLoginPage(HttpServletRequest req) {
		System.out.println("showRegisterPage()");
		req.setAttribute("isLoginPage", "YES");
		return "registerPage";
	}
	
	@RequestMapping(value="LoginUser.bapp")
	public String LoginUser(HttpServletRequest req) {
		System.out.println("LoginUser()");
		String message="Successfully Logged In";
		String returnPage="bankHomePage";
		int loggedInId = bClientService.loginUser(req);
		System.out.println("LoggedIn ID : "+loggedInId);
		if(loggedInId ==0) {
			message="Somthing Went Wrong! Try Again";
			req.setAttribute("isLoginPage", "YES");
			req.setAttribute("loggedOutMessage", message);
			returnPage="index";
		}
		req.getSession().setAttribute("isLoggedIn",true);
		req.getSession().setAttribute("loggedInId", loggedInId);
		req.setAttribute("message", message);
		return returnPage;
	}
	
	@RequestMapping(value="bankLoginPage.bapp")
	public String showBankLoginPage(HttpServletRequest req) {
		System.out.println("showBankLoginPage()");
		String bankName=req.getParameter("bankName");
		String message=req.getParameter("message");
		req.setAttribute("message",message);
		req.setAttribute("bankName", bankName);
		return "bankLoginPage";
	}
	
	@RequestMapping(value="logoutFromAccount.bapp")
	public String logoutFromAccount(HttpServletRequest req){
		if(req.getSession().getAttribute("userIdForLoggedInBank") != null) {
			req.getSession().removeAttribute("userIdForLoggedInBank");
		}
		req.setAttribute("message","Successfully LoggedOut");
		return "bankLoginPage";
	}
	
	@RequestMapping(value="loginToBank.bapp",method=RequestMethod.POST)
	public String bankLogin(HttpServletRequest req) {
		String bankName=req.getParameter("bankName");
		String uname=req.getParameter("uname");
		String password=req.getParameter("password");
		UserMasterTO to=new UserMasterTO();
		to.setUserName(uname);
		to.setPassword(password);
		to.setBankName(bankName);
		String url="http://localhost:8088/com.atique.BankApp/rest/bankApp/loginUser";
		int userId=restTemplate.postForObject(url, to, Integer.class);
		System.out.println("bankLogin  :: userId : "+userId);
		if(userId==0) {
			req.setAttribute("bankName", bankName);
			req.setAttribute("message", "Authentication Failed! Try again.");
//			return "bankLoginPage";
			req.setAttribute("isBankLoginPage", "YES");
		}else {
			url="http://localhost:8088/com.atique.BankApp/rest/bankApp/viewProfile/"+userId;
			UserMasterTO um = restTemplate.getForObject(url, UserMasterTO.class);
			req.setAttribute("userDetails", um);
			req.setAttribute("viewUsers", "YES");
			req.getSession().setAttribute("userIdForLoggedInBank", userId);
			req.getSession().setAttribute("bankName", bankName);
		}
		return "userBankHomePage";
	}
	

	@RequestMapping(value="viewbankDetails.bapp",method=RequestMethod.GET)
	public String getbankDetails(HttpServletRequest req) {
		int uid=Integer.parseInt(req.getSession().getAttribute("userIdForLoggedInBank").toString());
		System.out.println("getbankDetails : "+uid);
//		String url="http://localhost:8088/com.atique.BankApp/rest/bankApp/getAccountDetails/"+uid;
//		AccountDetails to=restTemplate.getForObject(url, AccountDetails.class);
		String url="http://localhost:8088/com.atique.BankApp/rest/bankApp/viewProfile/"+uid;
		UserMasterTO um = restTemplate.getForObject(url, UserMasterTO.class);
		req.setAttribute("userDetails", um);
		req.setAttribute("isAccountDetailsPage", "YES");
//		req.setAttribute("accountDetails", to);
		return "bankDetailsPage";
	}
	
	@RequestMapping(value="viewBankProfile.bapp",method=RequestMethod.GET)
	public String viewBankProfile(HttpServletRequest req) {
		int uid=Integer.parseInt(req.getSession().getAttribute("userIdForLoggedInBank").toString());
		System.out.println("Bank User Id : "+uid);
		String url="http://localhost:8088/com.atique.BankApp/rest/bankApp/viewProfile/"+uid;
		UserMasterTO to=restTemplate.getForObject(url, UserMasterTO.class);
		
		req.setAttribute("viewBankProfile", "YES");
		req.setAttribute("userDetails", to);
		return "bankDetailsPage";
	}
	
	@RequestMapping(value="viewstmtDetails.bapp",method=RequestMethod.GET)
	public String viewBankStatement(HttpServletRequest req) {
		int uid=Integer.parseInt(req.getSession().getAttribute("userIdForLoggedInBank").toString());
		System.out.println("Bank User Id : "+uid);
		String url="http://localhost:8088/com.atique.BankApp/rest/bankApp/getStatements/"+uid;
		List<AccountStatement> list = restTemplate.getForObject(url, List.class);
		url="http://localhost:8088/com.atique.BankApp/rest/bankApp/viewProfile/"+uid;
		UserMasterTO to=restTemplate.getForObject(url, UserMasterTO.class);
		req.setAttribute("uDetails", to);
		req.setAttribute("isStatementPage", "YES");
		req.setAttribute("accountStmtList", list);
		return "bankDetailsPage";
	}
	
@RequestMapping(value="logout.bapp")
public String getLoggedOut(HttpServletRequest req) {
	if(req.getSession().getAttribute("isLoggedIn")!=null) {
		req.getSession().invalidate();
		req.setAttribute("loggedOutMessage", "You have Logged Out Successfully!");
	}
	
	return "index";
}


}
