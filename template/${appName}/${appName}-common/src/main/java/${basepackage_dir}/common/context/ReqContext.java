package ${basepackage}.common.context;

public class ReqContext {
    public static final ThreadLocal<ReqInfo> userThreadLocal = new ThreadLocal();

    public static void set(ReqInfo reqInfo) {
        userThreadLocal.set(reqInfo);
    }

    public static void unset() {
        userThreadLocal.remove();
    }
    public static ReqInfo get() {
        return userThreadLocal.get();
    }
}
