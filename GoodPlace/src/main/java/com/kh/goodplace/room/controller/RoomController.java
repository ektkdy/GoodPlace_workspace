package com.kh.goodplace.room.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goodplace.common.model.vo.PageInfo;
import com.kh.goodplace.common.template.Pagination;
import com.kh.goodplace.room.model.service.RoomService;
import com.kh.goodplace.room.model.vo.Room;

@Controller
public class RoomController {
	
	@Autowired // DI
	private RoomService rService;
	
	@RequestMapping("list.ro")
	public String selectRoomsList(int currentPage, Model model) {
		
		int listCount = rService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Room> list = rService.selectRoomsList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "";
	}
	
	
	// ------------- Power 관리 시작 --------------------------------------------------
	
    @RequestMapping("aPowerList.po")
    public String selectList(Model model)
    {
        
        ArrayList<Room> list = rService.selectPowerList();
        
        model.addAttribute("list", list);
        
        return "admin/a_power";
    }
	
	// ------------- Power 관리 끝 --------------------------------------------------

}
