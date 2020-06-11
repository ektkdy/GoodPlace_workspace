package com.kh.goodplace.accounts.model.vo;

import java.sql.Date;
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
public class Accounts {

	/* 정산관리용  */
	/* 숙소 결제 컬럼들 */
	private int rpNo;				// 숙소결제번호
	private int roNo;				// 숙소번호
	private int amountRoom;			// 결제금액
	private String brithDate;		// 예약자 생년월일
	private Date payDateRoom;	// 결제날짜
	private int addPoint;			// 적립포인트
	private Date checkIn;		// 체크인시간
	private int usePoint;			// 사용포인트
	private int peopleRoom;			// 예약인원수
	private String concept;			// 여행컨셉
	private String request;			// 요청사항
	private Date startDate;			// 예약시작일자
	private Date endDate;			// 예약끝일자
	
	
	/* 공용 */
	private String userName;
	private String userNo;
	private int chartamountExp;
	private int chartPayExp;
	private String section;			// 파트너 정산관리에서 사용
	private String no;				// 파트너 정산관리에서 사용
	private int amount;				// 파트너 정산관리에서 사용
	private Date payDate;			// 파트너 정산관리에서 사용
	
	
	/* 체험결제 컬럼들 */
	private int epNo; 				// 체험결제번호
	private int exNo;				// 체험번호
	private int amountExp;			// 체험결제금액
	private Date payDateExp;	// 체험결제일
	private Date expDate;		// 체험신청일
	private int peopleExp;			// 인원수
	private int status;				// 체험상태(승인1~)
	
}
