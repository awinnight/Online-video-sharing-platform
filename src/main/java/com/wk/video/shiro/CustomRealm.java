package com.wk.video.shiro;

import com.wk.video.bean.User;
import com.wk.video.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CustomRealm extends AuthorizingRealm {
    @Autowired
    UserService userService;

    /**
     * 授权  (权限判断时会调用)
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录用户名
        String username = (String) principalCollection.getPrimaryPrincipal();
        //查询的用户 包含了角色和权限
        User user = userService.getUserAllByUname(username);
        // 把角色和权限添加至shiro框架中
//        System.out.println(user);
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        //把角色添加至Shiro中

        //这里应该加入一个关键字，用来判断用户权限
        simpleAuthorizationInfo.addRole(user.getRole().getRolekey());

//        List<Permission> permissions = user.getTRole().getPermissions();
//        //把权限添加至Shiro中
//        for (Permission p : permissions
//        ) {
//            simpleAuthorizationInfo.addStringPermission(p.getPermissionkey());
//        }

        return simpleAuthorizationInfo;
    }

    /**
     * 认证
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        if (authenticationToken.getPrincipal() == null) {
            return null;
        }
        System.out.println("AuthenticationInfo");
        //身份信息
        String username = authenticationToken.getPrincipal().toString();
        //查用户
        User user = userService.getUserAllByUname(username);

        if (user == null) {
            return null;
        } else {
            //验证
            try {
                SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(username, user.getPassWord(), getName());
                return simpleAuthenticationInfo;
            } catch (Exception e) {
                return null;
            }
        }
    }
}
