  # 项目介绍
 * 基于spring Cloud的微服务框架
 * 版本：spring cloud F版 + springboot2.0.x + feign+zipkin+gateway+eurekas实现
 * 引入了redis缓存和redis分布式锁，hibernate参数校验，lombok对象方法生成
 * 对外公共枚举建议放在api模块里面，自用的枚举放在common模块里面
  
  # 项目框架
  简单关系如下图：
       
  ![teamtalk架构图](http://wiki.sjnc.com/download/attachments/10256468/image2019-1-23_11-47-37.png?version=1&modificationDate=1548215255487&api=v2)


  # 说明
zipkin 和 eureka 已经部署在开发环境，需要配置如下host
192.168.62.242 dev-eureka.worldfarm.com
192.168.62.242 dev-zipkin.worldfarm.com
  
