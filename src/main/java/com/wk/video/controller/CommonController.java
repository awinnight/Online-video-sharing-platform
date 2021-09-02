package com.wk.video.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.google.code.kaptcha.Producer;
import com.wk.video.bean.History;
import com.wk.video.bean.User;
import com.wk.video.bean.Video;
import com.wk.video.bean.VideoType;
import com.wk.video.service.*;
import com.wk.video.util.Result;
import com.wk.video.util.ResultUtils;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-03-18 15:07
 **/
@RestController
public class CommonController {

    @Autowired
    private Producer producer;
    @Autowired
    private VideoTypeService videoTypeService;
    @Autowired
    VideoService videoService;
    @Autowired
    UserService userService;
    @Autowired
    HistoryService historyService;
    @Autowired
    CollectionService collectionService;

    /**
     * 测试
     *
     * @return
     */
    @RequestMapping("/test")
    public ModelAndView test() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("test");
        return mv;
    }

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index(HttpSession session) {
        Map<String,List<VideoType>> typeBMap  = videoTypeService.queryAllVideoType();
        List<VideoType> typeAList = typeBMap.get("typeA");
        System.out.println(typeAList);
        for (Map.Entry<String,List<VideoType>> entry : typeBMap.entrySet()) {

            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());

        }
        session.setAttribute("typeBMap", typeBMap);
        session.setAttribute("typeAList", typeAList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");
        return mv;
    }

    /**
     * 转到登录页面
     *
     * @return
     */
    @RequestMapping("/tologin")
    public ModelAndView toLoginPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/user/login");
        return mv;
    }

    /**
     * 转到注册页面
     *
     * @return
     */
    @RequestMapping("/tosignup")
    public ModelAndView tosignup() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/user/signup");
        return mv;
    }

    /**
     * 转到搜索页面
     *
     * @return
     */
    @RequestMapping("/tosearchpage")
    public ModelAndView tosearchpage(String search) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/video/searchpage");
        mv.addObject("search",search);
        return mv;
    }

    /**
     * 转到个人信息页面
     *
     * @return
     */
    @RequestMapping("/usersetting")
    public ModelAndView usersetting() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/user/usersettings");
        return mv;
    }

    /**
     * 转到个人视频管理页面
     *
     * @return
     */
    @RequestMapping("/videomanage")
    public ModelAndView videomanage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/user/videomanage");
        return mv;
    }

    @RequestMapping("/videoOff")
    public ModelAndView videoOff(Long id){
        Video video = videoService.getById(id);
        UpdateWrapper<Video> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", id);
        updateWrapper.set("status", "-2");
        videoService.updateStatus(video,updateWrapper);
        return videomanage();
    }

    /**
     * 转到上传视频页面
     *
     * @return
     */
    @RequestMapping("/toUpload")
    public ModelAndView toUpload() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/video/upload_edit");
        //查询视频类型
        Map<String,List<VideoType>> map = videoTypeService.queryAllVideoType();
        System.out.println(map);
        mv.addObject("videoType",map);
        return mv;
    }


    @RequestMapping("/captcha")
    public void kaptcha(HttpServletResponse response, HttpSession session) throws IOException {
        //生成文字验证码
        String code = producer.createText();
        System.out.println(code   );
        //redisService.set(uuid, code);
        session.setAttribute("code",code);
        response.setHeader("Cache-Control", "no-store,no-cache");
        response.setContentType("image/jpeg");

        BufferedImage image = producer.createImage(code);
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(image, "jpg", outputStream);
        IOUtils.closeQuietly(outputStream);
    }

    /**
     * 转到视频播放页面
     *
     * @return
     */
    @RequestMapping("/singlevideopage")
    public ModelAndView toSingleVideoPage(Long id) {
        Video video = videoService.getById(id);
        User user = userService.getById(video.getUploader());
        VideoType videoType = videoTypeService.getById(video.getTypeId());

        PageHelper.startPage(1,4);
        List<Video> list = videoService.queryVideoByType(video.getId(),video.getTypeId());

        video.setViews(video.getViews()+1);
        videoService.update(video);

        historyService.delete(user.getId(),video.getId());
        historyService.insert(new History(user.getId(),video.getId(),new Date()));

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/video/singlevideopage");
        mv.addObject("video",video);
        mv.addObject("user",user);
        mv.addObject("videoType",videoType);
        mv.addObject("videos",list);

        if(collectionService.getCount(user.getId(),video.getId()) > 0){
            mv.addObject("collection","&#xe658;");
        }else {
            mv.addObject("collection","&#xe600;");
    }

        if(collectionService.getCount(user.getId(),video.getId()) > 0){
            mv.addObject("folowers","&#xe605;");
        }else {
            mv.addObject("folowers","&#xe68c;");
        }

        return mv;
    }

    @RequestMapping("/getCount")
    public Result getCount(Long videoid,HttpSession session){
        System.out.println(Integer.parseInt(new StringBuilder("01").toString()));
        Result result = ResultUtils.success();
        User user = (User)session.getAttribute("login_user");
        StringBuilder code = new StringBuilder("");
        if(collectionService.getCount(user.getId(),videoid) > 0){
            code.append("1");
        }else {
            code.append("0");
        }

        if(collectionService.getCount(user.getId(),videoid) > 0){
            code.append("1");
        }else {
            code.append("0");
        }
        result.setCode(Integer.parseInt(code.toString()));
        return result;
    }

    /**
     * 转到类型视频页面
     *
     * @return
     */
    @RequestMapping("/toOneTypeVideo")
    public ModelAndView toOneTypeVideo(Long id) {
        VideoType videoType = videoTypeService.getById(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/video/oneTypeVideo");
        mv.addObject("videoType",videoType);
        return mv;
    }

    /**
     * 转到历史记录页面
     *
     * @return
     */
    @RequestMapping("/toHistoryPage")
    public ModelAndView tpHistoryPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/video/historypage");
        return mv;
    }

    @RequestMapping("/deleteHistory")
    public ModelAndView deleteHistory(Long id,HttpSession session){
        historyService.deleteHistory(id);
        return tpHistoryPage();
    }

    @RequestMapping("/deleteAllHistory")
    public int deleteAllHistory(HttpSession session){
        User user = (User)session.getAttribute("login_user");
        return  historyService.deleteAllHistory(user.getId());
    }


    /**
     * 转到收藏页面
     *
     * @return
     */
    @RequestMapping("/toCollectionPage")
    public ModelAndView toCollectionPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/video/collectionpage");
        return mv;
    }

    @RequestMapping("/deleteCollection")
    public ModelAndView deleteCollection(Long id,HttpSession session){
        collectionService.deleteCollection(id);
        return toCollectionPage();
    }

    @RequestMapping("/deleteAllCollection")
    public int deleteAllCollection(HttpSession session){
        User user = (User)session.getAttribute("login_user");
        return  collectionService.deleteAllCollection(user.getId());
    }

}
