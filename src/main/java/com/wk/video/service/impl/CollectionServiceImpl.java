package com.wk.video.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wk.video.bean.Collections;
import com.wk.video.mapper.CollectionMapper;
import com.wk.video.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("collectionService")
public class CollectionServiceImpl implements CollectionService {

    @Autowired
    CollectionMapper collectionMapper;

    @Override
    public Collections getById(Long id) {
        return collectionMapper.selectById(id);
    }

    @Override
    public int update(Collections collections) {
        return 0;
    }

    @Override
    public int insert(Collections collections) {
        return collectionMapper.insert(collections);
    }

    @Override
    public List<Collections> queryCollection(Long id) {
        return collectionMapper.queryCollection(id);
    }

    @Override
    public int deleteCollection(Long id) {
        return collectionMapper.deleteById(id);
    }

    @Override
    public int deleteAllCollection(Long id) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("userid", id);
        return collectionMapper.delete(wrapper);
    }

    @Override
    public int getCount(Long userid, Long videoid) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("userid", userid);
        wrapper.eq("videoid", videoid);
        return collectionMapper.selectCount(wrapper);
    }

    @Override
    public int delete(Long userid, Long videoid) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("userid", userid);
        wrapper.eq("videoid", videoid);
        return collectionMapper.delete(wrapper);
    }
}
