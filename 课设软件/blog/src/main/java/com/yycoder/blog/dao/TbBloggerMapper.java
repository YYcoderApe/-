package com.yycoder.blog.dao;

import com.yycoder.blog.entity.TbBlogger;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
public interface TbBloggerMapper extends BaseMapper<TbBlogger>{

//    //博主登录.(根据用户名进行查询记录)
//    TbBlogger bloggerLogin(@Param("bloggerName") String bloggerName);
//
//    //查询博主信息
//    TbBlogger selectAll();
}