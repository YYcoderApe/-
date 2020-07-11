package com.yycoder.blog.controller;

import com.yycoder.blog.entity.TbTag;
import com.yycoder.blog.service.TbTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class TbTagController {

    @Autowired
    private TbTagService tbTagService;

    //获得标签列表
    @RequestMapping("/blogTag")
    public String list(Model model) {
        List<TbTag> list = tbTagService.queryAllTag();

        model.addAttribute("tagList", list);
        return "blogTag";
    }
    @RequestMapping("/toAddBlogTag")
    public String toAddBlogType(Model model) {
        return "blogTagAdd";
    }

    @RequestMapping("/addBlogTag")
    public String addTag(TbTag tag) {
        tag.setTagTime(new Date());
        tag.setTagState(1);
        tbTagService.addTag(tag);
        return "redirect:/blogTag";
    }
    @RequestMapping("/toUpdateBlogTag/{id}")
    public String toUpdateTag(Model model, @PathVariable("id")int tag_id) {
        TbTag tag = tbTagService.queryById(tag_id);
        model.addAttribute("blogTag",tag);
        return "blogTagUpdate";
    }

    @RequestMapping("/updateBlogTag")
    public String updateBlog_type(Model model, TbTag tag) {
        tag.setTagTime(new Date());
        System.out.println(tag.getTagId()+tag.getTagName());
        tbTagService.updateTag(tag);

        model.addAttribute("blogTag", tag);
        return "redirect:/blogTag";
    }
    @RequestMapping("/delTag/{id}")
    public String deleteTag(@PathVariable("id") int id) {
        tbTagService.deleteTagById(id);
        return "redirect:/blogTag";
    }



}
