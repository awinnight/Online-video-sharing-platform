package com.wk.video.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wk.video.bean.Video;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoMapper extends BaseMapper<Video> {

    List<Video> queryVideoNearDay();

    List<Video> queryVideoHot();

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


    List<Video> getVideolist(@Param(value = "startTime") String startTime, @Param(value = "endTime") String endTime, @Param(value = "uploader") String uploader, @Param(value = "title") String title);

    List<Video> getPass(Long id);

    List<Video> getAudit(Long id);

    List<Video> getFail(Long id);

    List<Video> searchVideo(String search);
}
