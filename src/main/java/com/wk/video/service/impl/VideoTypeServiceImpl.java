package com.wk.video.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wk.video.bean.VideoType;
import com.wk.video.mapper.VideoTypeMapper;
import com.wk.video.service.VideoTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("VideoTypeService")
public class VideoTypeServiceImpl implements VideoTypeService {
    @Autowired
    VideoTypeMapper videoTypeMapper;

    @Override
    public VideoType getById(Long id) {
        return videoTypeMapper.selectById(id);
    }

    @Override
    public int update(VideoType videoType) {
        return videoTypeMapper.updateById(videoType);
    }

    @Override
    public int insert(VideoType videoType) {
        return videoTypeMapper.insert(videoType);
    }

    @Override
    public int delete(Integer id) {
        return videoTypeMapper.deleteById(id);
    }

    @Override
    public VideoType queryVideoTypeById(Integer id) {
        return videoTypeMapper.selectById(id);
    }

    @Override
    public Map<String,List<VideoType>> queryAllVideoType() {
        Map<String,List<VideoType>> map = new HashMap<>();
        QueryWrapper<VideoType> queryWrapper = new QueryWrapper<>();
        queryWrapper.isNull("typeB");
        List<VideoType> list = videoTypeMapper.selectList(queryWrapper);
        map.put("typeA",list);
        for (VideoType temp:list) {
            QueryWrapper<VideoType> wrapper = new QueryWrapper<>();
            wrapper.eq("typeA",temp.getTypeA());
            wrapper.isNotNull("typeB");
            map.put(temp.getTypeA(),videoTypeMapper.selectList(wrapper));
        }
//        for (Map.Entry<String,List<VideoType>> entry : map.entrySet()) {
//
//            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
//
//        }
        return map;
    }

    @Override
    public List<VideoType> queryTypeB(String typeA) {
        Map<String,List<VideoType>> map = new HashMap<>();
        QueryWrapper<VideoType> wrapper = new QueryWrapper<>();
        wrapper.eq("typeA",typeA);
        wrapper.isNotNull("typeB");
        List<VideoType> list = videoTypeMapper.selectList(wrapper);
        return list;
    }
}
