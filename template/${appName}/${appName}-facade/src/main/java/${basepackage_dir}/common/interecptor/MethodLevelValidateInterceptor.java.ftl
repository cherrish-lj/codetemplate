package ${basepackage}.common.interecptor;

import ${basepackage}.common.enums.ExceptionCode;
import ${basepackage}.common.exception.ParamException;
import ${basepackage}.common.utils.ValidateUtil;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Valid;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.validator.internal.engine.ValidatorImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodIntrospector;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.InvocableHandlerMethod;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.ServletRequestDataBinderFactory;
import org.springframework.web.servlet.support.RequestContextUtils;

/**
 * 添加Spring Controller 方法级别的Bean Validation的支持
 * @author dev-center
 */

@Component
public class MethodLevelValidateInterceptor implements HandlerInterceptor {
    protected final Log logger = LogFactory.getLog(getClass());

    private List<HandlerMethodArgumentResolver> argumentResolvers;
    private Validator validator;
    private RequestMappingHandlerAdapter adapter;


    @Autowired
    public MethodLevelValidateInterceptor(RequestMappingHandlerAdapter requestMappingHandlerAdapter) {
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        validator = factory.getValidator();
        adapter = requestMappingHandlerAdapter;
        argumentResolvers = requestMappingHandlerAdapter.getArgumentResolvers();
    }

    public MethodLevelValidateInterceptor() {

    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        ValidatorImpl validatorImpl;
        try {
            validatorImpl = (ValidatorImpl) validator;
        } catch (Exception e) {
            return true;
        }

        ServletWebRequest webRequest = new ServletWebRequest(request, response);
        HandlerMethod method;
        try {
            method = (HandlerMethod) handler;
        } catch (Exception e) {
            return true;
        }

        Valid valid = method.getMethodAnnotation(Valid.class);
        if (valid != null) {
            Class<?>[] groups = new Class<?>[0];
            MethodParameter[] parameters = method.getMethodParameters();
            Object[] parameterValues = new Object[parameters.length];
            for (int i = 0; i < parameters.length; i++) {
                MethodParameter parameter = parameters[i];
                HandlerMethodArgumentResolver resolver = getArgumentResolver(parameter);
                Assert.notNull(resolver, "Unknown parameter type [" + parameter.getParameterType().getName() + "]");
                ModelAndViewContainer mavContainer = new ModelAndViewContainer();
                mavContainer.addAllAttributes(RequestContextUtils.getInputFlashMap(request));

                WebDataBinderFactory webDataBinderFactory = getDataBinderFactory(method);
                Object value = resolver.resolveArgument(parameter, mavContainer, webRequest, webDataBinderFactory);
                parameterValues[i] = value;
                if (value != null) {
                    String validateResult = ValidateUtil.getValidMsg(value, true);
                    if (StringUtils.isNotBlank(validateResult)) {
                        throw new ParamException(ExceptionCode.SYS_PARAMETERS_VALIDATE_EXCEPTION.code(),validateResult);
                    }
                }
            }
            Set<ConstraintViolation<Object>> violations = validatorImpl.validateParameters(method.getBean(), method.getMethod(), parameterValues, groups);
            if (!violations.isEmpty()) {
                StringBuffer errorMsg = new StringBuffer();
                for (ConstraintViolation<Object> violation : violations) {
                    errorMsg.append(violation.getMessage() + ";");
                }
                errorMsg.deleteCharAt(errorMsg.length() - 1);
                logger.warn(errorMsg.toString());
                throw new ParamException(ExceptionCode.SYS_PARAMETERS_VALIDATE_EXCEPTION.code(),errorMsg.toString());
            }
        }
        return true;
    }

    private WebDataBinderFactory getDataBinderFactory(HandlerMethod handlerMethod) {
        Class<?> handlerType = handlerMethod.getBeanType();
        Set<Method> methods = MethodIntrospector.selectMethods(handlerType, RequestMappingHandlerAdapter.INIT_BINDER_METHODS);
        List<InvocableHandlerMethod> initBinderMethods = new ArrayList<>();
        for (Method method : methods) {
            Object bean = handlerMethod.getBean();
            initBinderMethods.add(new InvocableHandlerMethod(bean, method));
        }
        return new ServletRequestDataBinderFactory(initBinderMethods, adapter.getWebBindingInitializer());
    }

    private HandlerMethodArgumentResolver getArgumentResolver(
            MethodParameter parameter) {

        HandlerMethodArgumentResolver result = null;

        for (HandlerMethodArgumentResolver methodArgumentResolver : this.argumentResolvers) {
            if (logger.isTraceEnabled()) {
                logger.trace("Testing if argument resolver [" + methodArgumentResolver + "] supports [" +
                        parameter.getGenericParameterType() + "]");
            }
            if (methodArgumentResolver.supportsParameter(parameter)) {
                result = methodArgumentResolver;
                break;
            }
        }
        return result;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
    }

}
