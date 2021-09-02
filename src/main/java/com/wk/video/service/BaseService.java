package com.wk.video.service;

public interface BaseService<T> {

    /**
     * 通过id查询
     * @param id
     * @return
     */
    T getById(Long id);

    /**
     * 更新
     * @param t
     * @return
     */
    int update(T t);

    /**
     * 插入
     * @param t
     * @return
     */
    int insert(T t);
}
