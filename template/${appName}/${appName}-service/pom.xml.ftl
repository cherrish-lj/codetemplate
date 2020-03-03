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
    <artifactId>${appName}-service</artifactId>
    <dependencies>
        <dependency>
            <groupId>${basepackage}</groupId>
            <artifactId>${appName}-api</artifactId>
           <#noparse><version>${project.parent.version}</version></#noparse>
            <exclusions>
                <exclusion>
                    <groupId>*</groupId>
                    <artifactId>*</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>${basepackage}</groupId>
            <artifactId>${appName}-remote</artifactId>
            <#noparse><version>${project.parent.version}</version></#noparse>
        </dependency>
        <dependency>
            <groupId>${basepackage}</groupId>
            <artifactId>${appName}-common</artifactId>
            <#noparse><version>${project.parent.version}</version></#noparse>
        </dependency>
        <dependency>
            <groupId>${basepackage}</groupId>
            <artifactId>${appName}-dao</artifactId>
            <#noparse><version>${project.parent.version}</version></#noparse>
        </dependency>
    </dependencies>
</project>