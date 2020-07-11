package com.yycoder.blog.service;

import com.yycoder.blog.entity.TbCategory;

import java.util.List;

public interface TbCategoryService {
    List<TbCategory> selectAll();

    Integer addCategory(TbCategory category);

    Integer deleteCategory(int id);

    TbCategory selectById(int id);

    Integer updateCategory(TbCategory tbCategory);
}
