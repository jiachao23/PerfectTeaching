package com.jcohy.perfectteaching;

import com.jcohy.perfectteaching.interception.CommonIntercepter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
public class PerfectTeachingApplication extends WebMvcConfigurerAdapter {


    @Autowired
    private CommonIntercepter commonIntercepter;
	public static void main(String[] args) {
		SpringApplication.run(PerfectTeachingApplication.class, args);
	}


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(commonIntercepter).addPathPatterns("/admin/**");
    }

    @Override
	public void addViewControllers(ViewControllerRegistry registry) {

		//前台首页
		registry.addViewController("/").setViewName("login");
		registry.addViewController("/admin/index").setViewName("/admin/main");
	}
}
