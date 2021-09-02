package com.wk.video.service;

import com.wk.video.bean.Ad;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdService extends BaseService<Ad>{

    int delete(Long id);

    List<Ad> getAllAd(@Param(value = "name") String name,  @Param(value = "url") String url);
}
