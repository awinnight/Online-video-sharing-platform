package com.wk.video.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wk.video.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends BaseMapper<User> {

    User getUserAllByUname(String uname);

    List<User> getUsers(@Param(value = "email") String email, @Param(value = "userName") String userName, @Param(value = "nickName") String nickName);

    List<User> getManagerUsers(@Param(value = "email") String email, @Param(value = "userName") String userName, @Param(value = "nickName") String nickName, @Param(value = "id") Long id);
}
