package com.yycoder.blog.service;

import com.yycoder.blog.entity.TbTag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TbTagService {
    List<TbTag> queryAllTag();

    List<TbTag> queryAllTagByBlogId(Integer blogId);
}
