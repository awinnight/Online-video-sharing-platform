package com.wk.video.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.wk.video.shiro.CustomRealm;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    //分别编写方法(先写Realm，在写SecurityManager，最后是Subject)
    //Subject主体
    //SecurityManager安全管理
    //Realm权限的验证

    @Bean
    @ConditionalOnMissingBean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAAP = new DefaultAdvisorAutoProxyCreator();
        defaultAAP.setProxyTargetClass(true);
        return defaultAAP;
    }

    //将自己的验证方式加入容器
    @Bean
    public CustomRealm myShiroRealm() {
        CustomRealm customRealm = new CustomRealm();
        return customRealm;
    }

    //权限管理，配置主要是Realm的管理认证
    @Bean
    public DefaultSecurityManager securityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(myShiroRealm());
        return securityManager;
    }

    //Filter工厂，设置对应的过滤条件和跳转条件
    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(DefaultSecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        /**
         * anon：匿名用户可访问
         * authc：认证用户可访问
         * user：使用rememberMe可访问
         * perms：对应权限可访问
         * role：对应角色权限可访问
         */
        Map<String, String> map = new LinkedHashMap<>();
        // 开放登录接口
        // 静态资源放行
        map.put("/static/**", "anon");
        map.put("/css/**", "anon");
        map.put("/lib/**", "anon");
        map.put("/js/**", "anon");
        map.put("/images/**", "anon");

        map.put("/manage/tologin", "anon");

        map.put("/video/getRecentVideo", "anon");
        map.put("/video/getHotVideo", "anon");
        map.put("/test", "anon");
        map.put("/user/Login", "anon");
        map.put("/user/signup", "anon");
        map.put("/captcha", "anon");
        map.put("/user/existsUsername", "anon");
        map.put("/user/existsEmail", "anon");
        map.put("/tologin", "anon");//转向登陆页面
        map.put("/tosignup", "anon");//转向登陆页面
//        map.put("/user/login", "anon");//登陆动作
//        map.put("/login", "authc");
        // 对登录跳转接口进行释放
        map.put("/error", "anon");
        map.put("/index", "anon");
        // 对所有用户认证
        map.put("/**", "authc");
        // 登出
        map.put("/logout", "logout");
        // 登录
        // 注意：这里配置的 /toLogin 是指到 @RequestMapping(value="/toLogin")中的 /toLogin
        shiroFilterFactoryBean.setLoginUrl("tologin");
        // 首页
        shiroFilterFactoryBean.setSuccessUrl("/index");
        // 错误页面，认证不通过跳转
        shiroFilterFactoryBean.setUnauthorizedUrl("/error/unAuth");

        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
        }

        shiroFilterFactoryBean.setFilterChainDefinitionMap(map);
        return shiroFilterFactoryBean;
    }


    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(DefaultSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    @Bean
    public ShiroDialect shiroDialect() {
        return new ShiroDialect();
    }
}