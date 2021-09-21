package com.bitcamp.petcare.mypage.mapper;

import com.bitcamp.petcare.mypage.domain.SitterReplyManageDTO;
import com.bitcamp.petcare.mypage.domain.SitterReplyManageVO;

public interface SitterReplyManageMapper {

	public abstract SitterReplyManageVO getReply(Integer serviceId);	// 답글 조회
	public abstract int insertReply(SitterReplyManageDTO dto);			// 답글 입력
	public abstract int updateReply(SitterReplyManageDTO dto);			// 답글 수정
	
} // end class
