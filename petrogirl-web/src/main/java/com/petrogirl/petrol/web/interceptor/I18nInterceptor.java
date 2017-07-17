package com.petrogirl.petrol.web.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

public class I18nInterceptor implements HandlerInterceptor {
	
	private static final Logger LOG = LoggerFactory.getLogger(I18nInterceptor.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		LOG.debug("-------------------interceptor.preHandleStart");
		Locale locale = LocaleContextHolder.getLocale(); 
		request.setAttribute("language", locale.getLanguage());
		LOG.debug("-------------------interceptor.preHandleEnd-" + locale.getLanguage());
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
