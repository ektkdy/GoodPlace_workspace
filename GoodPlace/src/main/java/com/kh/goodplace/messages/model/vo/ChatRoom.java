package com.kh.goodplace.messages.model.vo;

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
public class ChatRoom {
	private String chNo;
	private String userEmail;
	private String tutorEmail;
	private int class_class_id;
}
