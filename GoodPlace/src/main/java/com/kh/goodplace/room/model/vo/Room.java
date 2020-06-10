package com.kh.goodplace.room.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.goodplace.board.model.vo.Board;

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
public class Room {
	
	/* Rooms 테이블 컬럼 */
	private int roNo;			// 숙소번호
	private int userNo;			// 회원번호
	private String roomsTitle;	// 숙소명
	private int minPeople;		// 최소인원
	private int maxPeople;		// 최대인원
	private int price;			// 숙소가격
	private int addPrice;		// 추가가격
	private String roomsNotice;	// 숙소정보
	private String roomsTag;	// 숙소태그
	private int roomCount;		// 방갯수
	private int bedCount;		// 침대수
	private int bathCount;		// 샤워실수
	private int restroomCount;	// 화장실수
	private String facility;	// 숙소시설(주차여부,...)
	private String service;		// 제공서비스(샴푸,비누,수건...)
	private String meal;		// 숙소포함사항(조식,중식,석식)
	private String deny;		// 거절사유
	private String denyContent;	// 거절상세내용
	private String addBasic;	// 기본주소
	private String addDetail;	// 상세주소
	private String addRef;		// 참고주소
	private int zipCode;		// 우편번호	
	private Date applyDate;		// 숙소신청일
	private Date startDate;		// 숙소승인일
	private Date endDate;		// 숙소종료일
	private String operateDay;	// 운영요일
	private String checkIn;		// 체크인시간
	private String checkOut;	// 체크아웃시간
	private String deadline;	// 예약가능시간
	private String originName;	// 숙소썸네일 원본명
	private String changeName;	// 숙소썸네일 수정명
	private String filePath;	// 숙소썸네일 저장경로
	private int status;			// 운영중(1),승인대기(2),승인거절(3),휴면(4),노출안됨(5)
	
	private int totalSal;
	
	/* 파워 등록 쪽 */
	private int poNo1;			// 파워등록유무 (기본0)
	private Date powerStart;	// 파워시작일
	private Date powerEnd;		// 파워종료일
	private int rpNo;			// 숙소결제번호

	
	/* 파워 테이블 컬럼 */
	private int poNo;			// 파워번호
	private String powerKind; 	// 파워종류
	private int period;			// 파워기간
	private int powerPrice;		// 파워가격
	
	private String email;		// 회원아이디
	
	/* DB에는 없지만 새로 생성한 변수 */
	private String addArea; // ~시  // ex) 서울특별시, 화성시
	
	/* Roomspay 테이블 컬럼 */
	private int payUserNo;		// 결제자의 회원번호
	private int amount;			// 결제금액
	private String birthday;	// 생년월일
	private String payDate;		// 결제날짜
	private int addPoint;		// 추가포인트
	private String CheckInTime;	// 예약자가 직접 입력한 체크인시간
	private int reserveStatus;	// 확정대기(1),확정(2),여행완료(3)
	private int usePoint;		// 사용포인트
	private int people;			// 인원수
	private String concept;		// 여행컨셉
	private String request;		// 요청사항
	private String startDays;	// 예약시작일자
	private String endDays;		// 예약끝일자
	
	/* DB에는 없지만 새로 생성한 변수 */
	private int reviewCount;	// 숙소별 Review 개수
	private String filterStatus;// 필터 조건에 만족하는지 숙소의 상태값 설정
}
