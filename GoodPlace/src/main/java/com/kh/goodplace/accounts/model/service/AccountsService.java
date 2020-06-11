package com.kh.goodplace.accounts.model.service;

import java.util.ArrayList;

import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.accounts.model.vo.Chart;
import com.kh.goodplace.common.model.vo.PageInfo;

public interface AccountsService {
	
	// 1. 관리자 정산관리 리스트 조회용 서비스-현영
	// 1_1. 관리자 정산관리 총갯수 조회용 서비스
	int aSelectAccountListCount();
	
	// 1_2. 요청한 페이지에 보여질 정산관리 리스트 조회용 서비스-현영
	ArrayList<Accounts> aSelectAccountList(PageInfo pi);
	
	ArrayList<Accounts> selectAccountList();
	
	ArrayList<Chart> chartList();
	
	ArrayList<Chart> chartList2();
	
	int roNum();
	int exNum();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 1. 파트너 수입 목록 조회용 서비스
	// 1_1. 해당 파트너의 전체 수입(숙소+체험) 갯수 조회용서비스
	int selectIncomeListCount(int usNo);
	
	// 1_2. 해당 페이지에 보여질 수입목록 조회용 서비스
	ArrayList<Accounts> selectIncomeList(PageInfo pi, int usNo);
	
	// 1_3. 엑셀출력용 수입목록들
	ArrayList<Accounts> selectIncomeList(int usNo);

}
