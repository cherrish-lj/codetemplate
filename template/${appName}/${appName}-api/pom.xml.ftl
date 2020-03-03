<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>${appName}</artifactId>
        <groupId>${basepackage}</groupId>
        <version>1.0.0-SNAPSHOT</version>
    </parent>

    <modelVersion>4.0.0</modelVersion>
    <artifactId>${appName}-api</artifactId>
<#noparse>
    <dependencies>

        <dependency>
            <groupId>org.hibernate</groupId>
            <artifactId>hibernate-validator</artifactId>
            <version>6.0.13.Final</version>
            <scope>provided</scope>
            <exclusions>
                <exclusion>
                    <groupId>com.fasterxml</groupId>
                    <artifactId>classmate</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        <!--spring cloud-->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-openfeign</artifactId>
        </dependency>

        <dependency>
            <groupId>io.github.openfeign</groupId>
            <artifactId>feign-httpclient</artifactId>
        </dependency>

        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
        </dependency>

        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>slf4j-api</artifactId>
        </dependency>
        <dependency>
            <groupId>io.swagger</groupId>
            <artifactId>swagger-annotations</artifactId>
        </dependency>
    </dependencies>

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
</#noparse>
</project>