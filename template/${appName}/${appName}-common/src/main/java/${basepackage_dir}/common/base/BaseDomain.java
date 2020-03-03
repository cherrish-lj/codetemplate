package ${basepackage}.common.base;

import java.util.Date;

/**
 * 领域模型基类(常规公共字段)<br/>
 * 一律使用引用类型
 */
public class BaseDomain extends BaseQuery {
    private static final long serialVersionUID = 1L;
    /**
     * id
     */
    protected Long id;
    /**
     * 创建时间
     */
    protected Date createTime;
    /**
     * 更新时间
     */
    protected Date editTime;
    /**
     * 是否删除:1-是,0-否
     */
    protected Integer isDelete;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getEditTime() {
        return editTime;
    }

    public void setEditTime(Date editTime) {
        this.editTime = editTime;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
