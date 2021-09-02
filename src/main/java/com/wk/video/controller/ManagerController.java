package com.wk.video.controller;

import com.wk.video.bean.Role;
import com.wk.video.bean.User;
import com.wk.video.bean.Video;
import com.wk.video.bean.VideoType;
import com.wk.video.service.RoleService;
import com.wk.video.service.UserService;
import com.wk.video.service.VideoService;
import com.wk.video.service.VideoTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-04-09 15:39
 **/
@RestController
@RequestMapping("/manage")
public class ManagerController {
    @Autowired
    VideoService videoService;
    @Autowired
    UserService userService;
    @Autowired
    VideoTypeService videoTypeService;
    @Autowired
    RoleService roleService;

    /**
     * 转到后台登录页面
     *
     * @return
     */
    @RequestMapping("/tologin")
    public ModelAndView toManagerlogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/login");
        return mv;
    }

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("/index")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/index");
        return mv;
    }

    @RequestMapping("/to_user_list")
    public ModelAndView toUserListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/user_list");
        return mv;
    }

    @RequestMapping("/to_manager_list")
    public ModelAndView toManagerListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/manager_list");
        return mv;
    }

    @RequestMapping("/to_manager_add")
    public ModelAndView toManagerAddPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/manager_add");
        return mv;
    }

    /**
     * 查看管理员信息
     * @param id
     * @return
     */
    @RequestMapping("/to_view_manager/{id}")
    public ModelAndView toViewManager(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView();
        User user = userService.getById(id);
        Role role = roleService.getById(user.getRoleId());
        user.setRolename(role.getName());
        mv.addObject("user",user);
        mv.setViewName("/management/manager_info");
        return mv;
    }

    /**
     * 编辑管理员信息
     * @param id
     * @return
     */
    @RequestMapping("/to_edit_manager/{id}")
    public ModelAndView toEditManager(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView();
        User user = userService.getById(id);
        mv.addObject("user",user);
        mv.setViewName("/management/manager_edit");
        return mv;
    }

    @RequestMapping("/to_ad_list")
    public ModelAndView toAdListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/ad_list");
        return mv;
    }

    @RequestMapping("/to_examine_list")
    public ModelAndView toExamineListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/examine_list");
        return mv;
    }

    @RequestMapping("/to_video_list")
    public ModelAndView toVideoListPage() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/video_list");
        return mv;
    }

    @RequestMapping("/to_video_examine")
    public ModelAndView toVideoExaminePage(Long id) {
        System.out.println("id="+id);
        Video video = videoService.getById(id);
        User user = userService.getById(video.getUploader());
        VideoType videoType = videoTypeService.getById(video.getTypeId());
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(video.getCreateTime());
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/video_examine");
        mv.addObject("video",video);
        mv.addObject("createTime",time);
        mv.addObject("userName",user.getUserName());
        mv.addObject("videoType",videoType.getTypeB());
        return mv;
    }

    @RequestMapping("/to_video_info")
    public ModelAndView toVideoinfoPage(Long id) {
        Video video = videoService.getById(id);
        User user = userService.getById(video.getUploader());
        VideoType videoType = videoTypeService.getById(video.getTypeId());
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(video.getCreateTime());
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/management/video_info");
        mv.addObject("video",video);
        mv.addObject("createTime",time);
        mv.addObject("userName",user.getUserName());
        mv.addObject("videoType",videoType.getTypeB());
        return mv;
    }
}
