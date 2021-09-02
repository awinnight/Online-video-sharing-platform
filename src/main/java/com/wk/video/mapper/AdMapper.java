package com.wk.video.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wk.video.bean.Ad;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdMapper extends BaseMapper<Ad> {

    List<Ad> selectAuditByOrderId(Long orderid);

    Ad auditview(Long orderid);

    List<Ad> getAllAd(@Param(value = "name") String name, @Param(value = "url") String url);
}
