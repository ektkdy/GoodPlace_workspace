package com.kh.goodplace.member.model.vo;

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
public class Member {
	
	private int usNo;			//유저번호
	private int paNo;			//파트너번호	
	private String email;		//이메일
	private String userPwd;		//유저비밀번호
	private String userName;	//유저이름
	private String phone;		//폰번호
	private int point;			//소지포인트
	private String userKind;	//회원종류 0관리자 , 1회원, 2파트너
	private Date enrollDate;	//가입일
	private String status;		//가입상태
	private int yellowCard;		//회원경고누적
	private String originName;	//프로필사진 원본이름
	private String changeName;	//프로필사진 변경이름
	private String filePath;	//프로필사진 저장경로
	
	private String partnerIntro;	//파트너소개
	private Date paEnrollDate;		//파트너가입일
	private String accountName; 	//은행명
	private int accountNum;			//계좌번호
	private String preMsg;			//기본응답메세지
	private int paYellowCard;		//경고누적
	private String partnerStatus;	//파트너신고상태
	private String kakaoId;			//카카오 아이디
	
	private int rpNo;				//결제번호
	private Timestamp payDate; 		//결제일자 selectIncomeList()
	private int amount;				//결제금액
		
	
}
