package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbCommentMapper;
import com.yycoder.blog.service.TbCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TbCommetServiceImpl implements TbCommentService {
    @Autowired
    private TbCommentMapper tbCommentMapper;
    @Override
    public Integer getCommentCount(Integer blogId) {
        return tbCommentMapper.getCommentCount(blogId);
    }
}
