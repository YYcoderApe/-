package com.yycoder.blog.dao;

import com.yycoder.blog.entity.TbUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface TbUserMapper extends BaseMapper<TbUser> {

    //用户登录.(根据用户名进行查询记录)
    TbUser userLogin(@Param("userName") String userName);
}