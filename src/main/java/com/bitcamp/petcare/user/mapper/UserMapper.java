package com.bitcamp.petcare.user.mapper;

import java.util.Date;

import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;

public interface UserMapper {
	
	public abstract int joinUser(UserDTO dto);				//회원가입
	public abstract UserVO loginUser(UserDTO dto);			//로그인
	public abstract String checkId(String email);			//닉네임체크
	public abstract String checkNickName(String nickName);	//닉네임체크
	public abstract int changePw(UserDTO dto);				//비밀번호 변경
	
	//사용자 테이블에 Remember-Me와 관련된 2개 컬럼 업데이트 수행
	public abstract int updateUserWithRememberMe(UserDTO dto) throws Exception;
	
	//RememberMe 값으로 조회해서, UserVO를 만들어 반환
	public abstract UserVO selectUserWithRememberMe(String rememberMe) throws Exception;
}//end interface
