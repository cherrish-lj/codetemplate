package ${basepackage}.common.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

<#include "/include/author.include"/>

@Component
public class CloudConfigBean {

	@Value(${r'"spring.dnkj.cloud.prefer.version"'})
    private String version;

	/**
	 * @return the version
	 */
	public String getVersion() {
		return version;
	}

	/**
	 * @param version the version to set
	 */
	public void setVersion(String version) {
		this.version = version;
	}

}
