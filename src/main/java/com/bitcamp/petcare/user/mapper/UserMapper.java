package com.bitcamp.petcare.user.mapper;

import com.bitcamp.petcare.user.domain.UserDTO;
import com.bitcamp.petcare.user.domain.UserVO;

public interface UserMapper {
	
	public abstract int joinUser(UserDTO dto);
	public abstract UserVO loginUser(UserDTO dto);
	public abstract int deleteUser(UserDTO dto);
	public abstract int updateUser(UserDTO dto);

}//end interface
