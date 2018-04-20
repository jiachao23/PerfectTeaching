package com.jcohy.perfectteaching;

import com.jcohy.perfectteaching.interception.CommonIntercepter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.MultipartConfigElement;

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

        //登录首页
        registry.addViewController("/").setViewName("login");
        //修改密码
        registry.addViewController("/admin/update").setViewName("/update");

        //老师主页跳转
        registry.addViewController("/teacher/main").setViewName("/teacher/main");
        registry.addViewController("/teacher/index").setViewName("/student/index");
        registry.addViewController("/teacher/course/index").setViewName("/teacher/course/index");
        registry.addViewController("/teacher/lab/index").setViewName("/teacher/lab/index");
        registry.addViewController("/teacher/resource/index").setViewName("/teacher/resource/index");
        registry.addViewController("/teacher/report/index").setViewName("/teacher/report/index");
        registry.addViewController("/teacher/grade/index").setViewName("/teacher/grade/index");
//        registry.addViewController("/teacher/course/index").setViewName("/teacher/course/index");
        //管理员主页，从登录
        registry.addViewController("/admin/main").setViewName("/admin/main");

        registry.addViewController("/admin/index").setViewName("/admin/index");

        registry.addViewController("/admin/teacher/index").setViewName("/admin/teacher/index");

        registry.addViewController("/admin/lab/index").setViewName("/admin/lab/index");
        registry.addViewController("/admin/plan/index").setViewName("/admin/plan/index");
	}

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //单个文件最大
        factory.setMaxFileSize("102400000KB"); //KB,MB
        /// 设置总上传数据总大小
        factory.setMaxRequestSize("102400000KB");
        return factory.createMultipartConfig();
    }
}
