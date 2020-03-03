package com.wlqq.framework.generator;

import java.io.File;

import cn.org.rapid_framework.generator.GeneratorFacade;

/**
 * 模板工程生成器
 */
public class Generator {
    public static void main(String[] args) throws Exception {
        GeneratorFacade g = new GeneratorFacade();
//        System.out.println(new File("template").getAbsolutePath());
        g.getGenerator().addTemplateRootDir(new File(Generator.class.getResource("/") + "/../../template"));

//		g.printAllTableNames();				//打印数据库中的表名称w

        g.deleteOutRootDir();							//删除生成器的输出目录

        g.generateByTable("t_product_type");	//通过数据库表生成文件,template为模板的根目录
//        g.generateByAllTable();	//自动搜索数据库中的所有表并生成文件,template为模板的根目录

    }
}
