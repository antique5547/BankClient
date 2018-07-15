package com.atique.bankClient.service;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import com.atique.bankClient.entity.UserMaster;


public interface BankClientService {
public Serializable addUser(HttpServletRequest req);
public UserMaster getUserDetails(int loggedInId);
public void updateUser(HttpServletRequest req);
public int loginUser(HttpServletRequest req);
public boolean checkUserAvailibility(String uname);
}
