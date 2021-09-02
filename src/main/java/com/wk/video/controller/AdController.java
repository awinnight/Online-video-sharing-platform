package com.wk.video.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wk.video.bean.Ad;
import com.wk.video.service.AdService;
import com.wk.video.util.Result;
import com.wk.video.util.ResultUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-04-09 19:32
 **/
@RestController
@RequestMapping("ad")
public class AdController {
    @Autowired
    AdService adService;

    /**
     * 后台获取广告信息
     *
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/get_Ad")
    public Result getAllAd(Integer current, Integer size, String name, String url) {
        if (name != null && name.trim().equals("")) {
            name = null;
        }
        if (url != null && url.trim().equals("")) {
            url = null;
        }
        PageHelper.startPage(current, size);
        PageInfo<Ad> pageInfo = new PageInfo<Ad>(adService.getAllAd(name,url));
        Result result = ResultUtils.success(pageInfo.getList());
        result.setCode(0);
        result.setCount((int) pageInfo.getTotal());
        return result;
    }
}
