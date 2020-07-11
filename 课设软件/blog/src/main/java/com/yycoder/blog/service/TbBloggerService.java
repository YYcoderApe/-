package com.yycoder.blog.service;

import com.yycoder.blog.entity.TbBlogger;

public interface TbBloggerService {
    //查询博主信息
    TbBlogger selectAll();

    TbBlogger login(String bloggerName, String bloggerPassword);

    Integer updateBloggerInfo(TbBlogger tbBlogger);
}
