package com.wk.video.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "video")
public class Video {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField(value = "uploader")
    private Long uploader;

    @TableField(value = "title")
    private String title;

    @TableField(value = "descr")
    private String descr;

    @TableField(value = "typeId")
    private Long typeId;

    @TableField(value = "views")
    private Integer views;

    @TableField(value = "coverUrl")
    private String coverUrl;

    @TableField(value = "videoUrl")
    private String videoUrl;

    @TableField(value = "status")
    private String status;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "createtime")
    private Date createTime;

    @TableField(exist = false)
    private String nickName;
    @TableField(exist = false)
    private String userName;
    @TableField(exist = false)
    private String type;
    @TableField(exist = false)
    private String time;

    public Video(Long id, Long uploader, String title, String desc, Long typeId, Integer views, String coverUrl, String videoUrl, String status, Date createTime) {
        this.id = id;
        this.uploader = uploader;
        this.title = title;
        this.descr = desc;
        this.typeId = typeId;
        this.views = views;
        this.coverUrl = coverUrl;
        this.videoUrl = videoUrl;
        this.status = status;
        this.createTime = createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        setTime(format.format(createTime));
    }
}
