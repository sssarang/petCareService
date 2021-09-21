package com.bitcamp.petcare.mypage.service;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.bitcamp.petcare.mypage.domain.ActivityPhotoDTO;
import com.bitcamp.petcare.mypage.domain.ActivityPhotoVO;
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
import com.bitcamp.petcare.mypage.domain.ServiceCalendarVO;
import com.bitcamp.petcare.mypage.domain.ServicePetkindsDTO;
import com.bitcamp.petcare.mypage.domain.ServicePetkindsVO;
import com.bitcamp.petcare.mypage.domain.ServiceTypeDTO;
import com.bitcamp.petcare.mypage.domain.ServiceTypeVO;
import com.bitcamp.petcare.mypage.domain.SitterHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.SitterReplyManageDTO;
import com.bitcamp.petcare.mypage.domain.SitterReplyManageVO;
import com.bitcamp.petcare.mypage.domain.SitterResvManageVO;
import com.bitcamp.petcare.mypage.domain.userPasswordVO;
import com.bitcamp.petcare.mypage.mapper.CustomerHistoryManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerInfoManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerProfileManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerResvManageMapper;
import com.bitcamp.petcare.mypage.mapper.CustomerReviewManageMapper;
import com.bitcamp.petcare.mypage.mapper.SitterHistoryManageMapper;
import com.bitcamp.petcare.mypage.mapper.SitterProfileManageMapper;
import com.bitcamp.petcare.mypage.mapper.SitterReplyManageMapper;
import com.bitcamp.petcare.mypage.mapper.SitterResvManageMapper;
import com.bitcamp.petcare.mypage.mapper.UserWithdrawalMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class MypageServiceImpl implements MypageService {

	@Setter(onMethod_= @Autowired)
	private CustomerInfoManageMapper infoMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerProfileManageMapper profileMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerHistoryManageMapper historyMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerResvManageMapper resvMapper;
	
	@Setter(onMethod_= @Autowired)
	private CustomerReviewManageMapper reviewMapper;
	
	@Autowired
	private BCryptPasswordEncoder encoder;		//암호화관련 bean
	
	@Setter(onMethod_=@Autowired)
	private SitterProfileManageMapper sTprofileMapper;
	
	@Setter(onMethod_=@Autowired)
	private SitterHistoryManageMapper sThistoryMapper;
	
	@Setter(onMethod_=@Autowired)
	private SitterResvManageMapper sTresvMapper;
	
	@Setter(onMethod_=@Autowired)
	private SitterReplyManageMapper sTreplyMapper;
	
	@Setter(onMethod_=@Autowired)
	private UserWithdrawalMapper sTwithdrawalMapper;
	
	
	//================================================================
	// 회원정보관리 페이지	
	
	// 회원정보 조회
	@Override
	public CustomerInfoManageVO readInfo(Integer userNo) {
		log.debug("readInfo({}) invoked.", userNo);
		
		Objects.requireNonNull(this.infoMapper);
		
		return this.infoMapper.readInfo(userNo);
		
	}	// readResv
	
	
	// 회원정보 수정
	@Override
	public int modifyInfo(CustomerInfoManageDTO dto) {
		log.debug("modifyInfo({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.infoMapper.updateInfo(dto);
	}	// 

	
	// 암호화 비밀번호 조회 
	@Override
	public userPasswordVO readPw(Integer userNo) {
		log.debug("readPw() invoked.");
		
		Objects.requireNonNull(this.infoMapper);
		
		return this.infoMapper.readPw(userNo);
	}	// readPw
	
	//비밀번호 암호화
	@Override
	public String encryption(String oldPw) throws Exception {
	  log.debug("encryption({}) invoked", oldPw);
	  
	  String encPassword = encoder.encode(oldPw);
	  
	  
	  log.info("암호화된 비밀번호 : "+ encPassword);
		
	  return encPassword;
	}//encryption
		
		
	//================================================================
	// 프로필 페이지
	
	// 프로필 조회
	@Override
	public CustomerProfileManageVO readProfile(Integer userNo) {					// 프로필 조회
		log.debug("getProfile({}) invoked.", userNo);
		
		Objects.requireNonNull(this.profileMapper);
		
		return this.profileMapper.readProfile(userNo);
	}	// getProfile

	// 프로필 등록
	@Override
	public int registerProfile(CustomerProfileManageDTO dto) {					// 프로필 등록
		log.debug("registerProfile({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.profileMapper.insertProfile(dto);
	}	//registerProfile

	// 프로필 수정
	@Override
	public int modifyProfile(CustomerProfileManageDTO dto) {					// 프로필 수정
		log.debug("modifyProfile({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.profileMapper.updateProfile(dto);
	}	//modifyProfile
	
	
	//================================================================
	// 이력 관리 페이지
	
	// 이력 조회
	@Override
	public List<CustomerHistoryManageVO> readHistory(Integer petUserNo) {		// 이력 조회
		log.debug("readHistory({}) invoked.", petUserNo);
		
		Objects.requireNonNull(this.historyMapper);
		
		return this.historyMapper.readHistory(petUserNo);
	}	// readHistory
	
	// 작성한 리뷰 조회
	@Override
	public CustomerReviewManageVO readReview(Integer serviceId) {
		log.debug("getReview({}) invoked.", serviceId);
		
		
		return this.reviewMapper.readReview(serviceId);
	}	// getReview
	
	// 리뷰 작성
	@Override
	public int registerReview(CustomerReviewManageDTO dto) {
		log.debug("registerReview() invoked.");
		
		Objects.requireNonNull(this.reviewMapper);
		
		return this.reviewMapper.insertReview(dto);
	}	// registerReview

	// 리뷰 수정
	@Override
	public int modifyReview(CustomerReviewManageDTO dto) {
		log.debug("modifyReview() invoked.");
		
		Objects.requireNonNull(this.reviewMapper);
		
		return this.reviewMapper.updateReview(dto);
	}	// modifyReview
	
	
	//================================================================
	// 예약 관리 페이지
	
	// 예약 조회
	@Override
	public CustomerResvManageVO readResv(Integer petUserNo) {					// 예약 조회
		log.debug("readResv() invoked.");
		
		
		return this.resvMapper.readResv(petUserNo);
	}	// readResv

	// 결제유무 조회
	@Override
	public CustomerPaymentManageVO readPayment(Integer serviceId) {				// 결제정보 조회
		log.debug("readPayment() invoked.");
		
		return this.resvMapper.readPayment(serviceId);
	}	// readPayment
	
	// 결제 등록
	@Override
	public int insertPayment(CustomerPaymentManageDTO dto) {					// 결제정보 입력
		log.debug("insertPayment() invoked.");
		
		return this.resvMapper.insertPayment(dto);
	}	// insertPayment


	// 예약 취소
	@Override	
	public int cancelResv(Integer serviceId) {									// 예약 취소
		log.debug("cancelResv() invoked");
		
		return this.resvMapper.cancelResv(serviceId);
	}	// cancelResv


	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	//--------------------------------------------------------------------//
	// select

	@Override
	public PetsitterProfileVO getPetsitterProfile(Integer userNo) {
		log.debug("getPetsitterProfile({}) invoked.", userNo);
		
		Objects.requireNonNull(this.sTprofileMapper);
		
		return this.sTprofileMapper.getPetsitterProfile(userNo);
		
	} // getPetsitterProfile

	@Override
	public ServiceTypeVO getServiceType(Integer userNo) {
		log.debug("getServiceType({}) invoked.", userNo);
		
		Objects.requireNonNull(this.sTprofileMapper);
		
		return this.sTprofileMapper.getServiceType(userNo);
		
	} // getServiceType


	@Override
	public List<PetsitterSkillVO> getPetsitterSkill(Integer userNo) {
		log.debug("getPetsitterSkill({}) invoked.", userNo);
		
		Objects.requireNonNull(this.sTprofileMapper);
		
		return this.sTprofileMapper.getPetsitterSkill(userNo);
		
	} // getPetsitterSkill

	@Override
	public List<ServicePetkindsVO> getServicePetkinds(Integer userNo) {
		log.debug("getServicePetKinds({}) invoked.", userNo);
		
		Objects.requireNonNull(this.sTprofileMapper);
		
		return this.sTprofileMapper.getServicePetKinds(userNo);
		
	} // getServicePetKinds

	@Override
	public List<ServiceCalendarVO> getServiceCalendar(Integer userNo) {
		log.debug("getServiceCalendar({}) invoked.", userNo);
		
		Objects.requireNonNull(this.sTprofileMapper);
		
		return this.sTprofileMapper.getServiceCalendar(userNo);
		
	} // getServiceCalendar

	@Override
	public List<ActivityPhotoVO> getActivityPhoto(Integer userNo) {
		log.debug("getActivityPhoto({}) invoked.", userNo);
		
		Objects.requireNonNull(this.sTprofileMapper);
		
		return this.sTprofileMapper.getActivityPhoto(userNo);
		
	} // getActivityPhoto
	
	//--------------------------------------------------------------------//
	// insert

	@Override
	public int insertPetsitterProfile(PetsitterProfileDTO dto) {
		log.debug("insertPetsitterProfile({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.insertPetsitterProfile(dto);
	} // insertPetsitterProfile

	@Override
	public int insertServiceType(ServiceTypeDTO dto) {
		log.debug("insertServiceType({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.insertServiceType(dto);
	} // insertServiceType

	
	@Override
	public int insertPetsitterSkill(PetsitterSkillDTO dto) {
		log.debug("insertPetsitterSkill({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.insertPetsitterSkill(dto);
	} // insertPetsitterSkill

	@Override
	public int insertServicePetkinds(ServicePetkindsDTO dto) {
		log.debug("insertServicePetkinds({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.insertServicePetkinds(dto);
	} // insertServicePetkinds

	@Override
	public int insertServiceCalendar(ServiceCalendarDTO dto) {
		log.debug("insertServiceCalendar({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.insertServiceCalendar(dto);
	} // insertServiceCalendar

	@Override
	public int insertActivityPhoto(ActivityPhotoDTO dto) {
		log.debug("insertActivityPhoto({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.insertActivityPhoto(dto);
	} // insertActivityPhoto

	
	//--------------------------------------------------------------------//
	// update 
	
	@Override
	public int updatePetsitterProfile(PetsitterProfileDTO dto) {
		log.debug("updatePetsitterProfile({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.updatePetsitterProfile(dto);
	} // updatePetsitterProfile

	@Override
	public int updateServiceType(ServiceTypeDTO dto) {
		log.debug("updateServiceType({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.updateServiceType(dto);
	} // updateServiceType

	
	@Override
	public int updatePetsitterSkill(PetsitterSkillDTO dto) {
		log.debug("updatePetsitterSkill({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.updatePetsitterSkill(dto);
	} // updatePetsitterSkill

	@Override
	public int updateServicePetkinds(ServicePetkindsDTO dto) {
		log.debug("updateServicePetkinds({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.updateServicePetkinds(dto);
	} // updateServicePetkinds

	@Override
	public int updateServiceCalendar(ServiceCalendarDTO dto) {
		log.debug("updateServiceCalendar({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.updateServiceCalendar(dto);
	} // updateServiceCalendar

	@Override
	public int updateActivityPhoto(ActivityPhotoDTO dto) {
		log.debug("updateActivityPhoto({}) invoked.", dto);
		
		Objects.requireNonNull(dto);
		
		return this.sTprofileMapper.updateActivityPhoto(dto);
	} // updateActivityPhoto
	
	
	//--------------------------------------------------------------------//
	// sitterHistory

	@Override
	public List<SitterHistoryManageVO> getHistory(Integer petSitterNo) {
		log.debug("getHistory({}) invoked.", petSitterNo);
		
		Objects.requireNonNull(this.sThistoryMapper);
		
		return this.sThistoryMapper.getHistory(petSitterNo);
		
	} // getHistory

	
	//--------------------------------------------------------------------//
	// sitterResv
	
	@Override
	public List<SitterResvManageVO> getResv(Integer petSitterNo) {
		log.debug("getResv({}) invoked.", petSitterNo);
		
		Objects.requireNonNull(this.sTresvMapper);
		
		return this.sTresvMapper.getResv(petSitterNo);
		
	} // getResv
	
	@Override
	public int resvApprove(Integer serviceId) {
		log.debug("resvApprove() invoked.");
		
		return this.sTresvMapper.resvApprove(serviceId);
	} // resvApprove

	@Override
	public int resvRefusal(Integer serviceId) {
		log.debug("resvRefusal() invoked.");
		
		return this.sTresvMapper.resvRefusal(serviceId);
	} // resvRefusal

	//--------------------------------------------------------------------//

	@Override
	public SitterReplyManageVO getReply(Integer serviceId) {
		log.debug("getReply({}) invoked.", serviceId);
		
		return this.sTreplyMapper.getReply(serviceId);
	} // readReply
	
	@Override
	public int insertReply(SitterReplyManageDTO dto) {
		log.debug("insertReply() invoked.");
		
		Objects.requireNonNull(this.sTreplyMapper);
		
		return this.sTreplyMapper.insertReply(dto);
	} // insertReply


	@Override
	public int updateReply(SitterReplyManageDTO dto) {
		log.debug("modifyReview() invoked.");
		
		Objects.requireNonNull(this.sTreplyMapper);
		
		return this.sTreplyMapper.updateReply(dto);
		
	} // updateReply
	
	//--------------------------------------------------------------------//

	@Override
	public int withdrawal(Integer userNo) {
		log.debug("withdrawal() invoked.");
		
		return this.sTwithdrawalMapper.withdrawal(userNo);
	} // withdrawal






	

	
}	// end class
