package ${basepackage}.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.ApplicationContext;

<#include "/include/author.include"/>

@SpringBootApplication
@ComponentScan(value = {"${basepackage}"})
@MapperScan(value = "${basepackage}.dao")
public class WebApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(WebApplication.class);

    public static void main(String[] args) {
        ApplicationContext ctx = SpringApplication.run(WebApplication.class, args);
        String[] activeProfiles = ctx.getEnvironment().getActiveProfiles();
        for (String profile : activeProfiles) {
            LOGGER.info("当前使用的 profile 是:{}", profile);
        }
    }

}
