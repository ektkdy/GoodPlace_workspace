package com.kh.goodplace.common.model.vo;

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
public class Power {

	/* 파워결제 컬럼들 */
	private int ppNo;		// 파워결제번호
	private int roNo;		// 숙소번호
	private int price;		// 파워결제금액

	/* 파워 컬럼들 */
	private String powerKind;	// 파워종류
	private int period;			// 파워기간
	private int powerPrice;		// 파워금액
	
}
