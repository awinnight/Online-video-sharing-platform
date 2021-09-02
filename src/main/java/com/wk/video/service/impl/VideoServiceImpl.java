package com.wk.video.service.impl;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.wk.video.bean.User;
import com.wk.video.bean.Video;
import com.wk.video.mapper.VideoMapper;
import com.wk.video.service.VideoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("VideoService")
public class VideoServiceImpl implements VideoService {
    @Autowired
    VideoMapper videoMapper;

    @Override
    public Video getById(Long id) {
        return videoMapper.selectById(id);
    }

    @Override
    public int update(Video video) {
        return videoMapper.updateById(video);
    }

    @Override
    public int insert(Video video) {
        return videoMapper.insert(video);
    }

    @Override
    public List<Video> queryVideoNearDay() {
        return videoMapper.queryVideoNearDay();
    }

    @Override
    public List<Video> queryVideoHot() {
        return videoMapper.queryVideoHot();
    }

    @Override
    public List<Video> queryVideoByType(Long id,Long typeid) {
        return videoMapper.queryVideoByType(id,typeid);
    }

    @Override
    public List<Video> getExamine(String startTime, String endTime, String uploader, String title) {
        List<Video> list = videoMapper.getExamine(startTime,endTime,uploader,title);
        return list;
    }

    @Override
    public List<Video> getVideolist(String startTime, String endTime, String uploader, String title) {
        List<Video> list = videoMapper.getVideolist(startTime,endTime,uploader,title);
        return list;
    }

    @Override
    public Boolean updateStatus(Video video,UpdateWrapper updateWrapper) {
        return videoMapper.update(video,updateWrapper)>-1;
    }

    @Override
    public List<Video> getPass(Long id) {
        return videoMapper.getPass(id);
    }

    @Override
    public List<Video> getAudit(Long id) {
        return videoMapper.getAudit(id);
    }

    @Override
    public List<Video> getFail(Long id) {
        return videoMapper.getFail(id);
    }

    @Override
    public List<Video> searchVideo(String search) {
        return videoMapper.searchVideo(search);
    }

//    @Override
//    public int insert(Video video) {
//        return videoMapper.insert(video);
//    }
//
//    @Override
//    public int update(Video video) {
//        return videoMapper.update(video);
//    }
//
//    @Override
//    public int delete(Video video) {
//        return videoMapper.delete(video);
//    }
//
//    @Override
//    public List<Video> queryVideoByValue(String type, Object value, int num, int begin) {
//        switch(type){
//            case "title":
//                if (value instanceof String) {
//                    String s = (String) value;
//                    return videoMapper.queryVideoByTitle(s,num,begin);
//                }else{
//                    try {
//                        throw new Exception("对象类型错误");
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//
//            case "type":
//                if (value instanceof String) {
//                    String s = (String) value;
//                    String videoType = s.substring(0, s.indexOf("&") - 1);
//                    String title = s.substring(s.indexOf("&"));
//                    return videoMapper.queryVideoByTitleAndType(title,videoType,num,begin);
//                }else{
//                    try {
//                        throw new Exception("对象类型错误");
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//
//            case "uploader":
//                if (value instanceof String) {
//                    String s = (String) value;
//                    return  videoMapper.queryVideoByUploader(s,num,begin);
//                }else {
//                    try {
//                        throw new Exception("对象类型错误");
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }
//                }
//              //将默认情况添加try、catch
//            default:
//                return videoMapper.queryVideoByTitle((String) value,num,begin);
//        }
//    }
//
//    @Override
//    public Video queryVideoById(String id) {
//        return videoMapper.selectById(id);
//    }
//
//    @Override
//    public Long getCounts(String title) {
//        return videoMapper.getCounts(title);
//    }
//
//    @Override
//    public Page<Video> page(String type, Object value, int pageNo, int pageSize) {
//        Page<Video> page = new Page<Video>();
//        // 设置每页显示的数量
//        page.setPageSize(pageSize);
//        // 求总记录数
//        Integer pageTotalCount;
//            pageTotalCount= videoMapper.getCounts(value.toString()).intValue();
//        // 设置总记录数
//        page.setPageTotalCount(pageTotalCount);
//        // 求总页码
//        Integer pageTotal = pageTotalCount / pageSize;
//        if (pageTotalCount % pageSize > 0) {
//            pageTotal+=1;
//        }
//        // 设置总页码
//        page.setPageTotal(pageTotal);
//        // 设置当前页码
//        page.setPageNo(pageNo);
//        // 求当前页数据的开始索引
//        int begin = (page.getPageNo() - 1) * pageSize;
//        System.out.println("begin:"+begin+" pageTotal:"+pageTotal+" totalcount:"+pageTotalCount);
//        // 求当前页数据
//        List<Video> items = queryVideoByValue(type,value,begin,pageSize);
//        System.out.println("type"+type+" value:"+value);
//        System.out.println(items);
//        // 设置当前页数据
//        page.setItems(items);
//        return page;
//    }
//
//    @Override
//    public List<Video> queryPersonalVideo(Long uploadId) {
//        return videoMapper.queryPersonalVideo(uploadId);
//    }
//
//    @Override
//    public Page<Video> queryVideoNearXDay(String days, int pageNo, int pageSize) {
//        Page<Video> page = new Page<Video>();
//        // 设置每页显示的数量
//        page.setPageSize(pageSize);
//        // 求总记录数
//        Integer pageTotalCount = videoMapper.getCounts("").intValue();
//        // 设置总记录数
//        page.setPageTotalCount(pageTotalCount);
//        // 求总页码
//        Integer pageTotal = pageTotalCount / pageSize;
//        if (pageTotalCount % pageSize > 0) {
//            pageTotal+=1;
//        }
//        // 设置总页码
//        page.setPageTotal(pageTotal);
//        // 设置当前页码
//        page.setPageNo(pageNo);
//        // 求当前页数据的开始索引
//        int begin = (page.getPageNo() - 1) * pageSize;
//        System.out.println("begin:"+begin+" pageTotal:"+pageTotal+" totalcount:"+pageTotalCount);
//        // 求当前页数据
//        List<Video> items =videoMapper.queryVideoNearXDay(days, pageNo, pageSize);
//        System.out.println(items.get(items.size()-1));
//        // 设置当前页数据
//        page.setItems(items);
//        return page;
//    }
//
//    @Override
//    public Page<Video> queryVideoOverthousandviews(int pageNo, int pageSize) {
//        Page<Video> page = new Page<Video>();
//        // 设置每页显示的数量
//        page.setPageSize(pageSize);
//        // 求总记录数
//        Integer pageTotalCount = videoMapper.getCounts("").intValue();
//        // 设置总记录数
//        page.setPageTotalCount(pageTotalCount);
//        // 求总页码
//        Integer pageTotal = pageTotalCount / pageSize;
//        if (pageTotalCount % pageSize > 0) {
//            pageTotal+=1;
//        }
//        // 设置总页码
//        page.setPageTotal(pageTotal);
//        // 设置当前页码
//        page.setPageNo(pageNo);
//        // 求当前页数据的开始索引
//        int begin = (page.getPageNo() - 1) * pageSize;
//        System.out.println("begin:"+begin+" pageTotal:"+pageTotal+" totalcount:"+pageTotalCount);
//        // 求当前页数据
//        List<Video> items = videoMapper.queryVideoOverthousandviews(begin,pageSize);
//        System.out.println(items.get(items.size()-1));
//        // 设置当前页数据
//        page.setItems(items);
//        return page;
//    }
//
//    @Override
//    public Page<Video> queryVipVideo(int pageNo, int pageSize) {
//        Page<Video> page = new Page<Video>();
//        // 设置每页显示的数量
//        page.setPageSize(pageSize);
//        // 求总记录数
//        Integer pageTotalCount = videoMapper.getCounts("").intValue();
//        // 设置总记录数
//        page.setPageTotalCount(pageTotalCount);
//        // 求总页码
//        Integer pageTotal = pageTotalCount / pageSize;
//        if (pageTotalCount % pageSize > 0) {
//            pageTotal+=1;
//        }
//        // 设置总页码
//        page.setPageTotal(pageTotal);
//        // 设置当前页码
//        page.setPageNo(pageNo);
//        // 求当前页数据的开始索引
//        int begin = (page.getPageNo() - 1) * pageSize;
//        System.out.println("begin:"+begin+" pageTotal:"+pageTotal+" totalcount:"+pageTotalCount);
//        // 求当前页数据
//        List<Video> items = videoMapper.queryVideoOverthousandviews(begin,pageSize);
//        System.out.println(items.get(items.size()-1));
//        // 设置当前页数据
//        page.setItems(items);
//        return page;
//    }
//
//    @Override
//    public List<Video> queryManagerVideo() {
//        return videoMapper.queryManagerVideo();
//    }
//
//    @Override
//    public List<Video> queryUserVideo() {
//        return videoMapper.queryUserVideo();
//    }
//
//    @Override
//    public List<Video> queryReviewVideo() {
//        return videoMapper.queryReviewVideo();
//    }
}
