package com.yycoder.blog.service.impl;

import com.yycoder.blog.dao.TbBlogMapper;
import com.yycoder.blog.dao.TbTagMapper;
import com.yycoder.blog.service.TbBlogService;
import com.yycoder.blog.vo.BlogDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbBlogServiceImpl implements TbBlogService {
    @Autowired(required = true)
    private TbBlogMapper tbBlogMapper;
    @Autowired
    private TbTagMapper tbTagMapper;

    @Override
    public List<BlogDetailVo> queryAllBlogByTitle(String keyWord) {
        List<BlogDetailVo> list=tbBlogMapper.queryAllBlogByTitle(keyWord);
        for(BlogDetailVo bd:list){
            bd.setTagList(tbTagMapper.queryAllTagByBlogId(bd.getBlogId()));
        }
        return list;
    }

    @Override
    public List<BlogDetailVo> queryAllBlog() {
        List<BlogDetailVo> list=tbBlogMapper.queryAllBlog();
        for(int i=0;i<list.size();i++){
            list.get(i).setTagList(tbTagMapper.queryAllTagByBlogId(list.get(i).getBlogId()));
        }
        return tbBlogMapper.queryAllBlog();
    }
}
