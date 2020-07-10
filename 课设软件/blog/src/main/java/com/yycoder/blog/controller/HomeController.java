package com.yycoder.blog.controller;

import com.yycoder.blog.entity.TbBlogger;
import com.yycoder.blog.entity.TbCategory;
import com.yycoder.blog.service.TbBlogService;
import com.yycoder.blog.service.TbBloggerService;
import com.yycoder.blog.service.TbCategoryService;
import com.yycoder.blog.service.TbCommentService;
import com.yycoder.blog.vo.BlogDetailVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/blogHome")
public class HomeController {
    @Resource
    private TbBlogService tbBlogService;
    @Resource
    private TbBloggerService tbBloggerService;

    @Resource
    private TbCategoryService tbCategoryService;
    @Resource
    private TbCommentService tbCommentService;
    @RequestMapping("/search")
    public String search(@RequestParam String keyWord, Model model){
        keyWord="%"+keyWord+"%";
        List<BlogDetailVo> detailVoList = tbBlogService.queryAllBlogByTitle(keyWord);
        model.addAttribute("blogList",detailVoList);
        HashMap<String,Object> map = new HashMap<>();
        for(BlogDetailVo b:detailVoList){
            map.put(b.getBlogId()+"",tbCommentService.getCommentCount(b.getBlogId()));
        }
        model.addAttribute("countList",map);
        if (detailVoList.isEmpty()){
            return "blank";
        }
        return "content";
    }
    @RequestMapping("/home")
    public String home(Model model){
        TbBlogger blogger = tbBloggerService.selectAll();
        model.addAttribute("blogger", blogger);
        List<TbCategory> categoryList = tbCategoryService.selectAll();
        model.addAttribute("categoryList",categoryList);
        return "home";
    }

    @RequestMapping("/toContent")
    public String toContent(Model model){
        List<BlogDetailVo> tbBlogList = tbBlogService.queryAllBlog();
        model.addAttribute("blogList",tbBlogList);
        HashMap<String,Object> map = new HashMap<>();
        for(BlogDetailVo b:tbBlogList){
            map.put(b.getBlogId()+"",tbCommentService.getCommentCount(b.getBlogId()));
        }
        model.addAttribute("countList",map);
        return "content";
    }
}
