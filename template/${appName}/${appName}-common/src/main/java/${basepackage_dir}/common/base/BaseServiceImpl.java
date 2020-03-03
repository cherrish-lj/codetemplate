/*
 * Copyright 2018 - 2050 zyp.All Rights Reserved.
 *
 */
package ${basepackage}.common.base;

import ${basepackage}.common.base.BaseDomain;
import ${basepackage}.common.base.Page;
import java.io.Serializable;
import java.util.List;

/**
 * baseServiceImpl
 *
 * @param <KEY>
 */
public abstract class BaseServiceImpl<T, KEY extends Serializable> implements BaseService<T, KEY> {

    /**
     * 获取DAO操作类
     */
    public abstract BaseDao<T, KEY> getDao();

    public int insert(T t) {
        return getDao().insert(t);
    }

    public int batchInsert(List<T> list) {
        if (list == null || list.size() < 1) {
            return 0;
        }
        return getDao().batchInsert(list);
    }

    @SuppressWarnings("unchecked")
    public int del(KEY... key) {
        return getDao().del(key);
    }

    public int update(T condition) {
        return getDao().update(condition);
    }

    public int batchUpdate(List<T> list) {
        if (list == null || list.size() < 1) {
            return 0;
        }
        return getDao().batchUpdate(list);
    }

    public int saveOrUpdate(T t) {
        Long id = 0l;
        if (t instanceof BaseDomain) {
            id = ((BaseDomain) t).getId();
        } else {
            try {
                Class<?> clz = t.getClass();
                id = (Long) clz.getMethod("getId").invoke(t);
            } catch (Exception e) {
                throw new RuntimeException("获取对象主键值失败", e);
            }
        }
        if (id != null && id > 0) {
            return this.update(t);
        }
        return this.insert(t);
    }


    public T get(KEY key) {
        return getDao().get(key);
    }

    public List<T> list(T condition) {
        return getDao().list(condition);
    }

    public int listCount(T condition) {
        return getDao().listCount(condition);
    }

    public Page<T> listPage(T condition, Page<T> page) {
        try {
            Class<?> clz = condition.getClass();
            clz.getMethod("setStartIndex", Integer.class).invoke(condition, page.startIndex());
            clz.getMethod("setPageSize", Integer.class).invoke(condition, page.getPs());
        } catch (Exception e) {
            throw new RuntimeException("设置分页参数失败", e);
        }
        Integer size = getDao().listCount(condition);
        if (size == null || size <= 0) {
            return page;
        }
        page.setTc(size);
        page.setDatas(this.list(condition));
        return page;
    }
}
