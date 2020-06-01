package com.kh.goodplace.board.model.vo;

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
public class Board {
	
	/* 공지사항 컬럼들 */
	private int noNo;				// 공지사항 번호
	private String noticeTitle;		// 공지사항 제목
	private String noticeContent; 	// 공지사항 내용
	private Date noticeDate; 		// 공지사항 작성일
	private int count;				// 조회수
	
	
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
	
	
	/* 리뷰 관련 컬럼들 */
	private int reNo;				// 리뷰번호
	private String reTitle;			// 리뷰제목
	private String reContent;		// 리뷰내용
	private Date reviewDate;		// 리뷰작성일
	private String reStatus;		// 답글여부
	private String roomsTitle;		// 숙소명
	private int score;				// 평점
	private String reply;			// 답글내용
	private Date replyDate;			// 답글작성일


}