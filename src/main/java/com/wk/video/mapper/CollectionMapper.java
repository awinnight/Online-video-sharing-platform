package com.wk.video.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wk.video.bean.Collections;
import com.wk.video.bean.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CollectionMapper extends BaseMapper<Collections> {

    List<Collections> queryCollection(Long id);
}
