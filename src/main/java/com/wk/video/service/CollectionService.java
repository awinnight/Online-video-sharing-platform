package com.wk.video.service;

import com.wk.video.bean.Collections;

import java.util.List;

public interface CollectionService extends BaseService<Collections>{

    List<Collections> queryCollection(Long id);

    int deleteCollection(Long id);

    int deleteAllCollection(Long id);

    int getCount(Long userid,Long videoid);

    int delete(Long userid,Long videoid);
}
