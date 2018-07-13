package com.atique.bankClient.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] {BankAppConfig.class};
	}
	@Override
		protected Class<?>[] getServletConfigClasses() {
			// TODO Auto-generated method stub
			return new Class[] {BankAppConfig.class};
		}
	@Override
		protected String[] getServletMappings() {
			// TODO Auto-generated method stub
			return new String[] {"*.bapp","/rest/*"};
		}
	}
