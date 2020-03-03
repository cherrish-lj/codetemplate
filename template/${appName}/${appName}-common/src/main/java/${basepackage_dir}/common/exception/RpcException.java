package ${basepackage}.common.exception;

public class RpcException extends RuntimeException {

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
    public RpcException(String errorCode, String errorMsg) {
        super(String.format("RpcException{errorCode:%s, errorMsg:%s}", errorCode, errorMsg));
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
