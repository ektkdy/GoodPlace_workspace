package com.kh.goodplace.accounts.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.common.model.vo.PageInfo;

@Repository("aDao")
public class AccountsDao {
	
	public int aSelectAccountListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("accountsMapper.aSelectAccountListCount");
		
	}
	
	public ArrayList<Accounts> aSelectAccountList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("accountsMapper.aSelectAccountList", null, rowBounds);
		
	}
	
	public ArrayList<Accounts> selectAccountList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("accountsMapper.aSelectAccountList");
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int selectIncomeListCount(SqlSessionTemplate sqlSession, int usNo) {
		return sqlSession.selectOne("accountsMapper.selectIncomeListCount", usNo);
	}

	public ArrayList<Accounts> selectIncomeList(SqlSessionTemplate sqlSession, PageInfo pi, int usNo) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("accountsMapper.selectIncomeList", usNo, rowBounds);
	}

	public ArrayList<Accounts> selectIncomeList(SqlSessionTemplate sqlSession, int usNo) {
		return (ArrayList)sqlSession.selectList("accountsMapper.selectIncomeList", usNo);
	}

}
