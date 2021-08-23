package com.bitcamp.petcare.user.service;

import java.io.UnsupportedEncodingException;
import java.util.Objects;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;
import com.bitcamp.petcare.user.mapper.UserMapper;
import com.bitcamp.petcare.user.utils.MailUtils;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class UserServiceImpl implements UserService {

	@Setter(onMethod_=@Autowired)
	private UserMapper mapper;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int size;		//인증키 길이
	
	public int joinUser(UserDTO dto) {
		log.debug("joinUser({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		return this.mapper.joinUser(dto);
	}//joinUser

	@Override
	public UserVO loginUser(UserDTO dto) {
		log.debug("loginUser({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		UserVO user = mapper.loginUser(dto);
		
		return user;
	}//loginUser
	
	//인증키 생성
	private String getKey(int size) {
		log.debug("getKey({}) invoked", size);
		
		this.size = size;
		return getAuthCode();
	}//getKey
	
	//인증코드 난수 발생
	private String getAuthCode() {
		log.debug("getAuthCode() invoked");
		
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}//while
		
		return buffer.toString();
	}//getAuthCode
	
	//인증메일 보내기
	public String sendAuthMail(String email) {
		log.debug("sendAuthMail({}) invoked", email);
		//6자리 난수 인증번호 생성
		String authKey = getKey(6);
		
		//인증번호 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
            .append("<a href='http://localhost:9080/member/signUpConfirm?email=")
            .append(email)
            .append("&authKey=")
            .append(authKey)
            .append("' target='_blenk'>이메일 인증 확인</a>")
            .toString());
            sendMail.setFrom("이메일 주소", "관리자");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return authKey;
	}//sendAuthMail
	
}//end class
