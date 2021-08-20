package com.bitcamp.petcare.user.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;
import com.bitcamp.petcare.user.mapper.UserMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class UserServiceImpl implements UserService {

	@Setter(onMethod_=@Autowired)
	private UserMapper mapper;
	
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
	
}//end class
