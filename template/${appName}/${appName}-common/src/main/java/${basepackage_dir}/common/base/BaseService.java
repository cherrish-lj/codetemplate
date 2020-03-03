package ${basepackage}.common.base;


import ${basepackage}.common.base.Page;
import java.io.Serializable;
import java.util.List;


/**
 * baseService
 * @param <T>
 * @param <KEY>
 */
public interface BaseService<T,KEY extends Serializable> {

	/**
	 * 添加对象
	 * @param t
	 * @return
	 */
	int insert(T t);
	
	/**
	 * 批量插入
	 * @param list
	 * @return
	 */
	int batchInsert(List<T> list);
	
	/**
	 * 逻辑删除对象,主键
	 * @param key 主键数组
	 * @return 影响条数
	 */
	int del(KEY... key);
	
	/**
	 * 更新对象,条件主键Id
	 * @param condition 更新对象
	 * @return 影响条数
	 */
	int update(T condition);
	
	/**
	 * 保存或更新对象(条件主键Id)
	 * @param t 需更新的对象
	 * @return 影响条数
	 */
	int saveOrUpdate(T t);
	
	/**
	 * 查询对象,条件主键
	 * @param key
	 * @return 实体对象
	 */
	T get(KEY key);

	/**
	 * 查询对象,只要不为NULL与空则为条件
	 * @param condition 查询条件
	 * @return 对象列表
	 */
	List<T> list(T condition);
	
	/**
	 * 查询总数
	 * @param condition
	 * @return
	 */
	int listCount(T condition);
	
	/**
	 * 分页查询
	 * @param condition 查询条件
	 * @return 分页对象
	 */
	Page<T> listPage(T condition, Page<T> page);

}
