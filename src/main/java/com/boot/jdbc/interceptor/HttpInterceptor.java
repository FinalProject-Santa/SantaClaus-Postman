package com.boot.jdbc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class HttpInterceptor implements HandlerInterceptor{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.info("[preHandle]");
        System.out.println("preHandle");

//        HttpSession session = request.getSession(false);
        
        String login = (String)request.getSession().getAttribute("member");

        if (login != null) {    /* 로그인 되어 있는 경우 */
        	
        	return true;
        	
        }else { 				/* 로그인 되어 있지 않은 경우 */
        	
        	response.sendRedirect("/main/loginForm");
        	
        	return false;
        	
        }

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("[postHandle]");
        System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception ex) throws Exception {
        logger.info("[afterCompletion]");
        System.out.println("afterCompletion");
    }
}
