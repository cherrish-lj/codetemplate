package ${basepackage}.common.base;

import java.io.Serializable;

public class Result<T> implements Serializable {
    private static final long serialVersionUID = 5925101851082556646L;
    /**
     * 数据对象
     */
    private T content;
    /**
     * 状态:OK|ERROR
     */
    private String status;
    /**
     * 错误码
     */
    private String errorCode;
    /**
     * 错误消息
     */
    private String errorMsg;

    public Result() {
        this.status = Status.SUCCESS.code();
    }

    public Result(String errorCode, String errorMsg) {
        this(errorCode, errorMsg, Status.ERROR);
    }

    public Result(String errorCode, String errorMsg, Status status) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
        this.status = status.code();
    }

    public T getContent() {
        return this.content;
    }

    public Result<T> setContent(T content) {
        this.content = content;
        return this;
    }

    public String getStatus() {
        return this.status;
    }

    public Result<T> setStatus(String status) {
        this.status = status;
        return this;
    }

    public String getErrorCode() {
        return this.errorCode;
    }

    public Result<T> setErrorCode(String errorCode) {
        this.errorCode = errorCode;
        return this;
    }

    public String getErrorMsg() {
        return this.errorMsg;
    }

    public Result<T> setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
        return this;
    }

    public static enum Status {
        SUCCESS("OK"),
        ERROR("ERROR");

        private String code;

        private Status(String code) {
            this.code = code;
        }

        public String code() {
            return this.code;
        }
    }
}