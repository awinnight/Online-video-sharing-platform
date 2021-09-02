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
@TableName(value = "user")
public class User {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField(value = "username")
    private String userName;

    @TableField(value = "nickname")
    private String nickName;

    @TableField(value = "password")
    private String passWord;

    private String email;

    @TableField(value = "roleid")
    private Long roleId;

    private String sign;

    private String status;

    @TableField(exist = false)
    private Role role;
    @TableField(exist = false)
    private String rolename;
}
