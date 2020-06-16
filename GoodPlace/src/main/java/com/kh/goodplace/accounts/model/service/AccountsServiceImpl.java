package com.kh.goodplace.accounts.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.goodplace.accounts.model.dao.AccountsDao;
import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.accounts.model.vo.Chart;
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
	
	@Override
	public ArrayList<Chart> chartList() {
		return aDao.chartList(sqlSession);
	}
	
	@Override
	public ArrayList<Chart> chartList2() {
		return aDao.chartList2(sqlSession);
	}
	
	@Override
	public int roNum() {
		return aDao.roNum(sqlSession);
	}
	@Override
	public int exNum() {
		return aDao.exNum(sqlSession);
	}
	
	
	@Override
	public ArrayList<Chart> mainChartList() {
		return aDao.mainChartList(sqlSession);
	}
	@Override
	public ArrayList<Chart> mainChartList2() {
		return aDao.mainChartList2(sqlSession);
	}
	
	
	
	
	
	
	

	// 파트너 정산관리
	@Override
	public int selectIncomeListCount(int usNo) {
		return aDao.selectIncomeListCount(sqlSession, usNo);
	}
	
	@Override
	public ArrayList<Accounts> selectIncomeList(PageInfo pi, int usNo) {
		return aDao.selectIncomeList(sqlSession, pi, usNo);
	}
	@Override
	public ArrayList<Accounts> selectIncomeList(int usNo) {
		return aDao.selectIncomeList(sqlSession, usNo);
	}
	@Override
	public ArrayList<Accounts> selectRoomIncomeChart(int usNo) {
		return aDao.selectRoomIncomeChart(sqlSession, usNo);
	}
	@Override
	public ArrayList<Accounts> selectExpIncomeChart(int usNo) {
		return aDao.selectExpIncomeChart(sqlSession, usNo);
	}
	@Override
	public int partnerDashboardIncome1(int usNo) {
		return aDao.partnerDashboardIncome1(sqlSession, usNo);
	}
	@Override
	public int partnerDashboardIncome2(int usNo) {
		return aDao.partnerDashboardIncome2(sqlSession, usNo);
	}







	
	
	
	
	
	
	
	
	
	
	
	
	

}
