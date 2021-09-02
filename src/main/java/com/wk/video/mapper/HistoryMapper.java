package com.wk.video.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wk.video.bean.History;
import com.wk.video.bean.Video;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryMapper extends BaseMapper<History> {

    List<History> queryHistory(Long id);
}
