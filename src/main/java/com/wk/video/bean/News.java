package com.wk.video.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class News {

    private Long id;

    private Long uploader;

    private String content;

    private Date createTime;
}
