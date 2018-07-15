package com.atique.bankClient.dao;

import java.io.Serializable;
import java.util.List;

import com.atique.bankClient.entity.UserMaster;

public interface BankClientDAO {
public Serializable addUser(UserMaster um);
public UserMaster getUserDetails(int loggedInId);
public String updateUser(UserMaster um);
public int verifyUser(String userName,String pwd);
public List getUserByUserName(String uname);
}

