package ${basepackage}.common.exception;

public class BusinessException extends RuntimeException {

    private static final long serialVersionUID = -5317007026578376164L;

    /**
     * 错误码
     */
    private String errorCode;
    /**
     * 错误描述
     */
    private String errorMsg;

    /**
     * @param errorCode
     * @param errorMsg
     */
    public BusinessException(String errorCode, String errorMsg) {
        super(String.format("BusinessException{errorCode:%s, errorMsg:%s}", errorCode, errorMsg));
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }
}
