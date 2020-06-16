package com.kh.goodplace.room.model.vo;

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
public class RoomPay {
	
	/* 숙소 결제 컬럼들 */
	private int rpNo;		// 숙소결제번호
	private int roNo;		// 숙소번호
	private int userNo;		// 회원번호
	private int amount;		// 결제금액
	private int addAmount;
	private String brithDate;	// 예약자 생년월일
	private Timestamp payDate;	// 결제날짜
	private int addPoint;	// 적립포인트
	private String checkIn;	// 체크인시간
	private int reserveStatus; 	// 예약상태
	private int usePoint;	// 사용포인트
	private int people;		// 예약인원수
	private String concept;	// 여행컨셉
	private String request;	// 요청사항
	private Date startDays;	// 예약시작일자
	private Date endDays;	// 예약끝일자
	private String roomsTitle; // 숙소 이름
	private String changeName; //

}
