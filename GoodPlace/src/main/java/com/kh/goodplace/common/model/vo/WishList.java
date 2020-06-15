package com.kh.goodplace.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class WishList {
	
	/* 위시리스트 컬럼들 */
	private int wishNo;		// 위시리스트번호
	private Date wishDate;	// 위시리스트 등록일
	private int userNo;		// 회원번호
	private int roNo;		// 숙소번호
	private int exNo;		// 체험번호
	
	private String roomsTitle; // 숙소이름
	private String expTitle; // 체험이름

}
