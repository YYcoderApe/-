package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbTagMapper;
import com.yycoder.blog.entity.TbTag;
import com.yycoder.blog.service.TbTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbTagServiceImpl implements TbTagService {

    @Autowired
    private TbTagMapper tbTagMapper;


    @Override
    public List<TbTag> queryAllTag() {
        return tbTagMapper.queryAllTag();
    }

    @Override
    public List<TbTag> queryAllTagByBlogId(Integer blogId) {
        return tbTagMapper.queryAllTagByBlogId(blogId);
    }

    @Override
    public Integer addTag(TbTag tag) {
        return tbTagMapper.insert(tag);
    }
    @Override
    public TbTag queryById(Integer id) {
        return tbTagMapper.selectByPrimaryKey(id);
    }
    @Override
    public Integer updateTag(TbTag tag) {
        return tbTagMapper.updateByPrimaryKey(tag);
    }
    @Override
    public Integer deleteTagById(Integer id) {
        return tbTagMapper.deleteByPrimaryKey(id);
    }






}
