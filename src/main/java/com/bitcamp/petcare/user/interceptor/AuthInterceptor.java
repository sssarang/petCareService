package com.bitcamp.petcare.user.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.bitcamp.petcare.user.domain.UserVO;
import com.bitcamp.petcare.user.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

// 역할 : 로그인 성공여부를 체크하는 인터셉터
//@Component
public class AuthInterceptor 
	implements HandlerInterceptor {
	
	public static final String loginKey = "__LOGIN__";
	public static final String requestURIKey = "__REQUEST_URI__";
	public static final String queryStringKey = "__QUERYSTRING__";
	
	@Setter(onMethod_=@Autowired)
	private UserService service;
	
	//뒤의 컨트롤러 메소드가 호출되기 전에 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("=========================================================================");
		log.debug("1. preHandle(request, response, {}) invoked", handler.getClass().getName());
		log.debug("=========================================================================");
	
		//이미 로그인에 성공한 유저인지 아닌지를 판단 => 인증(Authentication)
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute(loginKey);
		if(user != null) {	//이전에 이미 로그인한 사용자인지 확인
			//이전에 로그인한 경우
			log.info("Authenticated....OK");
			
			return true;	//현재 요청이 컨트롤러로 간다.
		} else {
			//이전에 로그인하지 않은 경우
			
			//=============================================================//
			// 1. Original Request URI + 전송 파라미터도 함께 저장(Session scope)
			//=============================================================//
			String originalRequestURI = request.getRequestURI();		//원래의 요청 URI획득
			String originalQueryString = request.getQueryString();		//원래의 Query String 획득
			
			session.setAttribute(requestURIKey, originalRequestURI);
			session.setAttribute(queryStringKey, originalQueryString);
			
			
			//=============================================================//
			// 2. To authenticate a user through Remember-Me feature.
			//=============================================================//
			Cookie rememberMeCookie = WebUtils.getCookie(request, LoginInterceptor.rememberMeKey);
			
			if(rememberMeCookie != null) {
				//이번 요청을 보내기 이전에, 이미 로그인에 성공했고, Remember-Me 옵션도 on 시킨 사용자이다.
				String rememberMe = rememberMeCookie.getValue();
				log.info("\t + rememberMe : {}", rememberMe);
				
				//현재의 Session ID로 유지되는 Session Scope UserVO객체를 생성해서 바인딩 등록
				//UserSevice객체의 findUserByRememberMe() 메소드로 이전 Session ID로
				//사용자 정보를 select해서, UserVO객체를 얻고, 이 UserVO객체를, Session Scope에
				//바인딩 해서, 마치 로그인 창에서 로그인 한 것과 동일한 결과를 생성해낸다.
				
				user = this.service.findUserByRememberMe(rememberMe);
				if(user != null) {
					//마치 사용자가 정상 로그인한 것처럼, Session Scope에 UserVO(신분증)를 넣어주자
					session.setAttribute(loginKey, user);
					return true;	//결론 : 무사통과시켜야 한다.
				
				}//if : rememberMe에 해당하는 사용자를 찾아 냈을 때
				
			}//if : renenberMeCookie가 request문서에 들어왔을 때 
			
			//=============================================================//
			// N. To redirect to login form (request uri: /user/login)
			//=============================================================//
			response.sendRedirect("/user/loginPage");
			log.info("redirected to /user/loginPage");
			
			return false;		//현재 요청이 컨트롤러로 가지 못한다
		}//if-else
		
	}//preHandle
	

	
	//뒤의 컨트롤러 메소드 호출이 완료된 후, 그리고 View가 호출되기 전에 수행
	//단, 컨트롤러 메소드 수행에서 예외가 발생하지 않아야 함
	//컨트롤러 메소드 수행시 예외가 발생하면, 이 메소드는 수행되지 않음
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("=========================================================================");
		log.debug("2. postHandle(request, response, {}, {}) invoked", handler, modelAndView);
		log.debug("=========================================================================");
		

	}//postHandle

	//뒤의 컨트롤러 메소드 수행시, 예외의 발생여부와 상관없이 View까지 호출된 후에 수행
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e)
			throws Exception {
		log.debug("=========================================================================");
		log.debug("3. afterCompletion(request, response, {}, {}) invoked", handler, e);
		log.debug("=========================================================================");
		
		//컨트롤러에 대한 예외처리
		// (1) DB에 발생 예외의 로그를 남김
		// (2) 에러페이지로 이동
		
	}//afterCompletion

}//end class
