package com.bitcamp.petcare.mypage.service;

import java.util.List;

import com.bitcamp.petcare.mypage.domain.ActivityPhotoDTO;
import com.bitcamp.petcare.mypage.domain.CustomerHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerInfoManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerPaymentManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerProfileManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerResvManageVO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageDTO;
import com.bitcamp.petcare.mypage.domain.CustomerReviewManageVO;
import com.bitcamp.petcare.mypage.domain.PetsitterProfileDTO;
import com.bitcamp.petcare.mypage.domain.PetsitterProfileVO;
import com.bitcamp.petcare.mypage.domain.PetsitterSkillDTO;
import com.bitcamp.petcare.mypage.domain.PetsitterSkillVO;
import com.bitcamp.petcare.mypage.domain.ServiceCalendarDTO;
import com.bitcamp.petcare.mypage.domain.ServicePetkindsDTO;
import com.bitcamp.petcare.mypage.domain.ServicePetkindsVO;
import com.bitcamp.petcare.mypage.domain.ServiceTypeDTO;
import com.bitcamp.petcare.mypage.domain.ServiceTypeVO;
import com.bitcamp.petcare.mypage.domain.SitterHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.SitterReplyManageDTO;
import com.bitcamp.petcare.mypage.domain.SitterReplyManageVO;
import com.bitcamp.petcare.mypage.domain.SitterResvManageVO;
import com.bitcamp.petcare.mypage.domain.SitterReviewManageVO;
import com.bitcamp.petcare.mypage.domain.UserPasswordDTO;
import com.bitcamp.petcare.mypage.domain.userPasswordVO;

public interface MypageService {

	// 회원정보관리 페이지
	public abstract CustomerInfoManageVO readInfo(Integer userNo);					// 회원정보 조회
	public abstract int modifyInfo(CustomerInfoManageDTO dto);						// 회원정보 수정
	public abstract userPasswordVO readPw(Integer userNo);							// 암호화 비밀번호 조회
	public abstract String encryptionOld(String oldPw) throws Exception;				// 기존 비밀번호 암호화
	public abstract String encryptionNew(String newPw) throws Exception;
	public abstract int updatePw(UserPasswordDTO dto);
	
	// 프로필 페이지
	public abstract CustomerProfileManageVO readProfile(Integer userNo);			// 프로필 정보 조회
	public abstract int registerProfile(CustomerProfileManageDTO dto);				// 새로운 프로필 등록
	public abstract int modifyProfile(CustomerProfileManageDTO dto);				// 프로필 수정
	
	
	// 이력관리 페이지
	public abstract List<CustomerHistoryManageVO> readHistory(Integer serviceId);	// 이력 조회
	
	// 리뷰관련
	public abstract CustomerReviewManageVO readReview(Integer serviceId);			// 리뷰 조회
	public abstract int registerReview(CustomerReviewManageDTO dto);				// 리뷰 작성
	public abstract int modifyReview(CustomerReviewManageDTO dto);					// 리뷰 수정
	
	// 예약관리 페이지
	public abstract CustomerResvManageVO readResv(Integer petUserNo);				// 예약 조회
	public abstract CustomerPaymentManageVO readPayment(Integer serviceId);			// 결제 조회
	public abstract int insertPayment(CustomerPaymentManageDTO dto);				// 결제 방법 작성
	public abstract int cancelResv(Integer serviceId);								// 예약 취소
	
	
	
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// sitterProfile
	// select
	public abstract PetsitterProfileVO getPetsitterProfile(Integer userNo); 
	public abstract List<ServiceTypeVO> getServiceType(Integer userNo);		
	public abstract List<PetsitterSkillVO> getPetsitterSkill(Integer userNo);		 
	public abstract List<ServicePetkindsVO> getServicePetkinds(Integer userNo);	 
	public abstract List<ServiceCalendarDTO> getServiceCalendar(Integer userNo);	 	
	public abstract List<ActivityPhotoDTO> getActivityPhoto(Integer userNo);	

	// insert
	public abstract int insertPetsitterProfile(PetsitterProfileDTO dto);
	public abstract int insertServiceType(ServiceTypeDTO dto);	
	public abstract int insertPetsitterSkill(PetsitterSkillDTO dto);
	public abstract int insertServicePetkinds(ServicePetkindsDTO dto);
	public abstract int insertActivityPhoto(ActivityPhotoDTO dto);
	
	// update
	public abstract int updatePetsitterProfile(PetsitterProfileDTO dto);
	public abstract int updateServiceType(ServiceTypeDTO dto);	
	public abstract int updatePetsitterSkill(PetsitterSkillDTO dto);
	public abstract int updateServicePetkinds(ServicePetkindsDTO dto);
	public abstract int updateServiceCalendar(ServiceCalendarDTO dto);
	public abstract int updateActivityPhoto(ActivityPhotoDTO dto);
	
	//-----------------------------------------------------------------------//
	
	// sitterHistory
	public abstract List<SitterHistoryManageVO> getHistory(Integer petSitterNo);
	
	//-----------------------------------------------------------------------//
	
	// sitterResv
	public abstract List<SitterResvManageVO> getResv(Integer petSitterNo);
	public abstract int resvApprove(Integer serviceId);
	public abstract int resvRefusal(Integer serviceId);
	public abstract int resvCompletion(Integer serviceId);
	
	//-----------------------------------------------------------------------//
	
	// sitterReply
	public abstract SitterReplyManageVO getReply(Integer serviceId);
	public abstract SitterReviewManageVO getReview(Integer serviceId);
	public abstract int insertReply(SitterReplyManageDTO dto);						
	public abstract int updateReply(SitterReplyManageDTO dto);				
	
	
	//-----------------------------------------------------------------------//
	
	// userWithdrawal
	public abstract int withdrawal(Integer userNo);
	
	
	
	//merge
	public abstract int mergeServiceType(ServiceTypeDTO dto);
	public abstract int mergeSkillType(PetsitterSkillDTO dto);
	public abstract int mergePetType(ServicePetkindsDTO dto);
	
}	// end interface
