package com.boot.jdbc.model.biz;

import java.util.HashMap;
import java.util.Random;

import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class SmsService {

	//coolsms : SMS API
	public static String PhoneAuthentication(String to) throws CoolsmsException {

		String api_key = "NCSCOSZIE1DJVBPP";
		String api_secret = "GZLY52DYQR49XCBHHGVZ4TMBRQ16HNXM";
		Message coolsms = new Message(api_key, api_secret);

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", to); // 수신 번호 (회원가입 화면에서 ajax로 받아온 값으로 넘김)
		params.put("from", "01090167721"); // 발신 번호
		params.put("type", "sms");
		params.put("text", "인증번호는 [" + numStr + "] 입니다.");

		coolsms.send(params); // 메시지 전송

		return numStr;
	}
}