package com.kh.goodplace.accounts.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.accounts.model.dao.AccountsDao;
import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.common.model.vo.PageInfo;

@Service("aService")
public class AccountsServiceImpl implements AccountsService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AccountsDao aDao;
	
	
	@Override
	public int aSelectAccountListCount() {
		return aDao.aSelectAccountListCount(sqlSession);
	}
	@Override
	public ArrayList<Accounts> aSelectAccountList(PageInfo pi) {
		return aDao.aSelectAccountList(sqlSession, pi);
	}
	@Override
	public ArrayList<Accounts> selectAccountList() {
		return aDao.selectAccountList(sqlSession);
	}
	

}
