package com.kh.goodplace.board.model.vo;

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
public class Board {
	
	/* 공지사항 컬럼들 */
	private int noNo;				// 공지사항 번호
	private String noticeTitle;		// 공지사항 제목
	private String noticeContent; 	// 공지사항 내용
	private Date noticeDate; 		// 공지사항 작성일
	private int count;				// 조회수
	private String status;
	
	private int prevNoNo;			// 공지사항 번호 -이전글
	private String prevTitle;		// 공지제목 -이전글
	private int nextNoNo;			// 공지사항 번호 -다음글
	private String nextTitle;		// 공지제목 -다음글
	
	/* FAQ 컬럼들 */
	private int faqNo;				// faq번호
	private String faqCategory;		// faq카테고리
	private String faqTitle;		// faq제목
	private String faqContent;		// faq내용
	private Date faqCreateDate;		// faq작성일

	
	/* 이번트 컬럼들 */
	private int evNo;				// 이벤트번호
	private String eventTitle;		// 이벤트제목
	private String eventContent;	// 이벤트내용
	private String eventSubtitle;	// 이벤트 소제목
	private Date eventstart;		// 이벤트시작일
	private Date eventEnd;			// 이벤트마감일
	private Date eventCreateDate;	// 이벤트작성일
	private Date eventModifyDate;	// 이벤트수정일
	private String originName;		// 이벤트 썸네일 원본명
	private String changeName;		// 이벤트 썸네일 수정명
	private String filePath;		// 이벤트 썸네일 파일저장경로

	
	/* 1:1 문의 관련 컬럼들 */
	private int inNo;				// 문의번호
	private int roNo; 				// 숙소번호
	private int rpNo;				// 숙소결제번호
	private int userNo;				// 회원번호
	private int inqCategory;		// 일반(1),숙소/체험(2),취소환불(3),포인트(4),신고(5)
	private String inqContent;		// 문의내용
	private String inqTitle;		// 문의제목
	private Date inqDate;			// 문의날짜
	private String inqReTitle;		// 답글제목
	private String inqReContent;	// 문의답글
	private String inqReStatus;		// 답변대기(1), 답변완료(2)
	private String inqStatus;		// 문의상태값
	/*1:1문의 detail select 용*/
	private String email;
	private String expTitle;
	
	/*관리자 검색용 키워드*/
	private String searchSelect;
	private String searchSelect2;
	private String keyword;

	
	/*신고관리 select 용*/
	private int userNoR;			//룸 관련 신고당한사람 번호
	private int userNoV;			//후기 관련 신고당한사람 번호
	private int userNoE;			//체험 관련 신고당한사람 번호
	private String emailR;			//룸 관련 신고당한사람 이메일
	private String emailV;			//후기 관련 신고당한사람 이메일
	private String emailE;			//체험 관련 신고당한사람 이메일
	private int yellowCardR;		//룸 관련 신고당한사람 경고횟수
	private int yellowCardV;		//후기 관련 신고당한사람 경고횟수
	private int yellowCardE;		//체험 관련 신고당한사람 경고횟수
	private int partnerNoR;
	private int partnerNoE;
	private int yellowCardRp;
	private int yellowCardEp;
	

	
	
	/* 리뷰 관련 컬럼들 */
	private int reNo;				// 리뷰번호
	private String userName;		// 리뷰작정한 회원 이름 + 회원번호
	private String reTitle;			// 리뷰제목
	private String reContent;		// 리뷰내용
	private Date reviewDate;		// 리뷰작성일
	private String roomsTitle;		// 숙소명
	private int score;				// 평점
	private String reply;			// 답글내용
	private Date replyDate;			// 답글작성일
	private String replyStatus;	    // 답글 상태
	
	private String concept;			// 여행컨셉
	private String age;				// 연령대
	private Date endDays;			// 여행날짜
	
	/* 숙소 결제 컬럼들 */
	private int amount;		// 결제금액
	private String brithDate;	// 예약자 생년월일
	private Timestamp payDate;	// 결제날짜
	private int addPoint;	// 적립포인트
	private String checkIn;	// 체크인시간
	private int reserveStatus; 	// 예약상태
	private int usePoint;	// 사용포인트
	private int people;		// 예약인원수
	private String request;	// 요청사항
	private Date startDays;	// 예약시작일자

}
