package com.wk.video.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {

    private Long id;

    private Long userId;

    private String type;

    private Long newId;

    private Long videoId;

    private String content;

    private Long parentId;

    private Date createTime;
}
