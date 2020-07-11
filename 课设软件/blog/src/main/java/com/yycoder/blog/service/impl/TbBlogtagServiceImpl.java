package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbBlogtagMapper;
import com.yycoder.blog.entity.TbBlogtag;
import com.yycoder.blog.service.TbBlogtagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TbBlogtagServiceImpl implements TbBlogtagService {

    @Autowired
    private TbBlogtagMapper tbBlogtagMapper;
    @Override
    public Integer addBlogTag(TbBlogtag tbBlogtag) {
        return tbBlogtagMapper.insert(tbBlogtag);
    }

    @Override
    public Integer deleteBlogTag(Integer blogId) {
        return tbBlogtagMapper.deleteBlogtagByBolgId(blogId);
    }


}
