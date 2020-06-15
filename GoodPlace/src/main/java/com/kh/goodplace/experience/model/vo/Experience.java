package com.kh.goodplace.experience.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;

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
	private int activity;			// 활동강도
	private int maxPeople;			// 최대인원수
	private String expDate;			// 체험날짜
	private String startTime;		// 운영시작시간
	private String endTime;			// 운영끝시간
	private String useTime;			// 체험소요시간
	private String intervalTime;	// 체험간격
	private String supplies;		// 준비물
	private String deadline;		// 예약가능시간
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
	private String expContent;		// 체험내용
	private String changeNameAt;
	
	private String local;			// 지역
	private String totalSal;		// 누적판매수
	
	/* 체험결제 컬럼들 */
	private int epNo; 				// 체험결제번호
	private int amount;				// 체험결제금액
	private Timestamp payDate;		// 체험결제일
	private String expDateUser;	// 체험신청일
	private int people;				// 인원수
	private int statusExp;			// 체험상태(승인1~)
	private String userName;	    // 예약자 이름
	private int expClassNo;		    // 교시 (수업시간)
	private String phone;			// 핸드폰번호

	/*관리자 검색용 키워드*/
	private String searchSelect;
	private String keyword;
	
	/* DB에는 없지만 추가한 필드 */
	private String expDateString;	// 체험날짜
	private ArrayList<Integer> expCountPerCategory;	// 카테고리별 등록된 체험 개수
	private ArrayList<String> expCategoryList;		// 카테고리명 뷰에 표시하는 용도
	private String expCategoryString;	// 카테고리 표시용
	private String paName;			// 파트너 이름
	private ArrayList<String> expClass;	// 수업교시정보
	private ArrayList<Integer> acceptedPeople; // 체험교시별 접수된 사람들
	private String detailImg1;  // Attachment 테이블에 담겨있는 체험상세이미지1
	private String detailImg2;  // Attachment 테이블에 담겨있는 체험상세이미지2
	private String detailImg3;  // Attachment 테이블에 담겨있는 체험상세이미지3
	private String detailImg4;  // Attachment 테이블에 담겨있는 체험상세이미지4
	private String detailImg5;  // Attachment 테이블에 담겨있는 체험상세이미지5
	private String myClassStartTime; // 내가 예약한 수업교시의 시작시간
	
	/* DB에도 추가한 필드 */
	private int expClassCount;		// 하루에 진행되는 수업 개수
	private String email;			//이메일
	
	/* Member테이블  + Partner테이블 */
	private String paPofile;	 	// 프로필사진 변경이름
	private String partnerIntro;	// 파트너소개
	private String paAccountName; 	//은행명
	private String paAccountNum;		//계좌번호
}
