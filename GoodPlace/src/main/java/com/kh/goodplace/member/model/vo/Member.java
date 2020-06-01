package com.kh.goodplace.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

	/*
	 * ** lombok 라이브러리
	 * 	    단지 어노테이션만으로 구성된 필드에 맞춰서
	 * 	    생성자, setter/getter 메소드, toString 등등이 알아서 자동으로 만들어짐
	 */


public class Member {
	private int urNo;			//유저번호
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
	
	
	private int rpNo;				//결제번호
	private Timestamp payDate; 		//결제일자 selectIncomeList()
	private int amount;				//결제금액
		
	public Member() {
		
	}

	public Member(int urNo, int paNo, String email, String userPwd, String userName, String phone, int point,
			String userKind, Date enrollDate, String status, int yellowCard, String originName, String changeName,
			String filePath, String partnerIntro, Date paEnrollDate, String accountName, int accountNum, String preMsg,
			int paYellowCard, String partnerStatus, int rpNo, Timestamp payDate, int amount) {
		super();
		this.urNo = urNo;
		this.paNo = paNo;
		this.email = email;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.point = point;
		this.userKind = userKind;
		this.enrollDate = enrollDate;
		this.status = status;
		this.yellowCard = yellowCard;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.partnerIntro = partnerIntro;
		this.paEnrollDate = paEnrollDate;
		this.accountName = accountName;
		this.accountNum = accountNum;
		this.preMsg = preMsg;
		this.paYellowCard = paYellowCard;
		this.partnerStatus = partnerStatus;
		this.rpNo = rpNo;
		this.payDate = payDate;
		this.amount = amount;
	}

	public int getUrNo() {
		return urNo;
	}

	public void setUrNo(int urNo) {
		this.urNo = urNo;
	}

	public int getPaNo() {
		return paNo;
	}

	public void setPaNo(int paNo) {
		this.paNo = paNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getUserKind() {
		return userKind;
	}

	public void setUserKind(String userKind) {
		this.userKind = userKind;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getYellowCard() {
		return yellowCard;
	}

	public void setYellowCard(int yellowCard) {
		this.yellowCard = yellowCard;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getPartnerIntro() {
		return partnerIntro;
	}

	public void setPartnerIntro(String partnerIntro) {
		this.partnerIntro = partnerIntro;
	}

	public Date getPaEnrollDate() {
		return paEnrollDate;
	}

	public void setPaEnrollDate(Date paEnrollDate) {
		this.paEnrollDate = paEnrollDate;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public int getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}

	public String getPreMsg() {
		return preMsg;
	}

	public void setPreMsg(String preMsg) {
		this.preMsg = preMsg;
	}

	public int getPaYellowCard() {
		return paYellowCard;
	}

	public void setPaYellowCard(int paYellowCard) {
		this.paYellowCard = paYellowCard;
	}

	public String getPartnerStatus() {
		return partnerStatus;
	}

	public void setPartnerStatus(String partnerStatus) {
		this.partnerStatus = partnerStatus;
	}

	public int getRpNo() {
		return rpNo;
	}

	public void setRpNo(int rpNo) {
		this.rpNo = rpNo;
	}

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Member [urNo=" + urNo + ", paNo=" + paNo + ", email=" + email + ", userPwd=" + userPwd + ", userName="
				+ userName + ", phone=" + phone + ", point=" + point + ", userKind=" + userKind + ", enrollDate="
				+ enrollDate + ", status=" + status + ", yellowCard=" + yellowCard + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", partnerIntro=" + partnerIntro
				+ ", paEnrollDate=" + paEnrollDate + ", accountName=" + accountName + ", accountNum=" + accountNum
				+ ", preMsg=" + preMsg + ", paYellowCard=" + paYellowCard + ", partnerStatus=" + partnerStatus
				+ ", rpNo=" + rpNo + ", payDate=" + payDate + ", amount=" + amount + "]";
	}

	
}
