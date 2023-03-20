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

        HttpSession session = request.getSession(false);

        if (session.getAttribute("member") == null) {    /* 로그인 되어 있지 않은 경우 */
        	
        	System.out.println("로그인 되지 않음");
        	
            response.sendRedirect("/loginForm");
            
            System.out.println("리다이렉트");
            
            return false;
        }
        
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("[postHandle]");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception ex) throws Exception {
        logger.info("[afterCompletion]");
    }
}
