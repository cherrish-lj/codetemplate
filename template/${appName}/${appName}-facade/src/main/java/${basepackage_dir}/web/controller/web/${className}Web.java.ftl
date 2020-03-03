<#include "/include/base.include"/>
<#include "/include/copyright.include"/>

package ${basepackage}.web.controller.web;

import ${basepackage}.service.${className}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ${basepackage}.common.base.BaseController;
import ${basepackage}.common.base.Result;
import lombok.extern.slf4j.Slf4j;
import io.swagger.annotations.ApiOperation;
import javax.validation.Valid;

<#include "/include/author.include"/>

@Controller
@RequestMapping(value = "web/${classNameLower}")
@Slf4j
public class ${className}Web extends BaseController {

    @Autowired
    private ${className}Service ${classNameLower}Service;

    @ApiOperation(value = "新建${table.remarks}", tags = {"${table.remarks}"})
    @RequestMapping(value = "/get", produces = {"application/json"}, method = RequestMethod.POST)
    @Valid
    public Result<Void> get() throws Exception {
        return successVoid();
    }
}
