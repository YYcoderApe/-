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
        if(tbBlogger!=null && bloggerPassword.equals(tbBlogger.getBloggerPassword())){
            System.out.println("-------------");
            return tbBlogger;
        }
        return null;

    }

    @Override
    public TbBlogger selectAll() {
        return tbBloggerMapper.selectAll();
    }

    @Override
    public Integer updateBloggerInfo(TbBlogger tbBlogger) {
        TbBlogger blogger = tbBloggerMapper.selectAll();
        tbBloggerMapper.updateByPrimaryKey(tbBlogger);
        System.out.println(blogger.getBloggerName()+blogger.getBloggerIntrouductin());
        return tbBloggerMapper.updateByPrimaryKey(tbBlogger);
    }
}