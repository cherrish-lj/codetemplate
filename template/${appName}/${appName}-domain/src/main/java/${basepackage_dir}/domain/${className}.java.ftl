<#include "/include/base.include"/>
<#include "/include/copyright.include"/>

package ${basepackage}.domain;

import ${basepackage}.common.base.BaseDomain;
import java.util.*;
import lombok.Data;

<#include "/include/author.include"/>
@Data
public class ${className} extends BaseDomain {
	private static final long serialVersionUID = 1L;
	
<#--字段-->
<#list table.columns as column>
    <#if column.columnNameLowerCase == table.pkColumn.columnNameLowerCase
    || column.columnNameLowerCase == p_create
    || column.columnNameLowerCase == p_update
    || column.columnNameLowerCase == p_del
    ><#else>
    /**
     * ${column.remarks}
     */
    private ${column.simpleJavaType} ${column.columnNameFirstLower};

    </#if>
</#list>
}
