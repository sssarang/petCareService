package com.bitcamp.petcare.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
import com.bitcamp.petcare.mypage.domain.PetsitterSkillVO;
import com.bitcamp.petcare.mypage.domain.ServiceCalendarVO;
import com.bitcamp.petcare.mypage.domain.ServicePetkindsVO;
import com.bitcamp.petcare.mypage.domain.ServiceTypeDTO;
import com.bitcamp.petcare.mypage.domain.ServiceTypeVO;
import com.bitcamp.petcare.mypage.domain.SitterHistoryManageVO;
import com.bitcamp.petcare.mypage.domain.SitterReplyManageDTO;
import com.bitcamp.petcare.mypage.domain.SitterReplyManageVO;
import com.bitcamp.petcare.mypage.domain.SitterResvManageVO;
import com.bitcamp.petcare.mypage.domain.userPasswordVO;
import com.bitcamp.petcare.mypage.service.MypageService;
import com.bitcamp.petcare.user.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor


@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Setter(onMethod_= @Autowired)
	private MypageService service;

	private String loginKey = "__LOGIN__";
	
	Double x;			//경도
	Double y;			//위도
	
	@Autowired
	private BCryptPasswordEncoder encoder;		//암호화관련 bean
	

	@GetMapping("main")							// 마이페이지 메인
	public String  main(HttpSession session, Model model) {
		log.debug("main() invoked.");
		
		log.info(session.getClass().getName());
		log.info(session.getAttribute(loginKey));
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		log.debug(vo.getUserId());
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		log.debug("classify : {} ", classify);
		
		log.info(vo.getUserNo());
		return "mypage/myPageMain";
	} //main
	
	
	//  ========================회원정보관리 페이지==========================
	
	@GetMapping("userInfoManage")				// 회원정보관리
	public void userInfoManage(Integer userNo, Model model, HttpSession session) {
		log.debug("userInfoManage() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		CustomerInfoManageVO info = this.service.readInfo(vo.getUserNo());
		
		Objects.requireNonNull(info);
		
		log.info("\t+ info : {} " , info);
		
		model.addAttribute("userNo", userNo);
		model.addAttribute("info", info);		
	}	//userInfoManage
	

	//좌표값 받아오는 메소드
	@RequestMapping(value="coordinate", method=RequestMethod.POST)
	@ResponseBody
	public String coordinate(String x, String y) {
		log.debug("coordinate({}, {}) invoked",x, y);
		this.x = Double.parseDouble(x);
		this.y = Double.parseDouble(y);
		
		return null;
	}	//coordinate
	
	// 회원정보 수정
	@PostMapping("userInfoModify")
	public String userInfoModify(CustomerInfoManageDTO dto) {
		log.debug("userInfoModify({}) invoked.", dto);
		
		dto.setUserLatitude(y);
		dto.setUserLongitude(x);
		
		this.service.modifyInfo(dto);
		
		return "redirect:/mypage/main";
	}	// userInfoModify
	
	// 기존 암호화 비밀번호 조회
	@ResponseBody
	@PostMapping("readPw")
	public boolean readPw(@RequestParam(value = "oldPw")String inputOldPw, HttpSession session) throws Exception {


		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		userPasswordVO oldPw = this.service.readPw(vo.getUserNo());
		
		log.debug("넣은 값 : {} ", inputOldPw);
		
		log.debug("기존 값 : {} ", oldPw.getUserPw());
		
		boolean match = encoder.matches(inputOldPw, oldPw.getUserPw());
		
		return match;
		//String encrypedInputPw = this.service.encryption(inputOldPw);
		
				
	}	// readPw
	
	
	
	
	//  ========================프로필 페이지==========================

	@GetMapping("customerProfileManage")		// 반려인 프로필 페이지(조회)
	public void getProfile( Model model, HttpSession session) {
		log.debug("customerProfileManage() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		
		CustomerProfileManageVO profile = this.service.readProfile(vo.getUserNo());

		
		log.info("\t+ getProfile : {} ", profile);
		
		model.addAttribute("userNo", vo.getUserNo());
		model.addAttribute("profile", profile);
	}	//customerProfileManage
	
	@PostMapping("customerProfileModify")		// 반려인 프로필 페이지(수정)
	public String modifyProfile(HttpServletRequest req, Integer userNo, CustomerProfileManageDTO modify, HttpSession session) throws IOException {
		log.debug("modifyProfile() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String fileName = "proPhoto_"+vo.getUserNo()+".jpg";
		//String path = req.getServletContext().getRealPath("/resources/assets/img/mypage");
		String path = "C:\\opt\\eclipse\\workspace\\JEE\\petCareServiceTest\\src\\main\\webapp\\resources\\assets\\img\\mypage";
		log.info("path : {}", path);
		File file = new File(path, fileName);
		modify.getProPhotoFile().transferTo(file);
		
		modify.setProPhoto("/resources/assets/img/mypage/"+fileName);

		CustomerProfileManageVO vo2 = this.service.readProfile(vo.getUserNo());
		if(vo2 == null) {
			this.service.registerProfile(modify);
		}else {
			this.service.modifyProfile(modify);
		}
		return "redirect: /mypage/main";
	}	// modifyProfile
	
	
	//  ========================이력관리 페이지==========================
	
	@GetMapping("customerHistoryManage")		// 반려인 이력관리 페이지(조회)
	public void customerHistoryManage(Integer petUserNo, Model model, HttpSession session) {
		log.debug("customerHistoryManage() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		List<CustomerHistoryManageVO> history = this.service.readHistory(vo.getUserNo());
		//CustomerReviewManageVO review = this.service.readReview(serviceId);
		
		
		assert history != null;
		
		log.info("\t+ history : {} ", history);
		
		model.addAttribute("history", history);
		//model.addAttribute("review", review);
	}	// customerHistoryManage
	
	
	@ResponseBody
	@GetMapping("customerReviewManage")			// 저장된 리뷰 조회
	public CustomerReviewManageVO  customerReviewManage(@RequestParam(value = "serviceId")Integer serviceId) {
		log.debug("customerReviewManage() invoked.");
		
		CustomerReviewManageVO review = this.service.readReview(serviceId);
		
		
		
		return review;
	}	// customerReviewManage
	
	@ResponseBody
	@PostMapping("customerReviewSend")		// 반려인 리뷰 페이지(전송)
	public boolean registerReview(CustomerReviewManageDTO review) {
		log.debug("customerHistoryManage() invoked.");
		
		
		if(this.service.readReview(review.getServiceId()) == null) {			// 값이 없다면 입력
			this.service.registerReview(review);
		}else {																	// 값이 있다면 수정
			this.service.modifyReview(review);
		}
		
		return true;
		//return "mypage/customerHistoryManageBody";
	}	// registerReview
	

	
	//  ========================예약관리 페이지==========================
	
	@GetMapping("customerResvManage")
	public void customerResvManage(Integer petUserNo, Model model, HttpSession session) {
		log.debug("customerResvMange() invoked.");
		
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		CustomerResvManageVO resv = this.service.readResv(vo.getUserNo());
		
		
		if(resv != null) {
		CustomerPaymentManageVO payment = this.service.readPayment(resv.getServiceId());
		model.addAttribute("payment", payment);
		}
		
		model.addAttribute("petUserNo", vo.getUserNo());
		model.addAttribute("resv", resv);
		
	}	// customerResvManage
	
	@PostMapping("paymentSend")
	public String paymentSend(CustomerPaymentManageDTO dto) {
		log.debug("paymentSend() invoked.");
		
		this.service.insertPayment(dto);
		
		return "redirect:/mypage/customerResvManage";
	}	// paymentSend
	
	@ResponseBody
	@PostMapping("cancelResv")
	public void cancelResv(@RequestParam(value = "serviceId")Integer serviceId) {
		log.debug("cancelResv() invoked.");
		
		this.service.cancelResv(serviceId);
		
	}	// cancelResv
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
	  @GetMapping("sitterProfileManage")      // 펫시터 프로필 페이지 조회
	   public void getSitterProfile(Model model, HttpSession session) {
		   	log.debug("sitterProfileManage() invoked.");
		   	
		   	UserVO vo = (UserVO) session.getAttribute(loginKey);
		   	
		   	String classify = vo.getUserClassify();
		   	model.addAttribute("classify", classify);
	      
			PetsitterProfileVO sitterProfile = this.service.getPetsitterProfile(vo.getUserNo());
			//Objects.requireNonNull(sitterProfile);
			log.info("\t+ sitterProfile : {}", sitterProfile);
			model.addAttribute("userNo", vo.getUserNo());
			model.addAttribute("sitterProfile", sitterProfile);
						
			ServiceTypeVO serviceType = this.service.getServiceType(vo.getUserNo());
			//Objects.requireNonNull(serviceTypeList);
			log.info("\t+ serviceType : {}", serviceType);
			model.addAttribute("userNo", vo.getUserNo());
			model.addAttribute("serviceType", serviceType);
			
			List<PetsitterSkillVO> petsitterSkill = this.service.getPetsitterSkill(vo.getUserNo());
			//Objects.requireNonNull(petsitterSkillList);
			log.info("\t+ petsitterSkillList : {}", petsitterSkill);
			model.addAttribute("userNo", vo.getUserNo());
			model.addAttribute("petsitterSkillList", petsitterSkill);
			
			List<ServicePetkindsVO> servicePetkinds = this.service.getServicePetkinds(vo.getUserNo());
			//Objects.requireNonNull(servicePetkindsList);
			log.info("\t+ servicePetkindsList : {}", servicePetkinds);
			model.addAttribute("userNo", vo.getUserNo());
			model.addAttribute("servicePetkindsList", servicePetkinds);
			
			List<ServiceCalendarVO> serviceCalendar = this.service.getServiceCalendar(vo.getUserNo());
			//Objects.requireNonNull(serviceCalendarList);
			log.info("\t+ serviceCalendarList : {}", serviceCalendar);
			model.addAttribute("userNo", vo.getUserNo());
			model.addAttribute("serviceCalendarList", serviceCalendar);
			
			List<ActivityPhotoVO> activityPhoto = this.service.getActivityPhoto(vo.getUserNo());
			//Objects.requireNonNull(activityPhotoList);
			log.info("\t+ activityPhotoList : {}", activityPhoto);
			model.addAttribute("userNo", vo.getUserNo());
			model.addAttribute("activityPhotoList", activityPhoto);

	   }   // getSitterProfile
	   
		@PostMapping("sitterProfileModify")		// 펫시터 프로필 사진 수정
		public String updatePetsitterProfile(HttpServletRequest req, Integer userNo, PetsitterProfileDTO modify, HttpSession session) throws IOException {
			log.debug("updatePetsitterProfile() invoked.");		
			
			UserVO vo = (UserVO) session.getAttribute(loginKey);
			
			String fileName = "proPhoto_" + vo.getUserNo() +".jpg";
			String path = "C:\\opt\\eclipse\\workspace\\JEE\\petCareService\\src\\main\\webapp\\resources\\assets\\img\\mypage";
			log.info("path : {}", path);
			File file = new File(path, fileName);
			log.info("file : {}", file);
			modify.getProPhotoFile().transferTo(file);
			
			modify.setProPhoto("/resources/assets/img/mypage/"+fileName);

			PetsitterProfileVO vo2 = this.service.getPetsitterProfile(vo.getUserNo());
			if(vo2 == null) {
				this.service.insertPetsitterProfile(modify);
				log.info("insertPetsitterProfile() inovoked.");
			}else {
				this.service.updatePetsitterProfile(modify);
				log.info("updatePetsitterProfile() inovoked.");
			}
			
			return "redirect: /mypage/sitterProfileManage";
			
			
		} // sitterProfileModify
		
		@PostMapping("serviceTypeModify")		// 서비스타입 수정
		public String updateServiceType(
			HttpServletRequest req, Integer userNo, ServiceTypeDTO modify, HttpSession session) {
			log.debug("updateServiceType() invoked.");		
			
			UserVO vo = (UserVO) session.getAttribute(loginKey);

			ServiceTypeVO vo2 = this.service.getServiceType(vo.getUserNo());
			if(vo2 == null) {
				this.service.insertServiceType(modify);
				log.info("insertPetsitterProfile() inovoked.");
			}else {
				this.service.updateServiceType(modify);
				log.info("updatePetsitterProfile() inovoked.");
			}
			
			return "redirect: /mypage/sitterProfileManage";
			
			
		} // sitterProfileModify		
	     
	   //-----------------------------------------------------------------------------------------------------------------//
	   
	   @GetMapping("sitterHistoryManage")      // 펫시터 이력/리뷰관리
	   public void getSitterHistory(Integer petSitterNo, Model model, HttpSession session) {
		   	log.debug("getHistory() invoked.");
		   	
		   	UserVO vo = (UserVO) session.getAttribute(loginKey);
		   	
		   	String classify = vo.getUserClassify();
		   	model.addAttribute("classify", classify);
		   	
	        List<SitterHistoryManageVO> history = this.service.getHistory(vo.getUserNo());
	      
	        assert history != null;
	        
	        log.info("\t+ history : {}", history);
			
	        model.addAttribute("petSitterNo", petSitterNo);
	        model.addAttribute("history", history);
	   } // getSitterHistory
	   
	   @ResponseBody
	   @GetMapping("sitterReplyManage")
	   public SitterReplyManageVO sitterReplyManage(@RequestParam(value="serviceId")Integer serviceId) {
		   log.debug("sitterReplyManage() invoked.");
		   
		   SitterReplyManageVO reply = this.service.getReply(serviceId);
		   
		   log.info(reply);
		   return reply;
	   } // sitterReplyManage
	   
	   @ResponseBody
	   @PostMapping("sitterReplySend")
	   public boolean insertReply(SitterReplyManageDTO reply) {
		   log.debug("insertReply() invoked.");
		   
		   if(this.service.getReply(reply.getServiceId()) == null){
			   this.service.insertReply(reply);
		   }
		   else {
			   this.service.updateReply(reply);
		   }
		   
		   return true;
	   } // insertReply
	   
	          
	   //-----------------------------------------------------------------------------------------------------------------//
	   
	   @GetMapping("sitterResvManage")      // 펫시터 예약관리
	   public void getSitterResv(Integer petSitterNo, Model model, HttpSession session) {
	      log.debug("getSitterResv() invoked.");
	      
		  UserVO vo = (UserVO) session.getAttribute(loginKey);
		   	
		  String classify = vo.getUserClassify();
		  model.addAttribute("classify", classify);
	      
	      List<SitterResvManageVO> resv = this.service.getResv(vo.getUserNo());
	      
	      assert resv != null;
	      log.info("\t+ resv : {}", resv);
	      
	      model.addAttribute("petSitterNo", petSitterNo);
	      model.addAttribute("resv", resv);
	      
	   }   // getSitterResv
	   
		@ResponseBody
		@PostMapping("resvApprove")
		public void resvApprove(@RequestParam(value = "serviceId")Integer serviceId) {
			log.debug("resvApprove() invoked.");
			
			this.service.resvApprove(serviceId);
			
		}	// resvApprove
		
		@ResponseBody
		@PostMapping("resvRefusal")
		public void resvRefusal(@RequestParam(value = "serviceId")Integer serviceId) {
			log.debug("resvRefusal() invoked.");
			
			this.service.resvRefusal(serviceId);
			
		}	// resvRefusal

	     
	   //-----------------------------------------------------------------------------------------------------------------//
	   
	   @GetMapping("userWithdrawal")      // 회원탈퇴
	   public void userWithdrawal(Integer userNo, Model model) {
	      log.debug("userWithdrawal() invoked.");
	      
	      
	   }   // userWithdrawal
	   
		@ResponseBody
		@PostMapping("withdrawal")
		public void withdrawal(@RequestParam(value = "userNo")Integer userNo) {
			log.debug("withdrawal() invoked.");
			
			this.service.withdrawal(userNo);
			
		}	// withdrawal
	
} //end class
