package com.yycoder.blog;

import com.yycoder.blog.dao.TbBlogMapper;
import com.yycoder.blog.dao.TbBloggerMapper;
import com.yycoder.blog.dao.TbCommentMapper;
import com.yycoder.blog.entity.TbCategory;
import com.yycoder.blog.entity.TbComment;
import com.yycoder.blog.service.TbCategoryService;
import com.yycoder.blog.service.TbCommentService;
import com.yycoder.blog.vo.BlogDetailVo;
import com.yycoder.blog.vo.CommentsVo;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.List;

@SpringBootTest
@MapperScan("com.yycoder.blog.dao")
class BlogApplicationTests {

    @Autowired
    private TbBlogMapper tbBlogMapper;

    @Autowired
    private TbCommentService tbCommentService;
    @Autowired
    private TbCategoryService tbCategoryService;
    @Test
    void testComment(){
        TbComment tbComment=new TbComment();
        tbComment.setBlogId(2);
        tbComment.setCommentTime(new Date());
        tbComment.setUserId(4);
        tbComment.setCommentContent("-------测试评论--------");
        Integer comment = tbCommentService.addComment(tbComment);
        List<CommentsVo> commentsList = tbCommentService.getCommentsList(2);
        System.out.println(commentsList.get(commentsList.size()-1));//获取最新评论
        Assert.assertFalse("评论成功",comment==1);
    }
    @Test
    void testGetBlogById(){
        //测试博客里按id获取内容
        BlogDetailVo detailVo = tbBlogMapper.queryBlogById(1);
        System.out.println(detailVo);//打印结果
        Assert.assertNotNull(detailVo);//如果返回的detail不为空，无报错信息
        //假定我们预期detail为空，返回的detail不为空，打印报错消息
        Assert.assertTrue("返回的结果不为空",detailVo==null);
    }
    @Test
    void testBlogSearch(){
        //测试博客里的
        List<BlogDetailVo> detailVoList = tbBlogMapper.queryAllBlogByTitle("%spring%");
        for (BlogDetailVo blogDetailVo:detailVoList){
            Assert.assertNull(blogDetailVo);//如果blogDetailVo不为空，报错消息
        }
    }
    @Test
    void testGetCategoryList() {
        List<TbCategory> categoryList = tbCategoryService.selectAll();
        for (TbCategory tbCategory:categoryList){
            System.out.println(tbCategory);
        }
        Assert.assertTrue("查询结果为空",categoryList!=null);
    }
}
