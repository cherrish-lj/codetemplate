package ${basepackage}.common.enums;

import ${basepackage}.common.base.ExceptionResult;
import ${basepackage}.common.exception.ExceptionBuilder;

/**
 * 异常码定义分段:每个业务模块一个异常代码分段，异常码个数为50
 * 系统预定义异常：0001- 0050
 * @author dev-center
 */
public enum ExceptionCode {

    BASE_EXCEPTION("0000", "基础异常"),
    /*----------------system-exception-define-begin:-----[0001-0050]---------------------------------------------------------------*/
    SYS_SYSTEM_EXCEPTION("0001", "系统异常"),
    SYS_NETWORK_UNKNOWN_EXCEPTION("0002", "网络异常"),
    SYS_PARAMETERS_VALIDATE_EXCEPTION("0003", "参数验证错误"),
    SYS_RPC_EXCEPTION("0004", "rpc接口异常"),

    /*----------------订单:-----[0051-0100]---------------------------------------------------------------*/
    SUBMIT_ORDER_FAIL("0051", "下单失败"),
    ;

    /**
     * 业务系统上系统预定义的错误码前缀
     */
    private static final String SYSTEM_ERROR_CODE_PREFIX = "1001";

    private ExceptionBuilder exception;

    ExceptionCode(String code, String msg) {
        exception = new ExceptionBuilder(code, msg, SYSTEM_ERROR_CODE_PREFIX);
    }

    public String code() {
        return this.exception.code();
    }

    public String message() {
        return this.exception.message();
    }

    public ExceptionBuilder exceptionCode() {
        return this.exception;
    }

}
