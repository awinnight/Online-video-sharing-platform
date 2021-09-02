package com.wk.video.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wk.video.bean.Role;
import com.wk.video.bean.User;
import com.wk.video.mapper.RoleMapper;
import com.wk.video.mapper.UserMapper;
import com.wk.video.service.BaseService;
import com.wk.video.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService{

    UserMapper userMapper;
    RoleMapper roleMapper;

    @Autowired
    public void setRoleMapper(RoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


    @Override
    public int isUserExisted(String str) {
        int count = isEmailExisted(str);
        if(count == 0){
            count = isNameExisted(str);
        }
        return count;
    }

    @Override
    public int isEmailExisted(String email) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("email", email);
        int count = userMapper.selectCount(queryWrapper);
        System.out.println("User Count:" + count);
        return count;
    }

    @Override
    public int isNameExisted(String userName) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", userName);
        int count = userMapper.selectCount(queryWrapper);
        System.out.println("User Count:" + count);
        return count;
    }


    @Override
    public Boolean updateUserStatus(User user) {
        UpdateWrapper<User> userUpdateWrapper = new UpdateWrapper<>();
        userUpdateWrapper.eq("id",user.getId());
        if ("0".equals(user.getStatus())){
            userUpdateWrapper.set("status",1);
        }else{
            userUpdateWrapper.set("status",0);
        }
        return userMapper.update(user,userUpdateWrapper)>-1;
    }

    @Override
    public User getUserAllByUname(String username) {
        User user = userMapper.getUserAllByUname(username);
        Role role = roleMapper.selectById(user.getRoleId());
        user.setRole(role);
        return user;
    }

    @Override
    public List<User> getUsers(String email,String userName,String nickName) {
        List<User> list = userMapper.getUsers(email,userName,nickName);
        System.out.println(list);
        return list;
    }

    @Override
    public List<User> getManagerUsers(String email, String userName, String nickName, Long id) {
        List<User> list = userMapper.getManagerUsers(email,userName,nickName,id);
        System.out.println(list);
        return list;
    }

    @Override
    public User getById(Long id) {
        return userMapper.selectById(id);
    }

    @Override
    public int update(User user) {
        return userMapper.updateById(user);
    }

    @Override
    public int insert(User user) {
        return userMapper.insert(user);
    }
}
