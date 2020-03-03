<#include "/include/base.include"/>
<#include "/include/copyright.include"/>

package ${basepackage}.service.impl;

import ${basepackage}.common.base.BaseDao;
import ${basepackage}.common.base.BaseServiceImpl;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import ${basepackage}.dao.${className}Dao;
import ${basepackage}.domain.${className};
import ${basepackage}.service.${className}Service;
import javax.annotation.Resource;

<#include "/include/author.include"/>

@Service
@Slf4j
public class ${className}ServiceImpl extends BaseServiceImpl<${className}, Long> implements ${className}Service {

    @Resource
    private ${className}Dao ${classNameLower}Dao;

    @Override
    public BaseDao<${className}, Long> getDao() {
        return ${classNameLower}Dao;
    }
}
