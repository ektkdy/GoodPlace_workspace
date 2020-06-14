package com.kh.goodplace.experience.model.vo;

import java.sql.Timestamp;

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
public class ExpPay {
	
	/* 체험결제 컬럼들 */
	private int epNo; 			// 체험결제번호
	private int exNo;			// 체험번호
	private int usNo;			// 회원번호
	private int amount;			// 체험결제금액
	private Timestamp payDate;	// 체험결제일
	private Timestamp expDate;	// 체험신청일
	private int people;			// 인원수
	private int status;			// 체험상태(승인1~)
	private int expClassNo;		// 선택한 수업의 교시
	private String expTitle;
	private String changeName;
	
	private String supplies;	// 준비물
	private String useTime;	// 소요시간
	private String addBasic;
	
	/* DB에는 없지만 추가한 필드 */
	private String payDateString;	// 체험결제일 스트링
	private String expDateString;	// 체험신청일 스트링
	
}
