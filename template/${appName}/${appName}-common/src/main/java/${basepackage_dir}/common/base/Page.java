package ${basepackage}.common.base;

import java.util.ArrayList;
import java.util.List;


public class Page<T> {
    /**
     * 页码
     */
    private Integer pn = 1;
    /**
     * 每页显示条数
     */
    private Integer ps = 10;
    /**
     * 数据列表
     */
    private List<T> datas = new ArrayList<T>();
    /**
     * 总条数
     */
    private int tc = 0;

    public Page() {
    }

    public Page(Integer pn, Integer ps) {
        this.pn = pn;
        this.ps = ps;
    }

    public int startIndex() {
        return (getPn() - 1) * getPs();
    }

    public int endIndex() {
        return getPn() * getPs();
    }

    public boolean firstPage() {
        return getPn() <= 1;
    }

    public boolean lastPage() {
        return getPn() >= pageCount();
    }

    public int nextPage() {
        if (lastPage()) {
            return getPn();
        }
        return getPn() + 1;
    }

    public int previousPage() {
        if (firstPage()) {
            return 1;
        }
        return getPn() - 1;
    }

    public Integer getPn() {
        if (pn == null || pn == 0) {
            pn = 1;
        }
        return pn;
    }

    public int pageCount() {
        if (tc % getPs() == 0) {
            return tc / getPs();
        } else {
            return tc / getPs() + 1;
        }
    }

    public int getTc() {
        return this.tc;
    }

    public void setPn(Integer pageNum) {
        this.pn = pageNum;
    }

    public Integer getPs() {
        if (ps == null || ps == 0) {
            ps = 10;
        }
        return ps;
    }

    public void setPs(Integer pageSize) {
        this.ps = pageSize;
    }

    public boolean hasNextPage() {
        return getPn() < pageCount();
    }

    public boolean hasPreviousPage() {
        return getPn() > 1;
    }

    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> data) {
        this.datas = data;
    }

    public void setTc(int total) {
        this.tc = total;
    }
}
