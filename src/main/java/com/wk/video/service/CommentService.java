package com.wk.video.service;

import com.wk.video.bean.Comment;

public interface CommentService extends BaseService<Comment>{

    int delete(Long id);

}
