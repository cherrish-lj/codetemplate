<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>${basepackage}</groupId>
    <artifactId>${appName}</artifactId>
    <packaging>pom</packaging>
    <version>1.0.0-SNAPSHOT</version>
    <modules>
        <module>${appName}-facade</module>
        <module>${appName}-dao</module>
        <module>${appName}-remote</module>
        <module>${appName}-api</module>
        <module>${appName}-domain</module>
        <module>${appName}-service</module>
        <module>${appName}-common</module>
    </modules>

    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.0.7.RELEASE</version>
        <relativePath/>
    </parent>

    <properties>
        <java.version>1.8</java.version>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <spring-boot.version>2.0.7.RELEASE</spring-boot.version>
        <spring-cloud.version>Finchley.RELEASE</spring-cloud.version>
        <servlet-api.version>3.1.0</servlet-api.version>
        <serverb.version>1.0.0-SNAPSHOT</serverb.version>
        <springfox-swagger.version>2.7.0</springfox-swagger.version>
        <springfox-swagger-annotations.version>1.5.13</springfox-swagger-annotations.version>
        <guava.version>20.0</guava.version>
        <fastjson.version>1.2.35</fastjson.version>
        <discovery.plugin.version>4.8.3</discovery.plugin.version>
        <spring.cloud.alibaba.version>0.2.1.RELEASE</spring.cloud.alibaba.version>
        <alibaba.sentinel.version>2.0.0.RELEASE</alibaba.sentinel.version>
        <sentinel.datasource.nacos.version>1.6.0</sentinel.datasource.nacos.version>
    </properties>

    <dependencyManagement>
        <dependencies>
            <#noparse>
            <!--spring boot start-->
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-actuator</artifactId>
                <version>${spring-boot.version}</version>
            </dependency>
            <!--spring boot end-->
            <!-- spring cloud start-->
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring-cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            </#noparse>
            <!-- spring cloud end-->
            <#noparse>
            <!-- swagger start -->
            <dependency>
                <groupId>io.springfox</groupId>
                <artifactId>springfox-swagger2</artifactId>
                <version>${springfox-swagger.version}</version>
                <exclusions>
                    <exclusion>
                        <artifactId>*</artifactId>
                        <groupId>org.springframework</groupId>
                    </exclusion>
                    <exclusion>
                        <artifactId>guava</artifactId>
                        <groupId>com.google.guava</groupId>
                    </exclusion>
                </exclusions>
            </dependency>
            <dependency>
                <groupId>io.swagger</groupId>
                <artifactId>swagger-annotations</artifactId>
                <version>${springfox-swagger-annotations.version}</version>
            </dependency>
            <dependency>
                <groupId>com.google.guava</groupId>
                <artifactId>guava</artifactId>
                <version>${guava.version}</version>
            </dependency>
            <dependency>
                <groupId>io.springfox</groupId>
                <artifactId>springfox-spring-web</artifactId>
                <version>${springfox-swagger.version}</version>
            </dependency>
            <dependency>
                <groupId>io.springfox</groupId>
                <artifactId>springfox-swagger-ui</artifactId>
                <version>${springfox-swagger.version}</version>
            </dependency>
            <!-- swagger end -->
            <!--fastjson-->
            <dependency>
                <groupId>com.alibaba</groupId>
                <artifactId>fastjson</artifactId>
                <version>${fastjson.version}</version>
            </dependency>
            <!--lombok-->
            <dependency>
                <groupId>org.projectlombok</groupId>
                <artifactId>lombok</artifactId>
                <version>${lombok.version}</version>
            </dependency>
            <!--log about-->
            <!--log4j-->
            <dependency>
                <groupId>log4j</groupId>
                <artifactId>log4j</artifactId>
                <version>1.2.17</version>
            </dependency>
            <!--slf4j-->
            <dependency>
                <groupId>org.slf4j</groupId>
                <artifactId>slf4j-api</artifactId>
                <version>1.7.22</version>
            </dependency>
            <!--nepxion start-->
            <dependency>
                <groupId>com.nepxion</groupId>
                <artifactId>discovery</artifactId>
                <version>${discovery.plugin.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-alibaba-dependencies</artifactId>
                <version>${spring.cloud.alibaba.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <!--nepxion end-->

            <!--sentinel start-->
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-starter-alibaba-sentinel</artifactId>
                <version>${alibaba.sentinel.version}</version>
            </dependency>

            <dependency>
                <groupId>com.alibaba.csp</groupId>
                <artifactId>sentinel-datasource-nacos</artifactId>
                <version>${sentinel.datasource.nacos.version}</version>
            </dependency>
            <!--sentinel end-->

        </#noparse>

        </dependencies>
    </dependencyManagement>

    <distributionManagement>
        <repository>
            <id>nexus</id>
            <name>Nexus Release Repository</name>
            <url>http://39.104.28.40:9610/repository/zyp-releases/</url>
        </repository>
        <snapshotRepository>
            <id>nexus</id>
            <name>Nexus Snapshot Repository</name>
            <url>http://39.104.28.40:9610/repository/zyp-snapshots/</url>
        </snapshotRepository>
    </distributionManagement>
</project>