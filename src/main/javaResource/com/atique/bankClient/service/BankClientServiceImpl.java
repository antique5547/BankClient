package com.atique.bankClient.service;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atique.bankClient.dao.BankClientDAO;
import com.atique.bankClient.entity.Address;
import com.atique.bankClient.entity.UserMaster;

@Service
public class BankClientServiceImpl implements BankClientService{

@Autowired	
BankClientDAO baDao;

public Serializable addUser(HttpServletRequest req) {
	UserMaster um = new UserMaster();
	um.setFullName(req.getParameter("fullname"));
	um.setUserName(req.getParameter("uname"));
	um.setEmailId(req.getParameter("emailId"));
	um.setPassword(req.getParameter("password"));
	
	return baDao.addUser(um);
}

public UserMaster getUserDetails(int loggedInId) {
	    UserMaster um = baDao.getUserDetails(loggedInId);
		return um;
	}

public void updateUser(HttpServletRequest req) {
	UserMaster um = new UserMaster();
	um.setUserId(Integer.parseInt(req.getSession().getAttribute("loggedInId").toString()));
	um.setFullName(req.getParameter("fullName"));
	um.setUserName(req.getParameter("userName"));
	um.setEmailId(req.getParameter("emailId"));
	um.setPassword(req.getParameter("password"));
	Address add=new Address();
	add.setCountry(req.getParameter("country"));
	add.setLocality(req.getParameter("locality"));
	add.setDistrict(req.getParameter("district"));
	add.setState(req.getParameter("state"));
	add.setPinCode(req.getParameter("pinCode"));
	um.setAddress(add);
	baDao.updateUser(um);
	}

public int loginUser(HttpServletRequest req) {
		return baDao.verifyUser(req.getParameter("uname"), req.getParameter("password"));
	}
}
