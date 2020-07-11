package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbBloggerMapper;
import com.yycoder.blog.entity.TbBlogger;
import com.yycoder.blog.service.TbBloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TbBloggerServiceImpl implements TbBloggerService {

    @Autowired
    private TbBloggerMapper tbBloggerMapper;

    @Override
    public TbBlogger login(String bloggerName, String bloggerPassword) {
        TbBlogger tbBlogger = tbBloggerMapper.bloggerLogin(bloggerName);
        if(tbBlogger!=null &&(tbBlogger.getBloggerPassword().equals(bloggerPassword))){
            return tbBlogger;
        }
        return null;

    }

    @Override
    public TbBlogger selectAll() {
        return tbBloggerMapper.selectAll();
    }

}