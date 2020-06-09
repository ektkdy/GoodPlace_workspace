package com.kh.goodplace.accounts.model.service;

import java.util.ArrayList;

import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.common.model.vo.PageInfo;

public interface AccountsService {
	
	// 1. 관리자 정산관리 리스트 조회용 서비스-현영
	// 1_1. 관리자 정산관리 총갯수 조회용 서비스
	int aSelectAccountListCount();
	
	// 1_2. 요청한 페이지에 보여질 정산관리 리스트 조회용 서비스-현영
	ArrayList<Accounts> aSelectAccountList(PageInfo pi);
	
	ArrayList<Accounts> selectAccountList();
	

}
