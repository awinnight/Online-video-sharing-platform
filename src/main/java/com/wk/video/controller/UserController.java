package com.wk.video.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wk.video.bean.Followers;
import com.wk.video.bean.User;
import com.wk.video.service.FollowersSercice;
import com.wk.video.service.UserService;
import com.wk.video.util.Result;
import com.wk.video.util.ResultEnum;
import com.wk.video.util.ResultUtils;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

/**
 * @Author: WuKai
 * @Description:
 * @Date: 2021-03-20 18:27
 **/
@RestController
@RequestMapping("/user")
@Log4j2
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    FollowersSercice followersSercice;

    /**
     * 登录
     *
     * @return
     */
    @RequestMapping("/Login")
    public Result login(User user, HttpSession session, HttpServletResponse response, int code) {
        log.info("执行请求{/login}");
        Result result = null;
        //添加用户认证信息
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(
                user.getUserName(),
                user.getPassWord()
        );
        //1 创建Cookie 对象
        Cookie cookie = new Cookie("userName", null);
        cookie.setMaxAge(60 * 60 * 48);
        try {
            subject.login(usernamePasswordToken);
            //需要在查询一次，否则这个user只有用户名和密码。
            user = userService.getUserAllByUname(user.getUserName());
            if ((user.getRoleId() == 1 && code == 1) || (user.getRoleId() != 1 && code == 2)) {
                //subject.login() 会执行 CustomRealm中的doGetAuthenticationInfo
                if (!"1".equals(user.getStatus())) {
                    result = ResultUtils.error(ResultEnum.LOGIN_FAILS.getCode(), ResultEnum.LOGIN_FAILS.getMsg());
                    return result;
                }
                result = ResultUtils.success();
                cookie.setValue(user.getUserName());
                session.setAttribute("login_user", user);
            } else {
                result = ResultUtils.error(ResultEnum.LOGIN_FAILS.getCode(), ResultEnum.LOGIN_FAILS.getMsg());
            }
        } catch (AuthenticationException e) {
            e.printStackTrace();
            result = ResultUtils.error(ResultEnum.LOGIN_FAILS.getCode(), ResultEnum.LOGIN_FAILS.getMsg());
        } catch (AuthorizationException e) {
            e.printStackTrace();
            result = ResultUtils.error(3, "没有权限");
        } finally {
            //2 通知客户端保存Cookie
            response.addCookie(cookie);
        }
        return result;
    }

    /**
     * 验证用户名是否可用
     *
     * @param username
     * @return
     */
    @RequestMapping("/existsUsername")
    public Result existsUsername(@RequestParam("username") String username) {
        log.info("执行请求{/existsUsername}");
        Result result = null;
        int count = userService.isNameExisted(username);
        if (count < 1) {
            result = ResultUtils.success();
        } else {
            result = ResultUtils.error(ResultEnum.USER_IS_EXISTS.getCode(), "用户名已存在");
        }
        return result;
    }

    /**
     * 验证邮箱是否已被注册
     *
     * @param email
     * @return
     */
    @RequestMapping("/existsEmail")
    public Result existsEmail(@RequestParam("email") String email) {
        log.info("执行请求{/existsemail}");
        Result result = null;
        int count = userService.isEmailExisted(email);
        if (count < 1) {
            result = ResultUtils.success();
        } else {
            result = ResultUtils.error(ResultEnum.USER_IS_EXISTS.getCode(), "邮箱已被注册");
        }
        return result;
    }

    /**
     * 注册
     *
     * @param user
     * @param code
     * @param session
     * @return
     */
    @RequestMapping("/signup")
    public Result signup(User user, String code, HttpSession session) {
        log.info("执行请求{/signup}");
        Result result = null;
        // 获取Session 中的验证码
        String token = (String) session.getAttribute("code");
        // 删除 Session 中的验证码
        session.removeAttribute("code");
        if (token != null && token.equalsIgnoreCase(code)) {
            user.setRoleId(1L);
            user.setStatus("1");
            if (userService.insert(user) > 0) {
                result = ResultUtils.success();
            } else {
                result = ResultUtils.error(ResultEnum.ERROR.getCode(), "注册失败");
            }
        } else {
            result = ResultUtils.error(ResultEnum.CODE_ERROR.getCode(), ResultEnum.CODE_ERROR.getMsg());
        }
        return result;
    }

    /**
     * 用户编辑
     *
     * @param user
     * @param flag
     * @param session
     * @return
     */
    @RequestMapping("/update")
    public Result update(User user, int flag, HttpSession session) {
        log.info("执行请求{/update}");
        Result result = null;
        // 获取Session 中的验证码
        User loginUser = (User) session.getAttribute("login_user");
        if (flag == 0) {
            loginUser.setUserName(user.getUserName());
            loginUser.setEmail(user.getEmail());
            loginUser.setNickName(user.getNickName());
            loginUser.setSign(user.getSign());
        } else {
            loginUser.setPassWord(user.getPassWord());
        }
        userService.update(loginUser);
        result = ResultUtils.success();
        return result;
    }

    /**
     * 后台获取用户信息
     *
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/get_Users")
    public Result getUsers(Integer current, Integer size, String email, String userName, String nickName) {

        if (email != null && email.trim().equals("")) {
            email = null;
        }
        if (userName != null && userName.trim().equals("")) {
            userName = null;
        }
        if (nickName != null && nickName.trim().equals("")) {
            nickName = null;
        }
        PageHelper.startPage(current, size);
        PageInfo<User> pageInfo = new PageInfo<User>(userService.getUsers(email, userName, nickName));
        Result result = ResultUtils.success(pageInfo.getList());
        result.setCode(0);
        result.setCount((int) pageInfo.getTotal());
        return result;
    }

    /**
     * 后台获取管理员信息
     *
     * @param current
     * @param size
     * @return
     */
    @RequestMapping("/get_ManagerUsers")
    public Result getManagerUsers(Integer current, Integer size, String email, String userName, String nickName, HttpSession session) {
        User user = (User) session.getAttribute("login_user");

        if (email != null && email.trim().equals("")) {
            email = null;
        }
        if (userName != null && userName.trim().equals("")) {
            userName = null;
        }
        if (nickName != null && nickName.trim().equals("")) {
            nickName = null;
        }
        PageHelper.startPage(current, size);
        PageInfo<User> pageInfo = new PageInfo<User>(userService.getManagerUsers(email, userName, nickName, user.getId()));
        Result result = ResultUtils.success(pageInfo.getList());
        result.setCode(0);
        result.setCount((int) pageInfo.getTotal());
        return result;
    }

    /**
     * 注册管理员
     *
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/addManger")
    public Result addManger(User user, HttpSession session) {
        log.info("执行请求{user/addManger}，注册管理员");
        Result result = null;
        user.setRoleId(2L);
        user.setStatus("1");
        if (userService.insert(user) > 0) {
            result = ResultUtils.success();
        } else {
            result = ResultUtils.error(ResultEnum.ERROR.getCode(), "注册失败");
        }
        return result;
    }

    /**
     * 编辑管理员
     *
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/editManger")
    public Result editManger(User user, HttpSession session) {
        log.info("执行请求{user/editManger}，编辑管理员");
        Result result = null;
        if (userService.update(user) > 0) {
            result = ResultUtils.success();
        } else {
            result = ResultUtils.error(ResultEnum.ERROR.getCode(), "编辑失败");
        }
        return result;
    }

    /**
     * 封禁/解封
     * @param id
     * @return
     */
    @RequestMapping("/managerStatus")
    public Result updateUserStatus(Long id) {
        log.info("执行请求{user/managerStatus}，封禁/解封");
        User user = userService.getById(id);
        if (userService.updateUserStatus(user)) {
            return ResultUtils.success();
        } else {
            return ResultUtils.error(-1, "封禁用户失败");
        }
    }

    /**
     * 关注用户
     * @param id
     * @return
     */
    @RequestMapping("/followUser")
    public Result folowUser(Long userid,HttpSession session) {
        User user = (User) session.getAttribute("login_user");
        Result result = ResultUtils.success();
        log.info("执行请求{user/folowUser}，关注用户");
        if (followersSercice.getCount(user.getId(),userid) > 0) {
            followersSercice.deleteByid(user.getId(),userid);
            result.setCode(0);
        } else {
            followersSercice.insert(new Followers(null, user.getId(), userid));
            result.setCode(1);
        }
        return result;
    }
}
