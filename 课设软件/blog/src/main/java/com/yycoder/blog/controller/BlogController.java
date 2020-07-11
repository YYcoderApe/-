package com.yycoder.blog.controller;

import com.yycoder.blog.entity.TbBlog;
import com.yycoder.blog.entity.TbBlogtag;
import com.yycoder.blog.entity.TbCategory;
import com.yycoder.blog.entity.TbTag;
import com.yycoder.blog.service.TbBlogService;
import com.yycoder.blog.service.TbBlogtagService;
import com.yycoder.blog.service.TbCategoryService;
import com.yycoder.blog.service.TbTagService;
import com.yycoder.blog.vo.BlogDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class BlogController {

    @Autowired
    private TbBlogService tbBlogService;

    @Autowired
    private TbCategoryService tbCategoryService;

    @Autowired
    private TbTagService tbTagService;

    @Autowired
    private TbBlogtagService tbBlogtagService;

    @RequestMapping("/toWriteBlog")
    public String toWriteBlog(Model model){
        List<TbCategory> tbCategoryList = tbCategoryService.selectAll();
        model.addAttribute("tbCategoryList",tbCategoryList);
        List<TbTag> tagList = tbTagService.queryAllTag();
        model.addAttribute("tagList",tagList);
        return "writeBlog";
    }
    @RequestMapping("/writeBlog")
    public String writeBlog(TbBlog tbBlog, @RequestParam Integer tagId){
        tbBlog.setBlogCount(0);
        tbBlog.setBlogTime(new Date());

        tbBlogService.addBlog(tbBlog);

        TbBlogtag tbBlogtag=new TbBlogtag();
        tbBlogtag.setBlogId( tbBlogService.queryAllBlog().get(0).getBlogId());
        tbBlogtag.setTagId(tagId);
        tbBlogtag.setBlogTagTime(new Date());
        tbBlogtagService.addBlogTag(tbBlogtag);
        System.out.println(tbBlogtag);
        return "background";
    }

    @RequestMapping("/saveWriteBlog")
    public String saveWriteBlog(TbBlog tbblog){
        tbblog.setBlogTime(new Date());
        tbBlogService.addBlog(tbblog);
        return "background";
    }

    @RequestMapping("/toReWriteBlog/{id}")
    public String toReWriteBlog(@PathVariable int id, Model model){
        BlogDetailVo blog = tbBlogService.queryBlogById(id);
        model.addAttribute("blog",blog);
        List<TbCategory> tbCategoryList = tbCategoryService.selectAll();
        model.addAttribute("tbCategoryList",tbCategoryList);
        List<TbTag> tagList = tbTagService.queryAllTag();
        model.addAttribute("tagList",tagList);
        return "reWriteBlog";
    }

    @RequestMapping("/reWriteBlog")
    public String reWriteBlog(TbBlog blog){
        blog.setBlogCount(0);
        blog.setBlogTime(new Date());
        tbBlogService.updateBlog(blog);
        return "background";
    }


    @RequestMapping("/blogManger")
    public String toBlogManger(Model model){
        List<BlogDetailVo> blogList = tbBlogService.queryAllBlog();
        model.addAttribute("blogList",blogList);
        HashMap<String,Object> map = new HashMap<>();
        for(BlogDetailVo b:blogList){
            map.put(b.getBlogId()+"",tbTagService.queryAllTagByBlogId(b.getBlogId()));
        }
        model.addAttribute("tagList",map);
        return "blogManger";
    }

    @RequestMapping("/delBlog/{id}")
    public String delBlog(@PathVariable("id") int id) {
        BlogDetailVo blogDetailVo = tbBlogService.queryBlogById(id);
        tbBlogtagService.deleteBlogTag(blogDetailVo.getBlogId());
        tbBlogService.deleteBlog(id);
        return "redirect:/blogManger";
    }

}
