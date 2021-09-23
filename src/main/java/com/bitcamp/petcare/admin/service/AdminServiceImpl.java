package com.bitcamp.petcare.admin.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.admin.domain.Criteria;
import com.bitcamp.petcare.admin.domain.FaqDTO;
import com.bitcamp.petcare.admin.domain.FaqVO;
import com.bitcamp.petcare.admin.domain.UserVO;
import com.bitcamp.petcare.admin.mapper.AdminMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class AdminServiceImpl implements AdminService{
	
	@Setter(onMethod_=@Autowired)
	private AdminMapper mapper;

	//=================================FAQ관련====================================
	@Override
	public int insertFAQ(FaqDTO dto) {
		log.debug("updateFAQ({}) invoed", dto);
		
		Objects.requireNonNull(dto);
		
		int result = this.mapper.insertFAQ(dto);
		
		return result;
	}//updateFAQ

	@Override
	public int deleteFAQ(FaqDTO dto) {
		log.debug("deleteFAQ({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		int result = this.mapper.deleteFAQ(dto);
		return result;
	}//deleteFAQ

	@Override
	public int updateFAQ(FaqDTO dto) {
		log.debug("updateFAQ({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		int result = this.mapper.updateFAQ(dto);
		return result;
	}//updateFAQ

	@Override
	public FaqVO selectFAQ(FaqDTO dto) {
		log.debug("selectFAQ({}) invoked", dto);
		
		Objects.requireNonNull(dto);
		
		FaqVO vo = this.mapper.selectFAQ(dto);
		return vo;
	}//selectFAQ

	@Override
	public List<FaqVO> getListWithPaging(Criteria cri) {
		log.debug("getListWithPaging({}) invoked", cri);
		
		List<FaqVO> faq = this.mapper.getListWithPaging(cri);
		
		Objects.requireNonNull(faq);
		
		return faq;
	}//getListWithPaging
	
	@Override
	public int countFaq() {
		log.debug("countFaq() invoked");
		
		return this.mapper.countFaq();
	}//countFaq
	
	//=================================회원 관련====================================
	@Override
	public List<UserVO> selectUser(Criteria cri) {
		log.debug("selectUser({}) invoked", cri);
		
		List<UserVO> user = this.mapper.selectUser(cri);
		
		Objects.requireNonNull(user);
		
		return user;
	}//selectUser

	@Override
	public int countUser(Criteria cri) {
		log.debug("countUser({}) invoked", cri);

		return this.mapper.countUser(cri);
	}//countUser
	
	
}//end class
