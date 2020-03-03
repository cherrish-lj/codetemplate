package ${basepackage}.common.config;

import com.google.common.base.Function;
import com.google.common.base.Optional;
import com.google.common.base.Predicate;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.RequestHandler;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

<#include "/include/author.include"/>

@Slf4j
@Configuration
@EnableSwagger2
public class SwaggerConfig {

	<#noparse>@Value("${swagger.enabled}")</#noparse>
	private Boolean swaggerEnabled = false;

	<#noparse>@Value("${swagger.base.package}")</#noparse>
	private String basePackageValue;

	private static final String SPLIT = ",";

	private final String DEFAULT_BASE_PACKAGE = "${basepackage}.web.controller";

	@Bean
	public Docket createRestApi() {
		basePackageValue = null == basePackageValue || ("").equals(basePackageValue) ? DEFAULT_BASE_PACKAGE : basePackageValue;
		log.info("===> swagger base package : ", basePackageValue);
		return new Docket(DocumentationType.SWAGGER_2)
			 .apiInfo(apiInfo())
			 .enable(swaggerEnabled)
			 .select()
			 .apis(basePackage(basePackageValue))
			 .paths(PathSelectors.any())
			 .build();
	 }

	private ApiInfo apiInfo(){
		return new ApiInfoBuilder()
                .title("世界农场:koala")
                .description("koala API")
                .version("1.0")
                .contact(new Contact("大农科技有限公司","","zhenqiang.zhan@worldfarm.com.cn"))
                .build();
	}

	public static Predicate<RequestHandler> basePackage(final String basePackage) {
    	return input -> declaringClass(input).transform(handlerPackage(basePackage)).or(true);
    }

    private static Optional<? extends Class<?>> declaringClass(RequestHandler input) {
    	return Optional.fromNullable(input.declaringClass());
    }

    private static Function<Class<?>, Boolean> handlerPackage(final String basePackage) {
		return input -> {
			// 循环判断匹配
			for (String strPackage : basePackage.split(SPLIT)) {
				boolean isMatch = input.getPackage().getName().startsWith(strPackage);
				if (isMatch) {
					return true;
				}
			}
			return false;
		};
    }
}
