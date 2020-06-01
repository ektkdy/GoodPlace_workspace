package com.kh.goodplace.common.model.vo;

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
public class Attachment {
	
	/* 첨부파일 컬럼들 */
	private int fiNo;		// 파일번호
	private String originName;	// 파일원본명(숙소,체험상세)
	private String changeName;	// 파일수정명(숙소,체험상세)
	private String filePath;	// 파일저장경로(숙소,체험상세)
	private Date uploadDate;	// 업로드날짜
	private String status;	// 상태값
	private int category;	// 숙소(1),체험(2)
	private int roNo;		// 숙소번호
	private int exNo;		// 체험번호

}
