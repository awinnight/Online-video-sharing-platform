package com.wk.video.service.impl;

import com.wk.video.bean.Ad;
import com.wk.video.bean.User;
import com.wk.video.mapper.AdMapper;
import com.wk.video.service.AdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdService")
public class AdServiceImpl implements AdService {

    @Autowired
    AdMapper adMapper;

    @Override
    public int delete(Long id) {
        return adMapper.deleteById(id);
    }

    @Override
    public Ad getById(Long id) {
        return adMapper.selectById(id);
    }

    @Override
    public int update(Ad ad) {
        return adMapper.updateById(ad);
    }

    @Override
    public int insert(Ad ad) {
        return adMapper.insert(ad);
    }

    @Override
    public List<Ad> getAllAd(String name, String url) {
        List<Ad> list = adMapper.getAllAd(name,url);
        return list;
    }
}
