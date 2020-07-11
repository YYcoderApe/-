package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbCategoryMapper;
import com.yycoder.blog.entity.TbCategory;
import com.yycoder.blog.service.TbCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbBlogCategoryServiceImpl implements TbCategoryService {

    @Autowired
    private TbCategoryMapper tbCategoryMapper;
    @Override
    public List<TbCategory> selectAll() {
        return tbCategoryMapper.selectAll();
    }
    @Override
    public Integer addCategory(TbCategory tbCategory) {
        return tbCategoryMapper.insert(tbCategory);
    }

    @Override
    public Integer deleteCategory(int id) {
        return tbCategoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Integer updateCategory(TbCategory tbCategory) {
        return tbCategoryMapper.updateByPrimaryKeySelective(tbCategory);
    }

    @Override
    public TbCategory selectById(int id) {
        return tbCategoryMapper.selectByPrimaryKey(id);
    }

}
