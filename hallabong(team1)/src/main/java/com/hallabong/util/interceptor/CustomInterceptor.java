package com.hallabong.util.interceptor;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hallabong.member.vo.LoginVO;



public class CustomInterceptor extends HandlerInterceptorAdapter {
	
	//맵선언 - > 넣을때 권한 
	Map<String, Integer> authorityMap = new HashMap<String, Integer>();
	
	protected Log log = LogFactory.getLog(CustomInterceptor.class);

	public CustomInterceptor() {
		authorityMap.put("/rentcarcompany", 9);
		authorityMap.put("/carbasicinfo", 9);
		authorityMap.put("/carinsurance", 9);
		authorityMap.put("/companycars", 9);
		authorityMap.put("/rentcarboard/rentCarBoardUpdate.do", 9);
		authorityMap.put("/rentcarboard/rentCarBoardWrite.do", 9);
		authorityMap.put("/rentcarboard/rentCarBoardDelete.do", 9);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
	      PrintWriter out = response.getWriter();
		log.info("====================================== START ======================================");
		log.info(" Request URI \t: " + request.getRequestURI());
		
		//로그인 값 -> 
        HttpSession session = request.getSession();
        if(session==null || session.getAttribute("login")==null){
        	response.sendRedirect("/member/loginForm.do");
            return false;
        }
        
        //rentcarcompany... 은 모듈에 들어가자마자 권한 설정
        String url = request.getRequestURI();
        // 두번째 /제거
        int pos = url.indexOf("/", 1);
        String module = url.substring(0, pos);
        log.info(module);
        if(authorityMap.containsKey(module)) {
        	log.info("권한설정1");
        	
        	LoginVO loginVO = (LoginVO) session.getAttribute("login");
        	
            if(authorityMap.get(module) != loginVO.getGradeNo()) {
            		
            	out.println("<script>");
                out.println("alert('권한이 없습니다');");
                out.println("location.href='../main.do'");
                out.println("</script>");
        		return false;
            }
        }
        
        if(authorityMap.containsKey(url)) {
        	
        	log.info("권한설정");
        	LoginVO loginVO = (LoginVO) session.getAttribute("login");
	        if(authorityMap.get(url) != loginVO.getGradeNo()) {
	        		out.println("<script>");
	                out.println("alert('권한이 없습니다');");
	                out.println("location.href='../main.do'");
	                out.println("</script>");
	//        		response.sendRedirect("../main.do");
	        		return false;
	        	
	        }
        }
        
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("====================================== END ======================================\n");
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("====================================== afterCompletion ======================================\n");
		super.afterCompletion(request, response, handler, ex);
	}
}
