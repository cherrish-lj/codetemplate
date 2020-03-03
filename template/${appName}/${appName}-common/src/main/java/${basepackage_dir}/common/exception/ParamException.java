package ${basepackage}.common.exception;

public class ParamException extends BusinessException {
    private static final long serialVersionUID = -1586075131379401323L;

    public ParamException(String errorCode, String errorMsg) {
        super(errorCode, errorMsg);
    }
}
