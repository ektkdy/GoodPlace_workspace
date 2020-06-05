package com.kh.goodplace.experience.model.vo;

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
public class Experience {
	
	/* 체험 관련 컬럼들  */
	private int exNo;				// 체험번호
	private int usNo;				// 회원번호
	private String language;		// 언어
	private int expCategory;		// 체험카테고리(총5개)
	private String expTag;			// 체험태그(체험당2개)
	private String expTitle;		// 체험명
	private String expContent;		// 체험내용
	private int activity;			// 활동강도
	private int maxPeople;			// 최대인원수
	private Date expDate;			// 체험날짜
	private Timestamp startTime;	// 운영시작시간
	private Timestamp endTime;		// 운영끝시간
	private int useTime;			// 체험소요시간
	private int intervalTime;		// 체험간격
	private String supplies;		// 준비물
	private Timestamp deadline;		// 예약가능시간
	private int price;				// 체험가격
	private String addBasic;		// 기본주소
	private String addDetail;		// 상세주소
	private String addRef;			// 참고주소
	private int zipCode;			// 우편번호
	private Date applyDate;			// 체험신청일
	private Date startDate;			// 체험승인일(개시일)
	private Date endDate;			// 체험종료일
	private String operateDay;		// 운영요일
	private String status;			// 운영중(1),승인대기(2),승인거절(3),휴면(4),삭제(5)
	private String deny;			// 거절사유
	private String denyContent;		// 거절상세	
	private String originName;		// 파일원본명(체험썸네일)
	private String changeName;		// 파일수정명(체험썸네일)
	private String filePath;		// 파일저장경로(체험썸네일)
	
	private String local;			// 지역
	private String totalSal;		// 누적판매수

}
