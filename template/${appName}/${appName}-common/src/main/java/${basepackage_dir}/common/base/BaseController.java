package ${basepackage}.common.base;


import ${basepackage}.common.base.Result;

/**
 * baseController
 */
public class BaseController {

    /**
     * 成功-返回字符串
     *
     * @return
     * @date 2015年11月24日 下午5:32:49
     */
    public Result<String> success() {
        return new Result<String>();
    }

    /**
     * 成功-无返回结果
     *
     * @return
     * @date 2015年11月24日 下午5:32:49
     */
    public Result<Void> successVoid() {
        return new Result<Void>();
    }

    /**
     * 成功-有返回结果
     *
     * @param content
     * @param <T>
     * @return
     * @date 2015年11月24日 下午5:33:00
     */
    public <T> Result<T> success(T content) {
        Result<T> result = new Result<T>();
        return result.setContent(content);
    }

    /**
     * 失败
     *
     * @param
     * @return
     * @date 2015年11月24日 下午5:33:17
     */
    public <T> Result<T> error(String errorCode, String errorMsg) {
        return new Result<T>(errorCode, errorMsg, Result.Status.ERROR);
    }
}
