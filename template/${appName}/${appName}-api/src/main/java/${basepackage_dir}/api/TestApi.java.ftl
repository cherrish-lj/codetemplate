<#include "/include/base.include"/>
<#include "/include/copyright.include"/>

package ${basepackage}.api;

<#--import org.springframework.cloud.openfeign.FeignClient;-->

<#include "/include/author.include"/>

<#--@FeignClient(name = "${appName}", path = "/${appName}")-->
public interface TestApi {

}
