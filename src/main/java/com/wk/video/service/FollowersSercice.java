package com.wk.video.service;

import com.wk.video.bean.Followers;

public interface FollowersSercice extends BaseService<Followers> {

    int delete(Long id);

    int deleteByid(Long userid,Long followers);

    int getCount(Long userid,Long followers);
}
