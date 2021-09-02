package com.wk.video.service;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.wk.video.bean.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VideoService extends BaseService<Video>{

    /**
     * 查询最新视频
     * @return
     */
    List<Video> queryVideoNearDay();

    /**
     * 查询最热视频
     * @return
     */
    List<Video> queryVideoHot();

    /**
     * 查询同类型视频
     * @param id
     * @return
     */
    List<Video> queryVideoByType(@Param(value = "id")Long id,@Param(value = "typeid")Long typeid);

    /**
     * 查询未审核视频
     * @param startTime
     * @param endTime
     * @param uploader
     * @param title
     * @return
     */
    List<Video> getExamine(@Param(value = "startTime") String startTime, @Param(value = "endTime") String endTime, @Param(value = "uploader") String uploader, @Param(value = "title") String title);

    /**
     * 查询y已审核视频
     * @param startTime
     * @param endTime
     * @param uploader
     * @param title
     * @return
     */
    List<Video> getVideolist(@Param(value = "startTime") String startTime, @Param(value = "endTime") String endTime, @Param(value = "uploader") String uploader, @Param(value = "title") String title);

            /**
             * 更新状态
             * @param video
             * @param updateWrapper
             * @return
             */
    Boolean updateStatus(Video video, UpdateWrapper updateWrapper);

    List<Video> getPass(Long id);

    List<Video> getAudit(Long id);

    List<Video> getFail(Long id);

    List<Video> searchVideo(String search);
//    /**
//     * 新增视频信息
//     * @param video 要操作的视频信息
//     * @return 被影响的行数，返回-1代表添加失败
//     */
//    int insert(Video video);
//
//    /**
//     *  更新视频信息
//     * @param video 要操作的视频
//     * @return 被影响的行数，返回-1代表添加失败
//     */
//    int update(Video video);
//
//    /**
//     *  删除视频（逻辑删除）
//     * @param video 要操作的视频
//     * @return 被影响的行数，返回-1代表添加失败
//     */
//    int delete(Video video);
//
//    /**
//     * 根据不同类别的值查询数据，根据反射实现，待更新方法
//     * @param type 属性类型
//     * @param value 视频标题
//     * @return 被查询到的视频（应改为List）
//     */
//    List<Video> queryVideoByValue(String type, Object value, int num, int begin);
//
//
//    /**
//     * 查询特定的视频（跳转到视频页时使用）
//     * @param id 视频Id
//     * @return 视频
//     */
//    Video queryVideoById(String id);
//    /**
//     * 获取表中的条数
//     * @return 获取表中的条数
//     */
//    Long getCounts(String title);
//
//    Page<Video> page(String type, Object value, int pageNo, int pageSize);
//
//    /**
//     * 查询个人视频
//     * @param uploadId
//     * @return
//     */
//    List<Video> queryPersonalVideo(Long uploadId);
//
//    /**
//     *
//     * @param days
//     * @param begin
//     * @param pageSize
//     * @return
//     */
//    Page<Video> queryVideoNearXDay(String days, int begin, int pageSize);
//
//    /**
//     * 查询播放次数大于1000的视频
//     * @param begin
//     * @param pageSize
//     * @return
//     */
//    Page<Video> queryVideoOverthousandviews(int begin, int pageSize);
//
//    public Page<Video> queryVipVideo(int pageNo, int pageSize);
//
//    /**
//     * 查询管理员视频视频
//     * @param
//     * @return
//     */
//    List<Video> queryManagerVideo();
//
//    /**
//     * 查询用户上传视频
//     * @param
//     * @return
//     */
//    List<Video> queryUserVideo();
//
//    /**
//     * 查询待审核视频
//     * @param
//     * @return
//     */
//    List<Video> queryReviewVideo();
}
