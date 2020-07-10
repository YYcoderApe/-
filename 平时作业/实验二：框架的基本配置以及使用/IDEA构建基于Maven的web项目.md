

# IDEA构建基于Maven的web项目

## 一、实验目的

1.学习IDEA工具的使用，了解如何创建基于maven的web项目。

2.学习mysql数据库的使用，清楚如何与存储的数据进行交互。

3.学习利用springboot框架快速搭建开发环境，采用maven进行依赖管理，进行web项目开发。

## 二、实验平台

1.操作系统：windows 10，windows 7，windows XP。（以自身操作系统为准）

2.使用软件: 

​		代码编写：IntelliJ IDEA编辑器

​		数据库：MYSQL数据库管理系统

​		建模工具：在线网站draw.io，使用简单，功能齐全

​		文档编写工具：Microsoft office Word 2019

​		项目管理工具：采用maven对项目依赖进行管理

3.开发语言与技术：

​		后台语言开发使用Java语言，前端语言使用html、js、css结合使用，使用了SpringBoot+thymeleaf完成了相关功能的开发，使用MyBatis框架连接数据库进行Sql语句的编写。

## 三、实验前准备

1. 翻阅相关资料，掌握springboot框架的基础知识和使用，采用mvc模式进行开发。
1. 翻阅相关资料，掌握 maven对项目依赖的管理和配置。
1. 翻阅相关资料，掌握 MySQL数据库的基础知识，以及如何使用MyBatis框架进行数据增删改查。
1. 安装必要的软件和开发工具。

## 四、实验内容

### 4.1 IntelliJ IDEA 安装

（1）进入[IntelliJ IDEA 官网](https://www.jetbrains.com/idea/) ，根据自己的操作系统下载相应的安装包.

![idea下载界面](images\IDEA_01.png)

（2）下载之后双击,开始安装,点击next

![idea安装](images\IDEA_02.png)

（3）选择安装路径

![安装路径选择](E:\3117007142-陈悦演-体系结构\平时作业\实验二：框架的基本配置以及使用\images\IDEA_03.png)

（4）选择一些配置属性，添加变量配置到PATH

![配置属性](images\IDEA_04.png)

（5）默认选择JetBrains,点击install

![选择JetBrains](images\IDEA_05.png)

（6）等待安装完毕，勾选启动IDEA，点击finish。

![安装完毕](images\IDEA_06.png)

（7）在进行一个软件激活，插件安装后会出现IDEA的软件界面，视为安装启动成功。

![IDEA界面](images\IDEA_07.png)

### 4.2 MySQL安装

（1）首先去[MySQL官网](http://www.mysql.com)浏览，根据操作系统下载相应版本的MySQL。

![mysql官网](images\mysql_01.png)

（2）双击打开安装包，阅读软件安装许可证  。

![许可声明](\images\mysql_02.png)

（3）点击next进入下一步，选择所要安装的数据库模式

![模式选择](images\mysql_03.png)

（4）next继续进入下一步，选择默认的Config Type即可。

![Config Type](images\mysql_04.png)

（5）配置root用户的密码，还可以添加其他用户。记住所配置的root用户密码.

![配置账号密码](images\mysql_05.png)

（6）然后继续next，选择安装的位置，直到所有都finish。配置好mysql安装的bin目录到电脑环境变量中，输入账号密码后，使用相关指令就可以进入mysql操作界面。

![mysql命令行](images\mysql_06.png)

### 4.3 IDEA创建web项目并编写代码

（1）打开IDEA软件，进入操作界面，点击新建项目。

![新建项目](images\web_01.png)

（2）选择创建一个maven类型的项目，并选择安装好了的JDK。

![创建maven类型](images\web_02.png)

（3）输入组织名称、模块名称、项目版本号等信息

![输入信息](images\web_03.png)

（4）配置自己的maven，以及相关的配置信息

![maven配置](images\web_04.png)

（5）点击next进入下一步操作，选择好安装路径，点击finish。

![选择好安装路径](images\web_05.png)

（6）创建完毕后打开就可以看到相关的pom文件和目录结构了。

![目录结构](images\web_06.png)

（7）这样创建出来的maven项目，可以进行web项目的开发了，为了方便开发，我们引入pom依赖，将maven项目转变为springboot项目。

```xml
<parent>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-parent</artifactId>
  <version>2.2.2.RELEASE</version>
  <relativePath/> 
</parent>

<dependencies>
	<dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
</dependencies>
```

（8）按照mvc模式对目录文件进行修改，让结构层次更加清晰。

![目录优化](images\web_07.png)

（9）启动项目成功，表示基于maven的springboot项目构建成功。

![项目启动成功](images\web_08.png)

（10）在application.yml进行数据库的配置，以及mybatis与数据库mysql的连接保持正常，提前创建好数据库的数据，通过反向代理方式生成数据的基本操作方式。

![配置文件](images\web_09.png)

![mapper文件](images\web_10.png)

（11）编写相应的controller代码、service层代码以及前端代码，通过controller运用springMvc的访问方式与前端代码进行数据的获取与交互，实现整个web项目功能的编写实现。

**Controller层代码**

```java
@Controller
@RequestMapping("/blogHome")
public class HomeController {
    @Resource
    private TbBlogService tbBlogService;//处理博客信息的逻辑层
    @Resource
    private TbBloggerService tbBloggerService;//处理博主信息的逻辑层
    @Resource
    private TbCategoryService tbCategoryService;//处理博客分类的逻辑层
    @Resource
    private TbCommentService tbCommentService;//处理评论的逻辑层
    
    @RequestMapping("/search")//实现搜索匹配
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
        return "content";//跳转到content.html
    }
    @RequestMapping("/home")//博客首页
    public String home(Model model){
        TbBlogger blogger = tbBloggerService.selectAll();
        model.addAttribute("blogger", blogger);
        List<TbCategory> categoryList = tbCategoryService.selectAll();
        model.addAttribute("categoryList",categoryList);
        return "home";//跳转到主页面home.html
    }

    @RequestMapping("/toContent")//博客数据的显示
    public String toContent(Model model){
        List<BlogDetailVo> tbBlogList = tbBlogService.queryAllBlog();
        model.addAttribute("blogList",tbBlogList);
        HashMap<String,Object> map = new HashMap<>();
        for(BlogDetailVo b:tbBlogList){
            map.put(b.getBlogId()+"",tbCommentService.getCommentCount(b.getBlogId()));
        }
        model.addAttribute("countList",map);
        return "content";//跳转到content.html
    }
}
```

service层实现

```

```

（12）代码编写完毕，运行项目，打开浏览器查看效果。

### 4.4 实现效果截图

## 五、实验总结.



- 实验的过程，就是类似一个教学过程。比如，基于IDE的可以写：第一步打开发工具，第二步通过什么菜单建立空工程。第三步。。。。。。
- 简单的说就是记录你做课程设计的过程。只记录到实现前一两个个功能就可以了