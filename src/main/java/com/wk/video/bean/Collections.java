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
@TableName(value = "collection")
public class Collections {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField(value = "userId")
    private Long userId;

    @TableField(value = "videoId")
    private Long videoId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "createTime")
    private Date createTime;

    @TableField(exist = false)
    private Long uploader;

    @TableField(exist = false)
    private String title;

    @TableField(exist = false)
    private String descr;

    @TableField(exist = false)
    private Long typeId;

    @TableField(exist = false)
    private Integer views;

    @TableField(exist = false)
    private String coverUrl;

    @TableField(exist = false)
    private String videoUrl;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false)
    private Date creatTime;

    @TableField(exist = false)
    private String nickName;
    @TableField(exist = false)
    private String time;

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        setTime(format.format(creatTime));
    }

    public Collections(Long userId, Long videoId, Date createTime) {
        this.userId = userId;
        this.videoId = videoId;
        this.createTime = createTime;
    }
}
