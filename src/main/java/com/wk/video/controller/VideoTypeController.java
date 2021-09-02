package com.wk.video.controller;

import com.wk.video.bean.VideoType;
import com.wk.video.service.VideoTypeService;
import com.wk.video.util.Result;
import com.wk.video.util.ResultUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-03-25 15:37
 **/
@RestController
@RequestMapping("/videoType")
@Log4j2
public class VideoTypeController {

    @Autowired
    VideoTypeService videoTypeService;

    /**
     * 获取typeA的二级分类
     * @param typeA
     * @return
     */
    @RequestMapping("/getTypeB")
    public Result getTypeB(String typeA){
        Result<VideoType> result = null;
        result = ResultUtils.success(videoTypeService.queryTypeB(typeA));
        return result;
    }
}
