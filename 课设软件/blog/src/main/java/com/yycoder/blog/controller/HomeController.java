package com.yycoder.blog.controller;

import com.yycoder.blog.entity.TbBlog;
import com.yycoder.blog.entity.TbBlogger;
import com.yycoder.blog.entity.TbCategory;
import com.yycoder.blog.service.TbBlogService;
import com.yycoder.blog.service.TbBloggerService;
import com.yycoder.blog.service.TbCategoryService;
import com.yycoder.blog.service.TbCommentService;
import com.yycoder.blog.vo.BlogDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.HashMap;
import java.util.List;


@Controller
@RequestMapping("/blogHome")
public class HomeController {

    @Autowired
    private TbBlogService tbBlogService;

    @Autowired
    private TbBloggerService tbBloggerService;

    @Autowired
    private TbCategoryService tbCategoryService;

    @Autowired
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

    @RequestMapping("/toContentByType/{id}")
    public String toContentByType(@PathVariable Integer id, Model model ){
        TbBlog tbBlog = tbBlogService.queryBlog(id);
        tbBlog.setBlogCount(tbBlog.getBlogCount()+1);
        tbBlogService.updateBlog(tbBlog);
        HashMap<String,Object> map = new HashMap<>();
        List<BlogDetailVo> blogList = tbBlogService.queryAllBlogByTypeId(id);
        for(BlogDetailVo b:blogList){
            map.put(b.getBlogId()+"",tbCommentService.getCommentCount(b.getBlogId()));
        }
        model.addAttribute("countList",map);
        model.addAttribute("blogList",blogList);

        if (blogList.isEmpty()){
            return "blank";
        }
        return "content";
    }

}
