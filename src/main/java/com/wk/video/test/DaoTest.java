package com.wk.video.test;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wk.video.bean.User;
import com.wk.video.bean.Video;
import com.wk.video.mapper.UserMapper;
import com.wk.video.service.UserService;
import com.wk.video.service.VideoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest
@RunWith(SpringRunner.class)
public class DaoTest {
    @Autowired
    UserService userService;
    @Autowired
    UserMapper userMapper;
    @Autowired
    VideoService videoService;

    @Test
    public void userTest(){
        int count = userService.isUserExisted("admin");
        System.out.println(count);
    }

    @Test
    public void userTest2(){
        User user = userService.getById(2L);
        user.setSign("111");
        userService.update(user);
        System.out.println(user);
    }

    @Test
    public void userTest3(){
        //1.引入分页插件,pageNum是第几页，pageSize是每页显示多少条,默认查询总数count
        PageHelper.startPage(1,8);
        List<Video> list = videoService.queryVideoNearDay();
        System.out.println(list);
        //3.使用PageInfo包装查询后的结果,5是连续显示的条数,结果list类型是Page<E>
        PageInfo<Video> pageInfo = new PageInfo<Video>(list,8);
        System.out.println(pageInfo);
        PageHelper.clearPage();
    }
}
