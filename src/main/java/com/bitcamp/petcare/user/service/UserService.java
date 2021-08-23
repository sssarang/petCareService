package com.bitcamp.petcare.user.service;

import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;

public interface UserService {

	public abstract int joinUser(UserDTO dto);
	public abstract UserVO loginUser(UserDTO dto);
	public abstract String sendAuthMail(String email);
}//end interface