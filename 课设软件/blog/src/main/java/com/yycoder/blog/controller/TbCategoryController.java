package com.yycoder.blog.controller;

import com.yycoder.blog.entity.TbCategory;
import com.yycoder.blog.service.TbCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Controller
public class TbCategoryController {
    @Autowired
    private TbCategoryService tbCategoryService;

    @RequestMapping("/category")
    public String list(Model model) {
        List<TbCategory> tbCategoryList = tbCategoryService.selectAll();
        model.addAttribute("tbCategoryList", tbCategoryList);
        return "category";
    }

    @RequestMapping("/toAddCategory")
    public String toAddCategory(Model model) {
        return "categoryAdd";
    }

    @RequestMapping("/addCategory")
    public String addCategory(TbCategory category) {
        category.setCategoryTime(new Date());
        category.setCategoryState(1);
        tbCategoryService.addCategory(category);
        return "redirect:/category";
    }

    @RequestMapping("/delCategory/{id}")
    public String deleteCategory(@PathVariable("id") int id) {

        tbCategoryService.deleteCategory(id);
        return "redirect:/category";
    }

    @RequestMapping("/toUpdateCategory/{id}")
    public String toUpdateCategory(Model model, @PathVariable("id") int id) {
        model.addAttribute("category",tbCategoryService.selectById(id));
        return "categoryUpdate";
    }

    @RequestMapping("/updateCategory")
    public String updateCategory(Model model, TbCategory tbCategory) {
        tbCategoryService.updateCategory(tbCategory);
        tbCategory = tbCategoryService.selectById(tbCategory.getCategoryId());
        model.addAttribute("category", tbCategory);
        return "redirect:/category";
    }
}



