package com.wk.video.service;

import com.wk.video.bean.VideoType;

import java.util.List;
import java.util.Map;

public interface VideoTypeService extends BaseService<VideoType>{

    /**
     *  删除视频类型 （逻辑删除）
     * @param id 视频类型
     * @return 被影响的行数，返回-1代表添加失败
     */
    public int delete(Integer id);

    /**
     *  根据id查分类
     * @param id 一级分类
     * @return 视频类型
     */
    public VideoType queryVideoTypeById(Integer id);

    /**
     * 查询所有的视频分类
     * @param
     * @return 视频类型信息的集合
     */
    public Map<String,List<VideoType>> queryAllVideoType();

    /**
     * 查询所有的视频分类
     * @param
     * @return 视频类型信息的集合
     */
    public List<VideoType> queryTypeB(String typeA);
}
