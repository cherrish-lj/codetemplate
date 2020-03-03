package ${basepackage}.common.utils;


import ${basepackage}.common.exception.BusinessException;
import ${basepackage}.common.enums.ExceptionCode;

/**
 * 异常工具类
 * @author dev-center
 */
public class ExceptionUtil {

    /**
     * expect=true时抛出throwParamException异常
     *
     * @param expect
     * @param msg
     */
    public static void throwBusinessException(boolean expect, String code, String msg) throws BusinessException {
        if (expect) {
            throw new BusinessException(code, msg);
        }
    }

    public static void throwBusinessException(ExceptionCode enums) throws BusinessException {
        throwBusinessException(true, enums);
    }

    public static void throwBusinessException(boolean expect, ExceptionCode enums) throws BusinessException {
        if (expect) {
            throw new BusinessException(enums.code(), enums.message());
        }
    }
}
