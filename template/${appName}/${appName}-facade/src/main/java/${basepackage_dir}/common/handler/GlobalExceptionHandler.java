package ${basepackage}.common.handler;

import com.alibaba.fastjson.JSONObject;
import ${basepackage}.common.exception.ExceptionBuilder;
import ${basepackage}.common.base.ExceptionResult;
import ${basepackage}.common.base.Result;
import ${basepackage}.common.context.ReqContext;
import ${basepackage}.common.exception.BusinessException;
import ${basepackage}.common.exception.ParamException;
import ${basepackage}.common.exception.RpcException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.List;

/**
 * 全局异常处理器
 */
public class GlobalExceptionHandler {

    public GlobalExceptionHandler(ExceptionBuilder exceptionBuilder){
        this.exceptionBuilder = exceptionBuilder;
    }

    private ExceptionBuilder exceptionBuilder;

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    public void errorHandlerOverJson(HttpServletResponse res, Exception ex) {
        ExceptionResult result = new ExceptionResult();
        if (ex instanceof BusinessException) {
            BusinessException bex = (BusinessException)ex;
            result.setLogInfo("HandlerExceptionResolver catch the Business Exception" + ex.toString());
            result.setResult(new Result(bex.getErrorCode(), bex.getErrorMsg(), Result.Status.ERROR));
        } else {
            String var20;
            StringBuilder var10004;
            if (ex instanceof NumberFormatException) {
                NumberFormatException bex = (NumberFormatException)ex;
                result.setLogInfo("数据格式异常!" + ex.toString());
                var20 = ExceptionBuilder.SYS_PARAMETERS_VALIDATE_EXCEPTION.code();
                var10004 = new StringBuilder();
                result.setResult(new Result(var20, var10004.append(ExceptionBuilder.SYS_PARAMETERS_VALIDATE_EXCEPTION.message()).append(", ").append(bex.getMessage()).toString(), Result.Status.ERROR));
            } else if (ex instanceof BindException) {
                BindException bex = (BindException)ex;
                List<ObjectError> error = bex.getBindingResult().getAllErrors();
                StringBuilder msg = new StringBuilder();

                for(int i = error.size() - 1; i >= 0; --i) {
                    msg.append(error.get(i).getDefaultMessage()).append("; ");
                }

                result.setLogInfo("参数异常!" + ex.toString());
                var20 = ExceptionBuilder.SYS_PARAMETERS_VALIDATE_EXCEPTION.code();
                var10004 = new StringBuilder();
                result.setResult(new Result(var20, var10004.append(ExceptionBuilder.SYS_PARAMETERS_VALIDATE_EXCEPTION.message()).append(", ").append(msg.toString()).toString(), Result.Status.ERROR));
            } else if (ex instanceof ParamException) {
                ParamException invalidParamException = (ParamException)ex;
                result.setLogInfo("参数异常!" + ex.toString());
                var20 = ExceptionBuilder.SYS_PARAMETERS_VALIDATE_EXCEPTION.code();
                var10004 = new StringBuilder();
                result.setResult(new Result(var20, var10004.append(ExceptionBuilder.SYS_PARAMETERS_VALIDATE_EXCEPTION.message()).append(", ").append(invalidParamException.getMessage()).toString(), Result.Status.ERROR));
            } else if (ex instanceof IllegalArgumentException) {
                IllegalArgumentException illegalArgumentException = (IllegalArgumentException)ex;
                result.setLogInfo("其他参数异常!" + ex.toString());
                result.setResult(new Result(ExceptionBuilder.SYS_PARAMETERS_VALIDATE_EXCEPTION.code(), illegalArgumentException.getMessage(), Result.Status.ERROR));
            } else if (ex instanceof UndeclaredThrowableException) {
                UndeclaredThrowableException e = (UndeclaredThrowableException)ex;
                Throwable e2 = e.getUndeclaredThrowable();
                if (e2 instanceof BusinessException) {
                    BusinessException bex = (BusinessException)e2;
                    result.setLogInfo("UndeclaredThrowableException" + ex.toString());
                    result.setResult(new Result(bex.getErrorCode(), bex.getErrorMsg(), Result.Status.ERROR));
                }
            } else if (ex instanceof RpcException) {
                RpcException rpcException = (RpcException)ex;
                result.setLogInfo("HandlerExceptionResolver catch the Business Exception" + ex.toString());
                result.setResult(new Result(rpcException.getErrorCode(), rpcException.getErrorMsg(), Result.Status.ERROR));
            } else {
                ExceptionBuilder resultCode = ExceptionBuilder.SYS_SYSTEM_EXCEPTION;
                result.setResult(new Result(resultCode.code(), resultCode.message(), Result.Status.ERROR));
                result.setLogInfo("HandlerExceptionResolver catch the System Exception" + ex.toString());
            }
        }

        if (ReqContext.get() != null) {
            ReqContext.get().setException(ex);
            ReqContext.get().setReqRes(JSONObject.toJSONString(result.getResult()));
        }

        try {
            res.setContentType("application/json;charset=UTF-8");
            StringBuffer responseSb = new StringBuffer();
            responseSb.append(JSONObject.toJSONString(result.getResult()));
            res.getWriter().println(responseSb.toString());
        } catch (Exception var8) {
            log.error("Response write exception", var8);
        }

    }

}
