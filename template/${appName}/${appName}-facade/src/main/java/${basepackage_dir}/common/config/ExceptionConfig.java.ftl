package ${basepackage}.common.config;

import ${basepackage}.common.enums.ExceptionCode;
import ${basepackage}.common.handler.GlobalExceptionHandler;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

<#include "/include/author.include"/>

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestControllerAdvice(basePackages = {${r'"'}${basepackage}${r'.web.controller.admin"'},
		${r'"'}${basepackage}${r'.web.controller.mobile"'},
		${r'"'}${basepackage}${r'.web.controller.web"'}})
public class ExceptionConfig {

    private GlobalExceptionHandler exceptionHandler = new GlobalExceptionHandler(ExceptionCode.BASE_EXCEPTION.exceptionCode());

    @ExceptionHandler(value = Exception.class)
    public void errorHandlerOverJson(HttpServletResponse res, Exception ex) throws IOException {
        exceptionHandler.errorHandlerOverJson(res, ex);
    }
}
