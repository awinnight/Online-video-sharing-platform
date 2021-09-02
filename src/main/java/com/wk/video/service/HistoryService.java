package com.wk.video.service;

import com.wk.video.bean.History;
import com.wk.video.bean.Video;

import java.util.List;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-04-23 21:06
 **/
public interface HistoryService extends BaseService<History>{

    List<History> queryHistory(Long id);

    int deleteHistory(Long id);

    int deleteAllHistory(Long id);
    int delete(Long userid,Long videoid);
}
