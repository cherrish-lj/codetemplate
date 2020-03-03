package ${basepackage}.common.config;


import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import ${basepackage}.common.handler.GlobalExceptionHandler;
import ${basepackage}.common.enums.ExceptionCode;
import ${basepackage}.common.Constants;

<#include "/include/author.include"/>

@RestControllerAdvice(basePackages = ${r'"'}${basepackage}${r'.web.controller.api"'})
public class ApiExceptionConfig {

    private GlobalExceptionHandler exceptionHandler = new GlobalExceptionHandler(ExceptionCode.BASE_EXCEPTION.exceptionCode());

    @ExceptionHandler(value = Exception.class)
    public void errorHandlerOverJson(HttpServletResponse res, Exception ex) throws IOException {
    	res.setStatus(Constants.SYSTEM_BUSINESS_ERROR_CODE);
    	exceptionHandler.errorHandlerOverJson(res, ex);
    }
}
