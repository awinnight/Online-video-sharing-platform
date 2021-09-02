package com.wk.video.service.impl;

import com.wk.video.bean.Role;
import com.wk.video.mapper.RoleMapper;
import com.wk.video.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-04-23 11:32
 **/
@Service("RoleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleMapper roleMapper;

    @Override
    public Role getById(Long id) {
        return roleMapper.selectById(id);
    }

    @Override
    public int update(Role role) {
        return roleMapper.updateById(role);
    }

    @Override
    public int insert(Role role) {
        return roleMapper.insert(role);
    }
}
