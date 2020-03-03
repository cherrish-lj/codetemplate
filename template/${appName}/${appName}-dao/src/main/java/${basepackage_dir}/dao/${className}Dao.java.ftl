<#include "/include/base.include"/>
<#include "/include/copyright.include"/>

package ${basepackage}.dao;

import ${basepackage}.common.base.BaseDao;
import ${basepackage}.domain.${className};

<#include "/include/author.include"/>

public interface ${className}Dao extends BaseDao<${className},Long> {

}
