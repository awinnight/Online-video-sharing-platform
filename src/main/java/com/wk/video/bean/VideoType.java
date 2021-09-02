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
@TableName(value = "videotype")
public class VideoType {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField(value = "typeA")
    private String typeA;

    @TableField(value = "typeB")
    private String typeB;

    @TableField(value = "status")
    private String status;
}
