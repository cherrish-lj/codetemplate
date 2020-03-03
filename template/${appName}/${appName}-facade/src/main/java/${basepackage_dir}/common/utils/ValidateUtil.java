package ${basepackage}.common.utils;

import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import lombok.extern.slf4j.Slf4j;

/**
 * 参数校验工具
 */
@Slf4j
public class ValidateUtil {
    //private static final String VALUE_RESULT_TEMPLATE = ", 当前值为[%s]";

    /**
     * 获取注解校验结果
     *
     * @param object
     * @param isShowValue 是否显示结果
     * @return
     */
    public static String getValidMsg(Object object, boolean isShowValue) {//注解校验
        Set<ConstraintViolation<Object>> set = Validation.buildDefaultValidatorFactory().getValidator().validate(object);
        StringBuffer msg = new StringBuffer();
        String result = "";
        for (ConstraintViolation<Object> constraintViolation : set) {
            //result = constraintViolation.getMessage() + String.format(VALUE_RESULT_TEMPLATE, constraintViolation.getInvalidValue());
            result = constraintViolation.getMessage();
            break;
        }
        for (ConstraintViolation<Object> constraintViolation : set) {
            msg.append(constraintViolation.getPropertyPath() + " : " + constraintViolation.getMessage() + ",");
        }
        if (msg.length() > 0) {
            msg.deleteCharAt(msg.length() - 1);
            log.info(msg.toString());
        }
        return result;
    }
}
