package com.kh.goodplace.messages.model.vo;



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
public class ChatRoom {
	private int chNo;
	private String userEmail;
	private String tutorEmail;
	private int class_class_id;
	
	private String recentMessage;
	private Timestamp recentTime;
}
