package com.wk.video.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wk.video.bean.Followers;
import com.wk.video.mapper.FollowersMapper;
import com.wk.video.service.FollowersSercice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("followersSercice")
public class FollowersServiceImpl implements FollowersSercice {

    @Autowired
    FollowersMapper followersMapper;

    @Override
    public int delete(Long id) {
        return followersMapper.deleteById(id);
    }

    @Override
    public int deleteByid(Long userid, Long followers) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("userid", userid);
        wrapper.eq("followers", followers);
        return followersMapper.delete(wrapper);
    }

    @Override
    public int getCount(Long userid, Long followers) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("userid", userid);
        wrapper.eq("followers", followers);
        return followersMapper.selectCount(wrapper);
    }

    @Override
    public Followers getById(Long id) {
        return followersMapper.selectById(id);
    }

    @Override
    public int update(Followers followers) {
        return 0;
    }

    @Override
    public int insert(Followers followers) {
        return followersMapper.insert(followers);
    }
}
