package com.yycoder.blog.dao;

public interface BaseMapper<T> {
    int deleteByPrimaryKey(Integer id);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Integer Id);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);
}
