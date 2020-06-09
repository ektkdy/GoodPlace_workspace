package com.kh.goodplace.messages.model.vo;

import java.sql.Timestamp;

import com.google.gson.Gson;

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
public class Message {
	private String msgNo;
	private String chNo;
	private String messageSender;
	private String messageReceiver;
	private String messageContent;
	private String messageSendTime;
	private String messageReadTime;

	
	public static Message convertMessage(String source) {
		Message message = new Message();
		Gson gson = new Gson();
		message = gson.fromJson(source,  Message.class);
		return message;
	}
}
