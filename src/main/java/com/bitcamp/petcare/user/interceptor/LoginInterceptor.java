package com.bitcamp.petcare.user.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.petcare.user.domain.UserVO;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

//@Component
public class LoginInterceptor 
	implements HandlerInterceptor {
	
	public static final String loginKey = "__LOGIN__";
	public static final String rememberMeKey = "__REMEMBER_ME__";
	
	//뒤의 컨트롤러 메소드가 호출되기 전에 수행
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("=========================================================================");
		log.debug("1. preHandle(request, response, {}) invoked", handler.getClass().getName());
		log.debug("=========================================================================");
		
		// 1.Action Log
		// 2.로그인 여부 체크
		
		log.info("\t + handler : {}", handler);
		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Object beanObj = handlerMethod.getBean();
		Method method = handlerMethod.getMethod();
		
		log.info("\t + handlerMethod : " + handlerMethod);
		log.info("\t + beanObj : " + beanObj);			//우리가 만든 컨트롤러 객체
		log.info("\t + method : " + method);			//우리가 만든 컨트롤러 객체의 핸들러 메소드
		log.info("");
		
		//사용자가 로그인 성공한 상태인지 체크 ------ x : 여기서 하면 안된다.
		// 다른 Interceptor에서 해야만 하는일
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute(LoginInterceptor.loginKey);
		if(user != null) {
			//기존에 Session Scope에 있는 UserVO 객체를 삭제!!!
			session.removeAttribute(LoginInterceptor.loginKey);
			
			log.info("\t + 기존에 바인딩된 UserVO 객체를 SEssion Scope에서 삭제완료");
		}//if
		
		log.info("\t + user : {}", user);
		return true;
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
		
		//Session Scope에 UserVO객체를 바인딩하는 작업수행
		HttpSession session = request.getSession();
        Object user = session.getAttribute(loginKey);
        
//		UserVO user = (UserVO) modelAndView.getModelMap().get(LoginInterceptor.loginKey);
		if(user != null) {	//로그인이 성공했다면
		
			//=============================================================//
			// 1. Session Scope에 로그인 정보로, UserVO객체를 바인딩
			//=============================================================//
//			session.setAttribute(LoginInterceptor.loginKey, user);
//			log.info("\t + 1. UserVO 객체를 Session Scope에 바인딩 완료");
			
			//=============================================================//
			// 2. 원래 사용자의 Request URI를 복구하여, 이동시킴
			//=============================================================//
			String originalRequestURI = (String) session.getAttribute(AuthInterceptor.requestURIKey);
			String originalQueryString = (String) session.getAttribute(AuthInterceptor.queryStringKey);
			
			if(originalRequestURI != null) {	//원래의 요청 URI가 있었다면(GET방식만 고려)
				response.sendRedirect(
						originalRequestURI + 
						(originalQueryString != null && !"".equals(originalQueryString) ? "?"+originalQueryString : "")
				);
				log.info("\t + 2. 원래의 요청 URI({})로 강제 이동시킴", originalRequestURI);
				
			} else {	//처음부터 사용자가 로그인 창에서 로그인을 수행했었다면
				log.info("\t + 2. 사용자는 로그인부터 수행해서 들어옴.");
				
				//=============================================================//
				// 3. Remember-Me 기능 처리
				//=============================================================//
				// 조건 :
				//		  (1) 로그인 성공 (이미 이 조건은 만족)
				//		  (2) Remember-Me 옵션을 체크
				//-------------------------------------------------------------//
				String rememberMe = request.getParameter("rememberMe");
				if(rememberMe != null) {	//Remember-Me 기능 처리
					log.info("\t + 3. Remember-Me 기능 처리..");
					
					//이 기능은 쿠키(Cookie)를 처리해야함
					// (1) 새로운 쿠키를 생성(for Remember-Me기능)
					// (2) Response 문서의 헤더에 저장해서 응답으로 웹브라우저에 전송
					// (3) 웹브라우저는 응답으로 받는 쿠키들은 모두 파일로 보관
					// (4) 다시 동일 웹사이트로 새로운 Request 보낼 때 마다, 해당 웹사이트와 연관된
					//	   쿠키를 Request의 헤더에 담아서 항상 전송하게 되어있다.(***)
					
					String sessionId = session.getId();	//웹브라우저에 할당된 이름(= 세션 ID)
					
					Cookie rememberMeCookie = new Cookie(rememberMeKey, sessionId);
					
					//우리가 만든 데이터 조각인 쿠키에 대한 설정을 수행
					rememberMeCookie.setMaxAge(60 * 60 * 24 * 7);		//초단위로 쿠키의 유효기간 설정
					rememberMeCookie.setPath("/");
					
					response.addCookie(rememberMeCookie);
					
					log.info("\t + rememberMeCookie : " + rememberMeKey);
					log.info("\t + 응답문서의 헤더에 rememberMeCookie 쿠키설정 완료");					
				}//if
				
				UserVO temp = (UserVO) user;
				
				if(temp.getUserClassify().equals("0")) {
					response.sendRedirect("/admin/");
				} else {
					response.sendRedirect("/");					
				}
				//response.sendRedirect("/");		
			}//if-else
			
		} else {	//로그인에 실패했다면
			//postHandle 메소드가 수행되는 지점과 시점을 잘 기억해야함
			response.sendRedirect("/user/loginPage");
			log.info("\t + 1. 로그인 실패 - 다시 로그인 창으로 되돌림");
		}//if-else
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
