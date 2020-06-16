package com.kh.goodplace.accounts.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.kh.goodplace.accounts.model.service.AccountsService;
import com.kh.goodplace.accounts.model.vo.Accounts;
import com.kh.goodplace.accounts.model.vo.Chart;
import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.member.model.vo.Member;

@Controller
public class AccountsController {
	
    @Autowired
    private AccountsService aService;
    
    // 관리자 정산관리
    @RequestMapping("aAccountsList.ac")
    public String aSelectAccountList(int currentPage, Model model) {
    	
        int listCount = aService.aSelectAccountListCount(); 
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
        
        ArrayList<Accounts> list = aService.aSelectAccountList(pi);
        
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        
        return "admin/a_accountsList";
    }
    
    @RequestMapping("chartView.ac")
    public String accountsChart(Model model) {
    	
    	return "admin/a_accountsDetail";
    	
    }
    
//    @ResponseBody
//    @RequestMapping(value="chartList.ac", produces="application/json; charset=utf-8")
//    public String chartList(HttpServletResponse response) {
//    	
//    	ArrayList<Chart> list = aService.chartList();
//    	System.out.println(list);
//    	return new Gson().toJson(list);
//    }
    
    //@ResponseBody
    @RequestMapping(value="chartList.ac")
    public void chartList(HttpServletResponse response) throws JsonIOException, IOException {
    	
    	ArrayList<Chart> list = aService.chartList();
    	ArrayList<Chart> list2= aService.chartList2();
    	//System.out.println(list);
    	//System.out.println(list2);
    	
    	int roNum = aService.roNum();
    	int exNum = aService.exNum();
    	
    	HashMap<String, Object> map = new HashMap<>();
    	map.put("list", list);
    	map.put("list2", list2);
    	map.put("roNum", roNum);
    	map.put("exNum", exNum);
    	
    	
    	response.setContentType("application/json; charset=utf-8");
    	new Gson().toJson(map, response.getWriter());
    }
    
    @RequestMapping(value="mainchartList.mc")
    public void mainChartList(HttpServletResponse response) throws JsonIOException, IOException {
    	
    	ArrayList<Chart> list = aService.mainChartList();
    	ArrayList<Chart> list2= aService.mainChartList2();
    	//System.out.println(list);
    	//System.out.println(list2);
    	
    	
    	HashMap<String, Object> map = new HashMap<>();
    	map.put("list", list);
    	map.put("list2", list2);
    	
    	
    	response.setContentType("application/json; charset=utf-8");
    	new Gson().toJson(map, response.getWriter());
    }
    
    
    
    // 엑셀다운롣
    @RequestMapping("excelDown.do")

    public void excelDown(HttpServletResponse response) throws Exception {



        // 게시판 목록조회

    	ArrayList<Accounts> list = aService.selectAccountList();
    	
    	//System.out.println(list);


        // 워크북 생성

        Workbook wb = new HSSFWorkbook();
        

        Sheet sheet = wb.createSheet("정산내역");

        Row row = null;

        Cell cell = null;

        int rowNo = 0;



        // 테이블 헤더용 스타일

        CellStyle headStyle = wb.createCellStyle();
        CreationHelper createHelper = wb.getCreationHelper();
        headStyle.setDataFormat(
            createHelper.createDataFormat().getFormat("m/d/yy"));
        // 가는 경계선을 가집니다.

        headStyle.setBorderTop(BorderStyle.THIN);

        headStyle.setBorderBottom(BorderStyle.THIN);

        headStyle.setBorderLeft(BorderStyle.THIN);

        headStyle.setBorderRight(BorderStyle.THIN);



        // 배경색은 노란색입니다.

        headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

        headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);



        // 데이터는 가운데 정렬합니다.

        headStyle.setAlignment(HorizontalAlignment.CENTER);



        // 데이터용 경계 스타일 테두리만 지정

        CellStyle bodyStyle = wb.createCellStyle();

        bodyStyle.setBorderTop(BorderStyle.THIN);

        bodyStyle.setBorderBottom(BorderStyle.THIN);

        bodyStyle.setBorderLeft(BorderStyle.THIN);

        bodyStyle.setBorderRight(BorderStyle.THIN);



        // 헤더 생성

        row = sheet.createRow(rowNo++);

        cell = row.createCell(0);

        cell.setCellStyle(headStyle);

        cell.setCellValue("입금번호");

        cell = row.createCell(1);

        cell.setCellStyle(headStyle);

        cell.setCellValue("입금일");

        cell = row.createCell(2);

        cell.setCellStyle(headStyle);

        cell.setCellValue("입금자명");
        
        cell = row.createCell(3);

        cell.setCellStyle(headStyle);

        cell.setCellValue("금액");
        
        cell = row.createCell(4);

        cell.setCellStyle(headStyle);

        cell.setCellValue("유형");



        // 데이터 부분 생성
        

        for(Accounts vo : list) {
        	
        	if(vo.getEpNo()==0) {
        		
        		row = sheet.createRow(rowNo++);
        		
        		cell = row.createCell(0);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue(vo.getRpNo());
        		
        		cell = row.createCell(1);
        		cell.setCellStyle(headStyle);
        		cell.setCellValue(vo.getPayDateRoom());
        		
        		cell = row.createCell(2);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue(vo.getUserName());
        		
        		cell = row.createCell(3);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue(vo.getAmountRoom());
        		
        		cell = row.createCell(4);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue("숙소");
        		
        	}else if(vo.getRpNo()==0){
        		
        		row = sheet.createRow(rowNo++);
        		
        		cell = row.createCell(0);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue(vo.getEpNo());
        		
        		cell = row.createCell(1);
        		
        		cell.setCellStyle(bodyStyle);
        		cell.setCellStyle(headStyle);
        		cell.setCellValue(vo.getPayDateExp());
        		
        		cell = row.createCell(2);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue(vo.getUserName());
        		
        		cell = row.createCell(3);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue(vo.getAmountExp());
        		
        		cell = row.createCell(4);
        		
        		cell.setCellStyle(bodyStyle);
        		
        		cell.setCellValue("체험");
        		
        	}
        	

        }



        // 컨텐츠 타입과 파일명 지정

        response.setContentType("ms-vnd/excel");

        response.setHeader("Content-Disposition", "attachment;filename=Accounts.xls");



        // 엑셀 출력

        wb.write(response.getOutputStream());

        wb.close();

    }



    
    
    
    
    
    
    
    //@ResponseBody
	//@RequestMapping(value = "partnerDashboardIncome.me" , produces="application/json; charset=utf-8")
    @RequestMapping("partnerDashboardIncome.me")
    public void partnerDashboardIncome(HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
    
    	Member loginUser  = (Member)session.getAttribute("loginUser");
		int usNo = loginUser.getUsNo();
		
		
		int roSum = aService.partnerDashboardIncome1(usNo);
		int expSum = aService.partnerDashboardIncome2(usNo);
    
		int sum = 0;
		
		if(roSum == 0) {
			roSum=0;
		}
		if(expSum == 0) {
			expSum=0;
		}
		
		sum = roSum + expSum;
		Gson gson = new Gson();
		
		response.setContentType("application/json; charset=utf-8");
		
		gson.toJson(sum, response.getWriter());
		
    }
    
    
    // 406에러 날때 해결방법
    // @ResponseBody
    @RequestMapping(value="incomeChart.me")
    public void selectRoomIncomeChart(HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
    	
    	Member loginUser  = (Member)session.getAttribute("loginUser");
		int usNo = loginUser.getUsNo();
    
		ArrayList<Accounts> listRo = aService.selectRoomIncomeChart(usNo);
		ArrayList<Accounts> listExp = aService.selectExpIncomeChart(usNo);
        
		//System.out.println(listRo);
		//System.out.println(listExp);
		
		Gson gson = new Gson();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	    JsonObject jsonObject = new JsonObject();
		
	    map.put("listRo", listRo); 
	    map.put("listExp", listExp);
	    
	    //String jsonString = gson.toJson(map);
	    //return jsonString;
	    response.setContentType("application/json; charset=utf-8");
	    gson.toJson(map, response.getWriter());
	    
	    
    }

    /* 파트너페이지 정산관리 */
	@RequestMapping("partnerIncome.ac")
	public String selectIncomeList(int currentPage, Model model, HttpSession session) {
		
		Member loginUser  = (Member)session.getAttribute("loginUser");
		int usNo = loginUser.getUsNo();
		
		int listCount = aService.selectIncomeListCount(usNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Accounts> list = aService.selectIncomeList(pi, usNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "partner/partnerIncome";
	}
	
	// 파트너 정산관리 엑셀다운로드
	@RequestMapping("incomeExcel.do")
	public void incomeExcel(HttpServletResponse response, HttpSession session) throws Exception {

		Member loginUser  = (Member)session.getAttribute("loginUser");
		int usNo = loginUser.getUsNo();
		
		// 게시판 목록조회
    	ArrayList<Accounts> list = aService.selectIncomeList(usNo);
    	//System.out.println(list);

        // 워크북 생성
        Workbook wb = new HSSFWorkbook();
        Sheet sheet = wb.createSheet("정산내역");
        Row row = null;
        Cell cell = null;
        int rowNo = 0;

        // 테이블 헤더용 스타일
        CellStyle headStyle = wb.createCellStyle();
        CreationHelper createHelper = wb.getCreationHelper();
        headStyle.setDataFormat(
            createHelper.createDataFormat().getFormat("m/d/yy"));
        // 가는 경계선을 가집니다.
        headStyle.setBorderTop(BorderStyle.THIN);
        headStyle.setBorderBottom(BorderStyle.THIN);
        headStyle.setBorderLeft(BorderStyle.THIN);
        headStyle.setBorderRight(BorderStyle.THIN);

        // 배경색은 노란색입니다.
        headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
        headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        // 데이터는 가운데 정렬합니다.
        headStyle.setAlignment(HorizontalAlignment.CENTER);

        // 데이터용 경계 스타일 테두리만 지정
        CellStyle bodyStyle = wb.createCellStyle();
        bodyStyle.setBorderTop(BorderStyle.THIN);
        bodyStyle.setBorderBottom(BorderStyle.THIN);
        bodyStyle.setBorderLeft(BorderStyle.THIN);
        bodyStyle.setBorderRight(BorderStyle.THIN);

        // 헤더 생성
        row = sheet.createRow(rowNo++);
        cell = row.createCell(0);
        cell.setCellStyle(headStyle);
        cell.setCellValue("예약번호");
        
        cell = row.createCell(1);
        cell.setCellStyle(headStyle);
        cell.setCellValue("수익일");

        cell = row.createCell(2);
        cell.setCellStyle(headStyle);
        cell.setCellValue("입금자명");
        
        cell = row.createCell(3);
        cell.setCellStyle(headStyle);
        cell.setCellValue("금액");

        cell = row.createCell(4);
        cell.setCellStyle(headStyle);
        cell.setCellValue("유형");

        // 데이터 부분 생성
        for(Accounts vo : list) {
    		row = sheet.createRow(rowNo++);
    		
    		cell = row.createCell(0);
    		cell.setCellStyle(bodyStyle);
    		cell.setCellValue(vo.getNo());
    		
    		cell = row.createCell(1);
    		cell.setCellStyle(headStyle);
    		cell.setCellValue(vo.getPayDate());
    		
    		cell = row.createCell(2);
    		cell.setCellStyle(bodyStyle);
    		cell.setCellValue(vo.getUserName());
    		
    		cell = row.createCell(3);
    		cell.setCellStyle(bodyStyle);
    		cell.setCellValue(vo.getAmount());
    		
    		cell = row.createCell(4);
    		cell.setCellStyle(bodyStyle);
    		cell.setCellValue(vo.getSection());
        		
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=Income.xls");

        // 엑셀 출력
        wb.write(response.getOutputStream());
        wb.close();
    }

}