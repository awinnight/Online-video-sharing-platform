package com.wk.video.controller;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wk.video.bean.*;
import com.wk.video.service.CollectionService;
import com.wk.video.service.HistoryService;
import com.wk.video.service.UserService;
import com.wk.video.service.VideoService;
import com.wk.video.util.Result;
import com.wk.video.util.ResultUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-03-25 16:36
 **/
@RestController
@RequestMapping("/video")
@Log4j2
public class VideoController {

    public final static String FILE_TYPE_IMG = "img";
    public final static String FILE_TYPE_VIDEO = "video";

    @Autowired
    VideoService videoService;
    @Autowired
    UserService userService;
    @Autowired
    HistoryService historyService;
    @Autowired
    CollectionService collectionService;

    @RequestMapping("/getRecentVideo")
    public Result getRecentVideo(){
        Result result = null;
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(1,8);
        List<Video> list = videoService.queryVideoNearDay();
        result = ResultUtils.success(list);
        return result;
    }

    @RequestMapping("/getHotVideo")
    public Result getHotVideo(){
        Result result = null;
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(1,8);
        List<Video> list = videoService.queryVideoHot();
        result = ResultUtils.success(list);
        return result;
    }

    @RequestMapping("/getVideoByType")
    public PageInfo<Video> getVideoByType(Integer pageNum,Long typeid){
        if(StringUtils.isEmpty(pageNum)){ //如果不为空的话改变当前页号
            pageNum = 1;
        }
        System.out.println(pageNum+"");
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(pageNum, 12);
        PageInfo<Video> pageInfo = new PageInfo<Video>(videoService.queryVideoByType(-1L,typeid));
//        result = ResultUtils.success(pageInfo.getList());
//        result.setCode(0);
//        result.setCount((int) pageInfo.getTotal());
        return pageInfo;
    }

    /**
     * 视频上传
     *
     * @param imgfile
     * @param videofile
     * @param title
     * @param desc
     * @param type
     * @return
     */
    @RequestMapping("/upload")
    public Result upload(@RequestParam("coverPic") MultipartFile imgfile, @RequestParam("url") MultipartFile videofile,
                         @RequestParam("title") String title, @RequestParam("desc") String desc, @RequestParam("type") Long type, HttpSession session) throws IOException {
        Result result = null;
        User user = (User) session.getAttribute("login_user");

        //上传封面
        String coverPic = uploadFIle(imgfile,FILE_TYPE_IMG);
        //上传视频
        String url = uploadFIle(videofile,FILE_TYPE_VIDEO);

        Video video = new Video(null,user.getId(),title,desc,type,0,coverPic,url,"0",new Date());

        int count = videoService.insert(video);
        if(count > 0){
            result = ResultUtils.success();
        }else {
            result = ResultUtils.error(-2, "上传失败");
        }
        return result;
    }

    /**
     * 上传文件
     * @param file
     * @param filetype
     * @return 上传路径
     * @throws IOException
     */
    private String uploadFIle(MultipartFile file, String filetype) throws IOException {
        log.info("正在上传文件，类型：{}，大小：{}B",filetype,file.getSize());
        String filename = System.currentTimeMillis() + file.getOriginalFilename();
        //上传到服务器的路径
        java.io.File projectPath = new java.io.File(ResourceUtils.getURL("classpath:").getPath());
        System.out.println(projectPath);
        java.io.File upload = new java.io.File(projectPath, "static/files/" + filetype + "");
        if (!upload.exists()) {
            upload.mkdirs();
        }
        java.io.File dest = new java.io.File(upload.getAbsolutePath() + java.io.File.separator + filename);
        file.transferTo(dest);
        String path = "files/" + filetype + "/" + filename;
        return path;
    }

    /**
     * 后台未审核信息
     *
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/get_examine")
    public Result getExamine(Integer current, Integer size, String startTime, String endTime, String uploader, String title) {
        if (startTime != null && startTime.trim().equals("")) {
            startTime = null;
        }
        if (endTime != null && endTime.trim().equals("")) {
            endTime = null;
        }
        if (uploader != null && uploader.trim().equals("")) {
            uploader = null;
        }
        if (title != null && title.trim().equals("")) {
            title = null;
        }
        PageHelper.startPage(current, size);
        PageInfo<Video> pageInfo = new PageInfo<Video>(videoService.getExamine(startTime,endTime,uploader,title));
        Result result = ResultUtils.success(pageInfo.getList());
        result.setCode(0);
        result.setCount((int) pageInfo.getTotal());
        return result;
    }

    /**
     * 后台未审核信息
     *
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/get_videolist")
    public Result getVideolist(Integer current, Integer size, String startTime, String endTime, String uploader, String title) {
        if (startTime != null && startTime.trim().equals("")) {
            startTime = null;
        }
        if (endTime != null && endTime.trim().equals("")) {
            endTime = null;
        }
        if (uploader != null && uploader.trim().equals("")) {
            uploader = null;
        }
        if (title != null && title.trim().equals("")) {
            title = null;
        }
        PageHelper.startPage(current, size);
        PageInfo<Video> pageInfo = new PageInfo<Video>(videoService.getVideolist(startTime,endTime,uploader,title));
        Result result = ResultUtils.success(pageInfo.getList());
        result.setCode(0);
        result.setCount((int) pageInfo.getTotal());
        return result;
    }

    @RequestMapping("/videoPass")
    public Result videoPass(Long id, Integer code) {
        Video video = videoService.getById(id);
        UpdateWrapper<Video> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", id);
        if (code == 1) {
            updateWrapper.set("status", "1");
        } else if(code == -1) {
            updateWrapper.set("status", "-1");
        } else if (code == -2){
            String status = video.getStatus();
            if(status.equals("1")){
                updateWrapper.set("status", "-2");
            }else {
                updateWrapper.set("status", "1");
            }
        }
        if (videoService.updateStatus(video, updateWrapper)) {
            return ResultUtils.success();
        }else {
            return ResultUtils.error(-1, "操作失败");
        }
    }

    @RequestMapping("/getHistory")
    public PageInfo<History> getHistory(Integer pageNum,HttpSession session){
        User user = (User)session.getAttribute("login_user");
        if(StringUtils.isEmpty(pageNum)){ //如果不为空的话改变当前页号
            pageNum = 1;
        }
        System.out.println(pageNum+"");
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(pageNum, 6);
        PageInfo<History> pageInfo = new PageInfo<History>(historyService.queryHistory(user.getId()));
        return pageInfo;
    }

    @RequestMapping("/getCollection")
    public PageInfo<Collections> getColletion(Integer pageNum,HttpSession session){
        User user = (User)session.getAttribute("login_user");
        if(StringUtils.isEmpty(pageNum)){ //如果不为空的话改变当前页号
            pageNum = 1;
        }
        System.out.println(pageNum+"");
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(pageNum, 6);
        PageInfo<Collections> pageInfo = new PageInfo<Collections>(collectionService.queryCollection(user.getId()));
        return pageInfo;
    }

    @RequestMapping("/getPass")
    public PageInfo<Video> getPass(Integer pageNum,HttpSession session){
        User user = (User)session.getAttribute("login_user");
        if(StringUtils.isEmpty(pageNum)){ //如果不为空的话改变当前页号
            pageNum = 1;
        }
        System.out.println(pageNum+"");
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(pageNum, 4);
        PageInfo<Video> pageInfo = new PageInfo<Video>(videoService.getPass(user.getId()));
        return pageInfo;
    }

    @RequestMapping("/getAudit")
    public PageInfo<Video> getAudit(Integer pageNum,HttpSession session){
        User user = (User)session.getAttribute("login_user");
        if(StringUtils.isEmpty(pageNum)){ //如果不为空的话改变当前页号
            pageNum = 1;
        }
        System.out.println(pageNum+"");
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(pageNum, 4);
        PageInfo<Video> pageInfo = new PageInfo<Video>(videoService.getAudit(user.getId()));
        return pageInfo;
    }

    @RequestMapping("/getFail")
    public PageInfo<Video> getFail(Integer pageNum,HttpSession session){
        User user = (User)session.getAttribute("login_user");
        if(StringUtils.isEmpty(pageNum)){ //如果不为空的话改变当前页号
            pageNum = 1;
        }
        System.out.println(pageNum+"");
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(pageNum, 4);
        PageInfo<Video> pageInfo = new PageInfo<Video>(videoService.getFail(user.getId()));
        return pageInfo;
    }

    /**
     * 收藏视频
     * @param id
     * @return
     */
    @RequestMapping("/collectionVideo")
    public Result collectionVideo(Long videoid,HttpSession session) {
        User user = (User) session.getAttribute("login_user");
        Result result = ResultUtils.success();
        log.info("执行请求{user/folowUser}，关注用户");
        if (collectionService.getCount(user.getId(),videoid) > 0) {
            collectionService.delete(user.getId(),videoid);
            result.setCode(0);
        } else {
            collectionService.insert(new Collections(user.getId(), videoid, new Date()));
            result.setCode(1);
        }
        return result;
    }


    @RequestMapping("/searchVideo")
    public PageInfo<Video> searchVideo(Integer pageNum,String search){
        if(StringUtils.isEmpty(pageNum)){ //如果不为空的话改变当前页号
            pageNum = 1;
        }
        //引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(pageNum, 12);
        PageInfo<Video> pageInfo = new PageInfo<Video>(videoService.searchVideo(search));
        return pageInfo;
    }
}
