package com.wk.video.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.wk.video.bean.History;
import com.wk.video.bean.Video;
import com.wk.video.mapper.HistoryMapper;
import com.wk.video.service.HistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-04-23 21:07
 **/
@Service("HistoryService")
public class HistoryServiceimpl implements HistoryService {

    @Autowired
    HistoryMapper historyMapper;

    @Override
    public History getById(Long id) {
        return historyMapper.selectById(id);
    }

    @Override
    public int update(History history) {
        return historyMapper.updateById(history);
    }

    @Override
    public int insert(History history) {
        return historyMapper.insert(history);
    }

    @Override
    public List<History> queryHistory(Long id) {
        return historyMapper.queryHistory(id);
    }

    @Override
    public int deleteHistory(Long id) {
        return historyMapper.deleteById(id);
    }

    @Override
    public int deleteAllHistory(Long id) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("userid", id);
        return historyMapper.delete(wrapper);
    }

    @Override
    public int delete(Long userid, Long videoid) {
        QueryWrapper wrapper = new QueryWrapper();
        wrapper.eq("userid", userid);
        wrapper.eq("videoid", videoid);
        return historyMapper.delete(wrapper);
    }
}
