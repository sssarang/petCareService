package com.bitcamp.petcare.admin.service;

import java.util.List;

import com.bitcamp.petcare.admin.domain.Criteria;
import com.bitcamp.petcare.admin.domain.FaqDTO;
import com.bitcamp.petcare.admin.domain.FaqVO;
import com.bitcamp.petcare.admin.domain.UserVO;

public interface AdminService {
	
	//FAQ관련
	public abstract int insertFAQ(FaqDTO dto);	//FAQ추가
	public abstract int deleteFAQ(FaqDTO dto);	//FAQ삭제
	public abstract int updateFAQ(FaqDTO dto);	//FAQ수정
	public abstract FaqVO selectFAQ(FaqDTO dto);	//FAQ조회
	public abstract List<FaqVO> getListWithPaging(Criteria cri);	//FAQ List 페이징조회
	public abstract int countFaq();				//FAQ 총 개수 조회
	
	//회원 관련
	public abstract List<UserVO> selectUser(Criteria cri);	//유저 조회
	public abstract int countUser(Criteria cri);			//회원 구분에 맞는 회원 수 조회
}//end interface
