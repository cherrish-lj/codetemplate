package ${basepackage}.common;

import java.util.Date;

<#include "/include/author.include"/>

public class Constants {
    /**
     * 系统本次启动日期时间
     */
    public static final Date SYSTEM_START_TIME = new Date();
    /**
     * 系统自定义业务错误码(避开http常用错误码)
     */
    public static Integer SYSTEM_BUSINESS_ERROR_CODE = 409;

}
