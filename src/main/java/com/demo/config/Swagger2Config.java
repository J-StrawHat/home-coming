package com.demo.config;

import org.springframework.context.annotation.Bean;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

public class Swagger2Config {
    @Bean
    public Docket createRestApi()
    {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()//扫描接口
                .apis(RequestHandlerSelectors.basePackage("com.demo.controller"))//扫描包
                .paths(PathSelectors.any())//扫描请求路径
                .build();


    }

    private ApiInfo apiInfo()
    {
        return  new ApiInfoBuilder()
                .title("归家行动接口文档")
                .description("归家行动接口文档")
                .contact(new Contact("wyh","http://localhost:8081/doc.html","821403286@qq.com"))
                .version("1.0")
                .build();
    }
}
