package com.bitcamp.petcare.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	Double x;			//??????
	Double y;			//??????
	
	@Autowired
	private BCryptPasswordEncoder encoder;		//??????????????? bean
	

	@GetMapping("main")							// ??????????????? ??????
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
	
	
	//  ========================?????????????????? ?????????==========================
	
	@GetMapping("userInfoManage")				// ??????????????????
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
	
//
//	//????????? ???????????? ?????????
//	@RequestMapping(value="coordinate", method=RequestMethod.POST)
//	@ResponseBody
//	public String coordinate(String x, String y) {
//		log.debug("coordinate({}, {}) invoked",x, y);
//		this.x = Double.parseDouble(x);
//		this.y = Double.parseDouble(y);
//		
//		return null;
//	}	//coordinate
	
	// ???????????? ??????
	@PostMapping("userInfoModify")
	public String userInfoModify(CustomerInfoManageDTO dto, HttpSession session) {
		log.debug("userInfoModify({}) invoked.", dto);
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		dto.setUserNo(vo.getUserNo());
		
		this.service.modifyInfo(dto);
		
		return "redirect:/mypage/main";
	}	// userInfoModify
	
	// ?????? ????????? ???????????? ??????
	@ResponseBody
	@PostMapping("readPw")
	public boolean readPw(@RequestParam(value = "oldPw")String inputOldPw, HttpSession session) throws Exception {


		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		userPasswordVO oldPw = this.service.readPw(vo.getUserNo());
		
		log.debug("?????? ??? : {} ", inputOldPw);
		
		log.debug("?????? ??? : {} ", oldPw.getUserPw());
		
		boolean match = encoder.matches(inputOldPw, oldPw.getUserPw());
		
		return match;
		//String encrypedInputPw = this.service.encryption(inputOldPw);
		
	}	// readPw
	
	// to ????????? ???????????? ??????
		@ResponseBody
		@PostMapping("updatePw")
		public boolean updatePw(@RequestParam(value = "newPw")String inputNewPw,UserPasswordDTO dto, HttpSession session) throws Exception {
			log.debug("updatePw() invoked.");

			UserVO vo = (UserVO) session.getAttribute(loginKey);
			
			String encodedPw = this.service.encryptionNew(inputNewPw);
			
			dto.setUserNo(vo.getUserNo());
			dto.setUserPw(encodedPw);
			
			this.service.updatePw(dto);
			
			return true;
		}	// readPw
	
	
	
	
	//  ========================????????? ?????????==========================

	@GetMapping("customerProfileManage")		// ????????? ????????? ?????????(??????)
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
	
	@PostMapping("customerProfileModify")		// ????????? ????????? ?????????(??????)
	public String modifyProfile(HttpServletRequest req, Integer userNo, CustomerProfileManageDTO modify, HttpSession session) throws IOException {
		log.debug("modifyProfile() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String fileName = "proPhoto_"+vo.getUserNo()+".jpg";
		String path = "C:\\opt\\eclipse\\workspace\\JEE\\petCareService\\src\\main\\webapp\\resources\\assets\\img\\mypage";
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
	
	
	   @RequestMapping(value = "/link/{userNo}", method = RequestMethod.GET)
	   public ResponseEntity<Resource> link(HttpServletRequest request
	         , @PathVariable Integer userNo) throws IOException {
	      log.info("userNo: {}", userNo);
	      
	      
	      String fileName = "proPhoto_"+userNo+".jpg";
	     
	      
	      
	      final Path path = Paths.get("/opt").toAbsolutePath().normalize().resolve("eclipse").resolve("workspace").resolve("JEE").resolve("petCareService")
	                                       .resolve("src").resolve("main").resolve("webapp").resolve("resources").resolve("assets").resolve("img").resolve("mypage").resolve(fileName);
	      Resource resource = new UrlResource(path.toUri());
	      
	      log.info("toUri : {}", path.toUri());
	      
	      String contentType = null;
	        try {
	            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
	        } catch (IOException ex) {
	            log.info("Could not determine file type.");
	        }
	       
	        if(contentType == null) {
	            contentType = "application/octet-stream";
	        }
	        
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
	        headers.add("Pragma", "no-cache");
	        headers.add("Expires", "0");
	        headers.add("Content-Length", String.valueOf(path.toFile().length()));
	        headers.add("Accept-Ranges", "bytes");
	        
	        return ResponseEntity.ok()
	                .contentType(MediaType.parseMediaType(contentType))
	                .headers(headers)
	                .body(resource);
	   }
	
	
	//  ========================???????????? ?????????==========================
	
	@GetMapping("customerHistoryManage")		// ????????? ???????????? ?????????(??????)
	public void customerHistoryManage(Integer petUserNo, Model model, HttpSession session) {
		log.debug("customerHistoryManage() invoked.");
		
		UserVO vo = (UserVO) session.getAttribute(loginKey);
		
		String classify = vo.getUserClassify();
		model.addAttribute("classify", classify);
		
		List<CustomerHistoryManageVO> history = this.service.readHistory(vo.getUserNo());
		//CustomerReviewManageVO review = this.service.readReview(serviceId);
		
		
		assert history != null;
		
		log.info("\t+ history : {} ", history);
		
		model.addAttribute("userNo", vo.getUserNo());
		model.addAttribute("history", history);
		//model.addAttribute("review", review);
	}	// customerHistoryManage
	
	
	@ResponseBody
	@GetMapping("customerReviewManage")			// ????????? ?????? ??????
	public CustomerReviewManageVO  customerReviewManage(@RequestParam(value = "serviceId")Integer serviceId) {
		log.debug("customerReviewManage() invoked.");
		
		CustomerReviewManageVO review = this.service.readReview(serviceId);
		
		if(review != null) {
		log.info("userNO ::::: {} ", review.getUserNo());
		};
		return review;
	}	// customerReviewManage
	
	@ResponseBody
	@PostMapping("customerReviewSend")		// ????????? ?????? ?????????(??????)
	public boolean registerReview(@RequestParam(value = "serviceId")Integer serviceId,
								  @RequestParam(value = "revContent")String revContent,
								  @RequestParam(value = "grade")Integer grade,
								  @RequestParam(value = "userNo")Integer userNo,
								  CustomerReviewManageDTO review
		) {
		log.debug("customerHistoryManage() invoked.");
		
		
		if(this.service.readReview(serviceId) == null) {						// ?????? ????????? ??????
			this.service.registerReview(review);
		}else {																	// ?????? ????????? ??????
			this.service.modifyReview(review);
		}
		
		return true;
		//return "mypage/customerHistoryManageBody";
	}	// registerReview
	

	
	//  ========================???????????? ?????????==========================
	
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
	
	@ResponseBody
	@PostMapping("paymentSend")
	public String paymentSend(CustomerPaymentManageDTO dto,
							  @RequestParam(value = "serviceId" )Integer serviceId,
							  @RequestParam(value = "paymentTypeCode" )String paymentTypeCode,
							  @RequestParam(value = "price" )Integer price,
							  @RequestParam(value = "userNo" )Integer userNo,
							  @RequestParam(value = "paymentId" )String paymentId) {
		log.debug("paymentSend() invoked.");
		
		log.info(serviceId);
		log.info(paymentTypeCode);
		log.info(price);
		log.info(userNo);
		log.info(paymentId);
		
		dto.setServiceId(serviceId);
		dto.setPaymentTypeCode(paymentTypeCode);
		dto.setPrice(price);
		dto.setUserNo(userNo);
		dto.setPaymentId(paymentId);
		
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
	
	  @GetMapping("sitterProfileManage")      // ????????? ????????? ????????? ??????
	   public void getSitterProfile(Model model, HttpSession session) {
		   	log.debug("sitterProfileManage() invoked.");
		   	
		   	UserVO vo = (UserVO) session.getAttribute(loginKey);
		   	
		   	String classify = vo.getUserClassify();
		   	model.addAttribute("classify", classify);
			model.addAttribute("userNo", vo.getUserNo());
	      
			PetsitterProfileVO sitterProfile = this.service.getPetsitterProfile(vo.getUserNo());
			//Objects.requireNonNull(sitterProfile);
			log.info("\t+ sitterProfile : {}", sitterProfile);
			model.addAttribute("sitterProfile", sitterProfile);
						
			List<ServiceTypeVO> serviceType = this.service.getServiceType(vo.getUserNo());
//			//Objects.requireNonNull(serviceTypeList);
//			log.info("\t+ serviceType : {}", serviceType);
			model.addAttribute("serviceType", serviceType);
			
			List<PetsitterSkillVO> petsitterSkill = this.service.getPetsitterSkill(vo.getUserNo());
			//Objects.requireNonNull(petsitterSkillList);
			log.info("\t+ petsitterSkillList : {}", petsitterSkill);
			model.addAttribute("petsitterSkillList", petsitterSkill);
			
			List<ServicePetkindsVO> servicePetkinds = this.service.getServicePetkinds(vo.getUserNo());
			//Objects.requireNonNull(servicePetkindsList);
			log.info("\t+ servicePetkindsList : {}", servicePetkinds);
			model.addAttribute("servicePetkindsList", servicePetkinds);
			
			List<ServiceCalendarDTO> serviceCalendar = this.service.getServiceCalendar(vo.getUserNo());
			//Objects.requireNonNull(serviceCalendarList);
			log.info("\t+ serviceCalendarList : {}", serviceCalendar);
			model.addAttribute("serviceCalendar", serviceCalendar);
			
			List<ActivityPhotoDTO> activityPhoto = this.service.getActivityPhoto(vo.getUserNo());
			//Objects.requireNonNull(activityPhotoList);
			log.info("\t+ activityPhotoList : {}", activityPhoto);
			model.addAttribute("activityPhotoList", activityPhoto);
			
	   }   // getSitterProfile
	   
		@PostMapping("sitterProfileModify")		// ????????? ????????? ?????? ??????
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
			
			
		} // updatePetsitterProfile
		
		@PostMapping("serviceTypeModify")		// ??????????????? ??????
		public String updateServiceType(
			HttpServletRequest req, Integer userNo, ServiceTypeDTO modify, HttpSession session) {
			log.debug("updateServiceType({}) invoked.",modify);		
			
			UserVO vo = (UserVO) session.getAttribute(loginKey);
			
			this.service.mergeServiceType(modify);
			
			return "redirect: /mypage/sitterProfileManage";
			
			
		} // updateServiceType	
		
		
		@PostMapping("skillTypeModify")		// ???????????? ??????
		public String updateSkillType(
			HttpServletRequest req, Integer userNo, PetsitterSkillDTO modify, HttpSession session) {
			log.debug("updateSkillType({}) invoked.",modify);		
			
			UserVO vo = (UserVO) session.getAttribute(loginKey);
			
			this.service.mergeSkillType(modify);
			
			return "redirect: /mypage/sitterProfileManage";
			
			
		} // updateSkillType
		
		
		@PostMapping("petTypeModify")		// ????????? ??????
		public String updatePetType(
			HttpServletRequest req, Integer userNo, ServicePetkindsDTO modify, HttpSession session) {
			log.debug("updatePetType({}) invoked.",modify);		
			
			UserVO vo = (UserVO) session.getAttribute(loginKey);
			
			this.service.mergePetType(modify);
			
			return "redirect: /mypage/sitterProfileManage";
			
			
		} // updatePetType		
		
		@PostMapping("serviceDateModify")		// ??????????????? ?????? ??? ??????
		public String updateServiceDate(
			HttpServletRequest req, ServiceCalendarDTO modify, HttpSession session) {
			log.debug("updatePetType({}) invoked.",modify);		
			
			UserVO vo = (UserVO) session.getAttribute(loginKey);
			int userNo = vo.getUserNo();
			
			modify.setUserNo(userNo);
			this.service.updateServiceCalendar(modify);
			
			return "redirect: /mypage/sitterProfileManage";
						
		} // updatePetType		
		
		
	    @ResponseBody
		@PostMapping("/fileUpload")
		public String fileUpload(
				@RequestParam("article_file") List<MultipartFile> multipartFile
				, ActivityPhotoDTO modify
				, HttpServletRequest request
				,HttpSession session) {
	    	log.debug("fileUpload({}) invoked.", modify);
	    	
	    	UserVO vo = (UserVO) session.getAttribute(loginKey);
	    	int userNo = vo.getUserNo();
	    	modify.setUserNo(userNo);
			try {
				// ????????? ????????? ??????
//				List<ActivityPhotoDTO> activityPhotoList = this.service.getActivityPhoto(userNo);
//				for(ActivityPhotoDTO dto: activityPhotoList) {
//					List<String> arrNo = modify.getActPhotoList();
//					if(arrNo.contains(dto.getActPhoto())) {
//						System.out.println("????????????>>>>>>>>>>>"+dto.getActPhoto());
//					}
//				}
//				
				// ????????? ????????? ??????.
				if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
					int idx = 0;
					for(MultipartFile file:multipartFile) {
						String fileRoot = "C:/opt/eclipse/workspace/JEE/petCareService/src/main/webapp/resources/assets/img/mypage/act/";
						
						String originalFileName = file.getOriginalFilename();								//???????????? ?????????
						String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//?????? ?????????
						String savedFileName = UUID.randomUUID() + extension;								//????????? ?????? ???
						
						File targetFile = new File(fileRoot + savedFileName);	
						modify.setActPhoto("/resources/assets/img/mypage/act/"+savedFileName);
						modify.setFileName(originalFileName);
						modify.setPhotoNo(modify.getPhotoNoList()[idx]);
						idx++;
						try {
							InputStream fileStream = file.getInputStream();
							FileUtils.copyInputStreamToFile(fileStream, targetFile); 	//?????? ??????
							this.service.insertActivityPhoto(modify);
							
						} catch (Exception e) {
							//????????????
							FileUtils.deleteQuietly(targetFile);	//????????? ?????? ?????? ??????
							this.service.updateActivityPhoto(modify);
							e.printStackTrace();
							break;
						} //try-catch
						
					} //for
					
				} //if
				
			}catch(Exception e){
				e.printStackTrace();
			} //try-catch
			
			return "redirect: /mypage/sitterProfileManage";
			
		} //fileUpload
	     
	   //-----------------------------------------------------------------------------------------------------------------//
	   
	   @GetMapping("sitterHistoryManage")      // ????????? ??????/????????????
	   public void getSitterHistory(Integer petSitterNo, Model model, HttpSession session) {
		   	log.debug("getSitterHistory() invoked.");
		   	
		   	UserVO vo = (UserVO) session.getAttribute(loginKey);
		   	
		   	String classify = vo.getUserClassify();
		   	model.addAttribute("classify", classify);
		   	
	        List<SitterHistoryManageVO> history = this.service.getHistory(vo.getUserNo());
	      
	        assert history != null;
	        
	        log.info("\t+ history : {}", history);
			
	        model.addAttribute("userNo", vo.getUserNo());
	        model.addAttribute("history", history);
	   } // getSitterHistory
	   
	   
	   @ResponseBody
	   @GetMapping("sitterReviewManage")
	   public SitterReviewManageVO sitterReviewManage(@RequestParam(value="serviceId")Integer serviceId) {
		   log.debug("sitterReviewManage() invoked.");
		   
		   SitterReviewManageVO review = this.service.getReview(serviceId);
		   
		   if(review == null) {
			   SitterReviewManageVO temp = new SitterReviewManageVO();
			   temp.setGrade(0);
			   return temp;
		   }
		   
		   return review;
	   } // sitterReviewManage
	   
	   
	   @ResponseBody
	   @GetMapping("sitterReplyManage")
	   public SitterReplyManageVO sitterReplyManage(@RequestParam(value="serviceId")Integer serviceId) {
		   log.debug("sitterReplyManage() invoked.");
		   
		   SitterReplyManageVO reply = this.service.getReply(serviceId);
		   
		   return reply;
	   } // sitterReplyManage
	   
	   @ResponseBody
	   @PostMapping("sitterReplySend")
	   public boolean insertReply(
			   @RequestParam(value = "serviceId")Integer serviceId,
			   @RequestParam(value = "repContent")String repContent,
			   @RequestParam(value = "userNickname")String userNickname,
			   SitterReplyManageDTO reply, 
			   HttpSession session			   
			) {
		   	log.debug("insertReply() invoked.");
			   
		   	UserVO vo = (UserVO) session.getAttribute(loginKey);
		   	log.info("\t + vo : {}", vo);
		   	String userNickname1 = vo.getUserNickname();
		    
		   	reply.setUserNickname(userNickname1);
		   	log.info("\t + reply : {}", reply);
		   	if(this.service.getReply(reply.getServiceId()) == null){
			   this.service.insertReply(reply);
		   	}
		   	else {
			   this.service.updateReply(reply);
		   	}
		   
		   	return true;
	   } // insertReply
	   
	          
	   //-----------------------------------------------------------------------------------------------------------------//
	   
	   @GetMapping("sitterResvManage")      // ????????? ????????????
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
		
		@ResponseBody
		@PostMapping("resvCompletion")
		public void resvCompletion(@RequestParam(value = "serviceId")Integer serviceId) {
			log.debug("resvCompletion() invoked.");
			
			this.service.resvCompletion(serviceId);
			
		}	// resvCompletion

	     
	   //-----------------------------------------------------------------------------------------------------------------//
	   
	   @GetMapping("userWithdrawal")      // ????????????
	   public void userWithdrawal( Model model, HttpSession session) {		   		 
		    log.debug("userWithdrawal() invoked.");
		   
			UserVO vo = (UserVO) session.getAttribute(loginKey);
			
			String classify = vo.getUserClassify();
			model.addAttribute("classify", classify);
			model.addAttribute("userNo", vo.getUserNo());
			
			log.info(vo.getUserNo());
			
	   }   // userWithdrawal
	   
		@PostMapping("withdrawal")
		public String withdrawal(Integer userNo, HttpSession session) {
			log.debug("withdrawal() invoked.");
			
			this.service.withdrawal(userNo);
			
			return "home/home";
		}	// withdrawal
	
} //end class
