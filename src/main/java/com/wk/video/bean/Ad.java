package com.wk.video.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "ad")
public class Ad {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField(value = "type")
    private String type;

    @TableField(value = "coverUrl")
    private String coverUrl;

    @TableField(value = "url")
    private String url;

    @TableField(value = "name")
    private String name;

    @TableField(value = "status")
    private String status;
}
