package ${basepackage}.common.exception;

public final class ExceptionBuilder {

    /*----------------system-exception-define-begin:-----[0001-0050]---------------------------------------------------------------*/
    public static ExceptionBuilder SYS_SYSTEM_EXCEPTION;
    public static ExceptionBuilder SYS_NETWORK_UNKNOWN_EXCEPTION;
    public static ExceptionBuilder SYS_PARAMETERS_VALIDATE_EXCEPTION;
    public static ExceptionBuilder SYS_RPC_EXCEPTION;
    private volatile static Boolean INITED = Boolean.FALSE;

    /**
     * 业务码
     */
    private String code;

    /**
     * 描述
     */
    private String message;

    /**
     * 业务系统上系统预定义的错误码前缀
     */
    private String systemPrefix;

    public ExceptionBuilder(String code, String message, String systemPrefix) {
        this.code = code;
        this.message = message;
        this.systemPrefix = systemPrefix;
        if(!INITED){
            INITED = Boolean.TRUE;
            SYS_SYSTEM_EXCEPTION = create("0001", "系统异常");
            SYS_NETWORK_UNKNOWN_EXCEPTION = create("0002", "网络异常");
            SYS_PARAMETERS_VALIDATE_EXCEPTION = create("0003", "参数验证错误");
            SYS_RPC_EXCEPTION = create("0004", "rpc接口异常");
        }
    }

    public ExceptionBuilder create(String code, String message) {
        return new ExceptionBuilder(code, message, this.systemPrefix);
    }

    public String code() {
        return this.systemPrefix + code;
    }

    public String message() {
        return message;
    }
}
