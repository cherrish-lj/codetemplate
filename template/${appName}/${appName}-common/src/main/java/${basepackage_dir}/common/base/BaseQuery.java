package ${basepackage}.common.base;


import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 基础查询类
 */
public class BaseQuery implements Serializable {

    public static final String ORDER_FIELD_TYPE_DESC = "DESC";
    public static final String ORDER_FIELD_TYPE_ASC = "ASC";

    private static final long serialVersionUID = 1L;

    private transient String orderFieldType;// 排序字段类型

    private transient Integer startIndex;// 开始索引

    private transient Integer pageSize;// 取多少个

    private transient String orderField;// 排序字段


    private transient Map<String, Object> queryData;// 查询扩展

    public Integer getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrderField() {
        return orderField;
    }

    public void setOrderField(String orderField) {
        this.orderField = orderField;
    }

    public String getOrderFieldType() {
        return orderFieldType;
    }

    public void setOrderFieldType(String orderFieldType) {
        this.orderFieldType = orderFieldType;
    }

    public Map<String, Object> getQueryData() {
        if (queryData != null && queryData.size() > 0) {
            return queryData;
        }
        return null;
    }

    public void setQueryData(Map<String, Object> queryData) {
        this.queryData = queryData;
    }

    //添加其它查询数据
    public void addQueryData(String key, Object value) {
        if (queryData == null) {
            queryData = new HashMap<String, Object>();
        }
        queryData.put(key, value);
    }

}
