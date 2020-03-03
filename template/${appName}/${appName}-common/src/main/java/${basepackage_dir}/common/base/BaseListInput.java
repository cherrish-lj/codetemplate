package ${basepackage}.common.base;

/**
 * 分页基类
 */
public class BaseListInput {

    /**
     * 当前页数，默认为1
     */
    private Integer pn = 1;
    /**
     * 每页显示数量，默认20
     */
    private Integer ps = 20;

    public Integer getPn() {
        return pn;
    }

    public void setPn(Integer pn) {
        this.pn = pn;
    }

    public Integer getPs() {
        return ps;
    }

    public void setPs(Integer ps) {
        this.ps = ps;
    }
}
