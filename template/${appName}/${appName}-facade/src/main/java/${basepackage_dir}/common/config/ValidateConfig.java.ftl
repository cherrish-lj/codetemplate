package ${basepackage}.common.config;

import ${basepackage}.common.filter.HttpServletRequestReplacedFilter;
import ${basepackage}.common.interecptor.MethodLevelValidateInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

<#include "/include/author.include"/>

@Configuration
public class ValidateConfig implements WebMvcConfigurer {

    @Autowired
    private MethodLevelValidateInterceptor methodLevelValidateInterceptor;

    @Bean
    public FilterRegistrationBean httpServletRequestReplacedRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new HttpServletRequestReplacedFilter());
        registration.addUrlPatterns("/*");
        registration.addInitParameter("paramName", "paramValue");
        registration.setName("httpServletRequestReplacedFilter");
        registration.setOrder(1);
        return registration;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(methodLevelValidateInterceptor).addPathPatterns("/**");
    }
}
