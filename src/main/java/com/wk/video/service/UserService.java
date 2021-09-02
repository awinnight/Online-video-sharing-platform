package com.wk.video.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wk.video.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService extends BaseService<User>{

    /**
     * 用户是否存在
     * @param str
     * @return
     */
    int isUserExisted(String str);

    /**
     * 邮箱是否已注册
     * @param email
     * @return
     */
    int isEmailExisted(String email);

    /**
     * 用户名是否存在
     * @param userName
     * @return
     */
    int isNameExisted(String userName);

    /**
     * 更新用户状态 正常/封禁
     *
     * @param user
     * @return
     */
    Boolean updateUserStatus(User user);


    User getUserAllByUname(String uname);

    List<User> getUsers(@Param(value = "email") String email, @Param(value = "userName") String userName, @Param(value = "nickName") String nickName);

    List<User> getManagerUsers(@Param(value = "email") String email, @Param(value = "userName") String userName, @Param(value = "nickName") String nickName, @Param(value = "id") Long id);
}
