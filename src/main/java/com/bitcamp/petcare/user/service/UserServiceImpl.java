package com.bitcamp.petcare.user.service;

import java.io.UnsupportedEncodingException;
import java.util.Objects;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	private JavaMailSenderImpl mailSender;		//메일관련 bean
	@Autowired
	private BCryptPasswordEncoder encoder;		//암호화관련 bean
	
	private int size;		//인증키 길이
	
	
	//회원가입
	@Override
	public int joinUser(UserDTO dto) {
		log.debug("joinUser({}) invoked", dto);
		
		Objects.requireNonNull(dto);		
		try {
			encryption(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
		
		return this.mapper.joinUser(dto);
	}//joinUser

	//로그인
	@Override
	public UserVO loginUser(UserDTO dto) {
		log.debug("loginUser({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		UserVO user = this.mapper.loginUser(dto);
		
		if(user == null) {
			//존재하지 않는 아이디인 경우
			log.info("아이디가 존재하지 않습니다.");
			return null;
			
		} else { 
			//아이디가 존재하는경우 비밀번호 검사
			try {
				if(login(dto, user)) {
					//아이디와 비밀번호가 일치하는 경우
					return user;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}//try-catch
		}//if-else
		
		return null;
	}//loginUser
	
	@Override
	public String checkId(String email) {
		//회원가입 - 아이디 중복확인
		log.debug("checkId({}) invoked", email);

		Objects.requireNonNull(email);
		
		String user = this.mapper.checkId(email);
		
		if(user == null) {
			return "success";
		} else {
			return "fail";
		}
	}//checkId
	
	@Override
	public String checkNickName(String nickName) {
		//회원가입 - 닉네임 중복확인
		log.debug("checkNickName({}) invoked", nickName);
		
		Objects.requireNonNull(nickName);
		
		String user = this.mapper.checkNickName(nickName);
		
		if(user == null) {
			return "success";
		} else {
			return "fail";
		}
	}//chekNickName
	
	//로그인시 암호화된 비밀번호 바교
	public boolean login(UserDTO dto, UserVO vo) throws Exception {
		log.debug("login() invoked");
		
	    log.info("\t + 로그인 시도 비밀번호 : {}", dto.getUserPw());
	    
	    String voPw = vo.getUserPw();
	    log.info("\t + 저장된 비밀번호 : {}", voPw);
	    
	    if(encoder.matches(dto.getUserPw(), voPw)) {
	    	log.info("비밀번호 일치");
	    	return true;
	    }else {
		   log.info("비밀번호 불일치");  
		   return false;
	    }//if-else
	}//login
	
	//비밀번호 변경
	@Override
	public int changePw(UserDTO dto) {
		log.debug("changePw({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		try {
			encryption(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
		
		int result = this.mapper.changePw(dto);
		
		return result;
	}//changePw
	
	@Override
	public int modifyUserWithRememberMe(UserDTO dto) throws Exception {
		log.debug("modifyUserWithRememberMe({}, {}, {}) invoked", dto.getUserId(), dto.getRemember(), dto.getRememberAge());
		
		Objects.requireNonNull(this.mapper);
		
		log.info("\t + dao : {}", this.mapper);
		
		return this.mapper.updateUserWithRememberMe(dto);
	}//modifyUserWithRememberMe

	@Override
	public UserVO findUserByRememberMe(String rememberMe) throws Exception {
		log.debug("findUserByRememberMe({}) invoked", rememberMe);
		
		Objects.requireNonNull(this.mapper);
		
		log.info("\t + dao : {}", this.mapper);
		
		return this.mapper.selectUserWithRememberMe(rememberMe);
	}//findUserByRememberMe
	
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
	@Override
	public String sendAuthMail(String email) {
		log.debug("sendAuthMail({}) invoked", email);
		//6자리 난수 인증번호 생성
		String authKey = getKey(6);
		
		//인증번호 보내기
        try {
            MailUtils sendMail = new MailUtils(mailSender);
            sendMail.setSubject("회원가입 이메일 인증");
            sendMail.setText(new StringBuffer().append("<h1>[쓰담쓰담 이메일 인증]</h1>")
            .append("<p>아래 인증번호를 회원가입 페이지에 입력해주세요</p>")
            .append("<p>")
            .append("<strong>")
            .append(authKey)
            .append("</strong></p>")
            .toString());
            sendMail.setFrom("kjunsu200@gmail.com", "쓰담쓰담");
            sendMail.setTo(email);
            sendMail.send();
        } catch (MessagingException e) {
        	
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
          log.info("\t + authKey : {}", authKey);
          return authKey;
	}//sendAuthMail

	//비밀번호 암호화
	@Override
	public void encryption(UserDTO dto) throws Exception {
	  log.debug("encryption({}) invoked", dto);
	  
	  String encPassword = encoder.encode(dto.getUserPw());
	  dto.setUserPw(encPassword);
	  
	  log.info("암호화된 비밀번호 : "+dto.getUserPw());
		
	}//encryption
	
}//end class
