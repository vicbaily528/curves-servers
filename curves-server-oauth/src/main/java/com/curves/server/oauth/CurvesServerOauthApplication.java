package com.curves.server.oauth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

/**
 * 单点登录
 * @author vic
 */
@SpringBootApplication
@ServletComponentScan
public class CurvesServerOauthApplication {
    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(CurvesServerOauthApplication.class);
        application.run(args);
    }
}
