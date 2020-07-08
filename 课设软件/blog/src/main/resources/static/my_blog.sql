/*
 Navicat MySQL Data Transfer

 Source Server         : YYcoder
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : my_blog

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 06/01/2020 18:56:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog`  (
  `blog_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `blog_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '博客标题',
  `blog_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '博客内容',
  `blog_count` int(50) NULL DEFAULT 0 COMMENT '访问数量',
  `blog_time` datetime(6) NULL DEFAULT NULL COMMENT '发布时间',
  `blog_typeId` int(11) NOT NULL COMMENT '所属分类',
  PRIMARY KEY (`blog_id`) USING BTREE,
  INDEX `blog_type_fk`(`blog_typeId`) USING BTREE,
  CONSTRAINT `blog_type_fk` FOREIGN KEY (`blog_typeId`) REFERENCES `tb_category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------
INSERT INTO `tb_blog` VALUES (1, 'html学习方法', '多打代码，多看文档', 17, '2020-01-04 19:53:56.000000', 2);
INSERT INTO `tb_blog` VALUES (2, 'SpringBoot学习入门', '<div class=\"post-body\" itemprop=\"articleBody\" style=\"opacity: 1; display: block; transform: translateY(0px);\">\r\n\r\n      \r\n      \r\n\r\n      \r\n        <h1 id=\"构建微服务：Spring-boot-入门篇\"><a href=\"#构建微服务：Spring-boot-入门篇\" class=\"headerlink\" title=\"构建微服务：Spring boot 入门篇\"></a><center><strong><font color=\"#008000\">构建微服务：Spring boot 入门篇</font></strong></center></h1><h2 id=\"什么是Spring-Boot\"><a href=\"#什么是Spring-Boot\" class=\"headerlink\" title=\"什么是Spring Boot?\"></a><font color=\"gray\">什么是Spring Boot?</font></h2><p>Spring Boot 是由 Pivotal 团队提供的全新框架，其设计目的是用来简化新 Spring 应用的初始搭建以及开发过<br>程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。其实Spring Boot 不<br>是什么新的框架，它只是默认配置了很多框架的使用方式，就像 Maven 整合了所有的 Jar 包，Spring Boot 整<br>合了所有的框架。</p>\r\n<h2 id=\"使用-Spring-Boot有什么好处\"><a href=\"#使用-Spring-Boot有什么好处\" class=\"headerlink\" title=\"使用 Spring Boot有什么好处\"></a><font color=\"gray\">使用 Spring Boot有什么好处</font></h2><h3 id=\"其实就是简单、快速、方便！\"><a href=\"#其实就是简单、快速、方便！\" class=\"headerlink\" title=\"其实就是简单、快速、方便！\"></a>其实就是简单、快速、方便！</h3><font color=\"green\">平时如果我们需要搭建一个 Spring Web 项目的时候需要怎么做呢？</font>  \r\n\r\n<ul>\r\n<li>1）配置 web.xml，加载 Spring 和 Spring mvc  </li>\r\n<li>2）配置数据库连接、配置 Spring 事务  </li>\r\n<li>3）配置加载配置文件的读取，开启注解  </li>\r\n<li>4）配置日志文件  </li>\r\n<li>····  </li>\r\n<li>配置完成之后部署 Tomcat 调试<br>想象一下如果生产项目，只是为了实现简单的一个发送消息的功能，都<br>需要这样折腾一遍!</li>\r\n</ul>\r\n<font color=\"green\">但是如果使用 Spring Boot 呢？</font>  \r\n\r\n<p>很简单，我仅仅只需要非常少的几个配置就可以迅速方便的搭建起来一套 Web 项目或者是构建一个微服务！</p>\r\n<h2 id=\"快速入门\"><a href=\"#快速入门\" class=\"headerlink\" title=\"快速入门\"></a><strong>快速入门</strong></h2><blockquote>\r\n<font color=\"gray\">说了那么多，不如马上来动手试一试!</font> \r\n</blockquote>\r\n<h3 id=\"Maven-构建项目\"><a href=\"#Maven-构建项目\" class=\"headerlink\" title=\"Maven 构建项目\"></a><strong>Maven 构建项目</strong></h3><ul>\r\n<li><p>1、访问 <a href=\"http://start.spring.io/\" target=\"_blank\" rel=\"noopener\">http://start.spring.io/</a></p>\r\n</li>\r\n<li><p>2、选择构建工具 Maven Project、Java、Spring Boot 版本 2.1.5 以及一些工程基本信息，可参考下图<br>  所示：<br><img src=\"/uploads/springBoot_01.jpg\" alt=\"\"></p>\r\n</li>\r\n<li><p>3、点击 Generate Project 下载项目压缩包</p>\r\n</li>\r\n<li><p>4、解压后，使用 Idea 导入项目，File -&gt; New -&gt; Model from Existing Source.. -&gt; 选择解压后的文件夹<br>   -&gt; OK，选择 Maven 一路 Next，OK done!</p>\r\n</li>\r\n<li>5、如果使用的是 Eclipse，Import -&gt; Existing Maven Projects -&gt; Next -&gt; 选择解压后的文件夹 -&gt;<br>  Finsh，OK done!</li>\r\n</ul>\r\n<h3 id=\"Idea-构建项目\"><a href=\"#Idea-构建项目\" class=\"headerlink\" title=\"Idea 构建项目\"></a><strong>Idea 构建项目</strong></h3><ul>\r\n<li>1、选择 File -&gt; New —&gt; Project… 弹出新建项目的框</li>\r\n<li>2、选择 Spring Initializr，Next 也会出现上述类似的配置界面，Idea 帮我们做了集成</li>\r\n<li>3、填写相关内容后，点击 Next 选择依赖的包再点击 Next，最后确定信息无误点击 Finish。</li>\r\n</ul>\r\n<h3 id=\"项目结构介绍\"><a href=\"#项目结构介绍\" class=\"headerlink\" title=\"项目结构介绍\"></a><font color=\"gray\">项目结构介绍</font></h3><p><img src=\"https://images2015.cnblogs.com/blog/331425/201607/331425-20160712105138029-1564953731.png\" alt=\"\"></p>\r\n<p>如上图所示，Spring Boot的基础结构共三个文件:</p>\r\n<ul>\r\n<li><p>src/main/java  程序开发以及主程序入口</p>\r\n</li>\r\n<li><p>src/main/resources 配置文件</p>\r\n</li>\r\n<li><p>src/test/java  测试程序  </p>\r\n</li>\r\n</ul>\r\n<p>另外，spingboot建议的目录结果如下：</p>\r\n<p>root package结构：com.example.myproject</p>\r\n<div class=\"highlight-wrap\"><button class=\"copy-btn\">复制</button><figure class=\"highlight plain\"><table><tbody><tr><td class=\"gutter\"><pre><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br><span class=\"line\">11</span><br><span class=\"line\">12</span><br><span class=\"line\">13</span><br><span class=\"line\">14</span><br><span class=\"line\">15</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">com</span><br><span class=\"line\">  +- example</span><br><span class=\"line\">    +- myproject</span><br><span class=\"line\">      +- Application.java</span><br><span class=\"line\">      |</span><br><span class=\"line\">      +- domain</span><br><span class=\"line\">      |  +- Customer.java</span><br><span class=\"line\">      |  +- CustomerRepository.java</span><br><span class=\"line\">      |</span><br><span class=\"line\">      +- service</span><br><span class=\"line\">      |  +- CustomerService.java</span><br><span class=\"line\">      |</span><br><span class=\"line\">      +- controller</span><br><span class=\"line\">      |  +- CustomerController.java</span><br><span class=\"line\">      |</span><br></pre></td></tr></tbody></table></figure></div>\r\n<p>1、<strong>Application.java</strong> 建议放到跟目录下面,主要用于做一些框架配置</p>\r\n<p>2、<strong>domain</strong>目录主要用于实体（Entity）与数据访问层（Repository）</p>\r\n<p>3、<strong>service</strong> 层主要是业务类代码</p>\r\n<p>4、<strong>controller</strong> 负责页面访问控制</p>\r\n<p>采用默认配置可以省去很多配置，当然也可以根据自己的喜欢来进行更改<br>最后，启动Application main方法，至此一个java项目搭建好了！</p>\r\n<h2 id=\"引入-Web-模块\"><a href=\"#引入-Web-模块\" class=\"headerlink\" title=\"引入 Web 模块\"></a><strong>引入 Web 模块</strong></h2><p>1、pom.xml中添加支持web的模块：<br></p><div class=\"highlight-wrap\"><button class=\"copy-btn\">复制</button><figure class=\"highlight plain\"><table><tbody><tr><td class=\"gutter\"><pre><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">&lt;dependency&gt;</span><br><span class=\"line\">       &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;</span><br><span class=\"line\">       &lt;artifactId&gt;spring-boot-starter-web&lt;/artifactId&gt;</span><br><span class=\"line\">&lt;/dependency&gt;</span><br></pre></td></tr></tbody></table></figure></div><p></p>\r\n<p>pom.xml文件中默认有两个模块：</p>\r\n<p><em>spring-boot-starter</em>：核心模块，包括自动配置支持、日志和YAML；</p>\r\n<p><em>spring-boot-starter-test</em>：测试模块，包括JUnit、Hamcrest、Mockito。</p>\r\n<p> 2、编写controller内容<br></p><div class=\"highlight-wrap\"><button class=\"copy-btn\">复制</button><figure class=\"highlight plain\"><table><tbody><tr><td class=\"gutter\"><pre><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">@RestController</span><br><span class=\"line\">public class HelloWorldController {</span><br><span class=\"line\">    @RequestMapping(\"/hello\")</span><br><span class=\"line\">    public String index() {</span><br><span class=\"line\">        return \"Hello World\";</span><br><span class=\"line\">    }</span><br><span class=\"line\">}</span><br></pre></td></tr></tbody></table></figure></div><p></p>\r\n<p>@RestController的意思就是controller里面的方法都以json格式输出，不用再写什么jackjson配置的了！</p>\r\n<p>3、启动主程序，打开浏览器访问<a href=\"http://localhost:8080/hello\" target=\"_blank\" rel=\"noopener\">http://localhost:8080/hello</a>, 就可以看到效果了，是不是很简单粗暴！</p>\r\n<h3 id=\"如何做单元测试\"><a href=\"#如何做单元测试\" class=\"headerlink\" title=\"如何做单元测试\"></a>如何做单元测试</h3><p>打开的src/test/下的测试入口，编写简单的http请求来测试；使用mockmvc进行，利用<br>MockMvcResultHandlers.print() 打印出执行结果。<br></p><div class=\"highlight-wrap\"><button class=\"copy-btn\">复制</button><figure class=\"highlight plain\"><table><tbody><tr><td class=\"gutter\"><pre><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br><span class=\"line\">11</span><br><span class=\"line\">12</span><br><span class=\"line\">13</span><br><span class=\"line\">14</span><br><span class=\"line\">15</span><br><span class=\"line\">16</span><br><span class=\"line\">17</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">  @RunWith(SpringRunner.class)</span><br><span class=\"line\">  @SpringBootTest</span><br><span class=\"line\"></span><br><span class=\"line\">    public class HelloWorldControlerTests {</span><br><span class=\"line\">        private MockMvc mvc;</span><br><span class=\"line\">        @Before</span><br><span class=\"line\">        public void setUp() throws Exception {</span><br><span class=\"line\">            mvc = MockMvcBuilders.standaloneSetup(new HelloWorldController()).build();</span><br><span class=\"line\">        }</span><br><span class=\"line\">        @Test</span><br><span class=\"line\">        public void getHello() throws Exception {</span><br><span class=\"line\">        mvc.perform(MockMvcRequestBuilders.get(\"/hello\").accept(MediaType.APPLICATION_JSON))</span><br><span class=\"line\">                .andExpect(MockMvcResultMatchers.status().isOk())</span><br><span class=\"line\">                .andDo(MockMvcResultHandlers.print())</span><br><span class=\"line\">                .andReturn();</span><br><span class=\"line\">    }</span><br><span class=\"line\">}</span><br></pre></td></tr></tbody></table></figure></div><p></p>\r\n<h3 id=\"开发环境的调试\"><a href=\"#开发环境的调试\" class=\"headerlink\" title=\"开发环境的调试\"></a>开发环境的调试</h3><p>热启动在正常开发项目中已经很常见了吧，虽然平时开发 web 项目过程中，改动项目启重启总是报错；但<br>Spring Boot对调试支持很好，修改之后可以实时生效，需要添加以下的配置：</p>\r\n<div class=\"highlight-wrap\"><button class=\"copy-btn\">复制</button><figure class=\"highlight plain\"><table><tbody><tr><td class=\"gutter\"><pre><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br><span class=\"line\">11</span><br><span class=\"line\">12</span><br><span class=\"line\">13</span><br><span class=\"line\">14</span><br><span class=\"line\">15</span><br><span class=\"line\">16</span><br><span class=\"line\">17</span><br><span class=\"line\">18</span><br><span class=\"line\">19</span><br><span class=\"line\">20</span><br><span class=\"line\">21</span><br><span class=\"line\">22</span><br><span class=\"line\">23</span><br><span class=\"line\">24</span><br><span class=\"line\">25</span><br><span class=\"line\">26</span><br><span class=\"line\">27</span><br><span class=\"line\">28</span><br><span class=\"line\">29</span><br><span class=\"line\">30</span><br><span class=\"line\">31</span><br><span class=\"line\">32</span><br><span class=\"line\">33</span><br><span class=\"line\">34</span><br><span class=\"line\">35</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">&lt;dependencies&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">    &lt;dependency&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">        &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">        &lt;artifactId&gt;spring-boot-devtools&lt;/artifactId&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">        &lt;optional&gt;true&lt;/optional&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">   &lt;/dependency&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">&lt;/dependencies&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">&lt;build&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">    &lt;plugins&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">        &lt;plugin&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">            &lt;groupId&gt;org.springframework.boot&lt;/groupId&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">            &lt;artifactId&gt;spring-boot-maven-plugin&lt;/artifactId&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">            &lt;configuration&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">                &lt;fork&gt;true&lt;/fork&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">            &lt;/configuration&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">        &lt;/plugin&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">   &lt;/plugins&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">&lt;/build&gt;</span><br></pre></td></tr></tbody></table></figure></div>\r\n<p>该模块在完整的打包环境下运行的时候会被禁用。如果你使用java -jar启动应用或者用一个特定的classloader启动，它会认为这是一个“生产环境”。</p>\r\n<h2 id=\"总结\"><a href=\"#总结\" class=\"headerlink\" title=\"总结\"></a><font color=\"gray\">总结</font></h2><p>使用 Spring Boot 可以非常方便、快速搭建项目，使我们不用关心框架之间的兼容性，适用版本等各种问题，我们想使用任何东西，仅仅添加一个配置就可以，所以使用 Spring Boot 非常适合构建微服务。</p>\r\n\r\n      \r\n    </div>', 35, '2020-01-05 17:28:15.000000', 1);
INSERT INTO `tb_blog` VALUES (3, 'Mysql入门之道', '<div class=\"post-body\" itemprop=\"articleBody\" style=\"opacity: 1; display: block; transform: translateY(0px);\">\r\n\r\n      \r\n      \r\n\r\n      \r\n        <h2 id=\"什么是SQL查询语言？\"><a href=\"#什么是SQL查询语言？\" class=\"headerlink\" title=\"什么是SQL查询语言？\"></a>什么是SQL查询语言？</h2><pre><code>SQL是Structured Quevy Language(结构化查询语言)的缩写。  \r\nSQL是专为数据库而建立的操作命令集，是一种功能齐全的数据库语言。在使用它时，只需要 \r\n发出“做什么”的命令，“怎么做”是不用使用者考虑的。\r\n</code></pre><h2 id=\"SQL数据类型\"><a href=\"#SQL数据类型\" class=\"headerlink\" title=\"SQL数据类型\"></a>SQL数据类型</h2><h3 id=\"1-常用的数据类型\"><a href=\"#1-常用的数据类型\" class=\"headerlink\" title=\"1.常用的数据类型\"></a>1.常用的数据类型</h3><pre><code>double：浮点型，例如double(5,2)表示最多5位，其中必须有2位小数，即最大值为999.99；\r\nchar：固定长度字符串类型； char(10)  \'abc\'\r\nvarchar：可变长度字符串类型；varchar(10) \'abc\'\r\ntext：字符串类型;\r\nblob：二进制类型；\r\ndate：日期类型，格式为：yyyy-MM-dd；\r\ntime：时间类型，格式为：hh:mm:ss\r\ndatetime:日期时间类型 yyyy-MM-dd hh:mm:ss\r\n</code></pre><blockquote>\r\n<p>在mysql中，字符串类型和日期类型都要用单引号括起来。 如’sql_study’、’2020-01-01’等  </p>\r\n</blockquote>\r\n<h3 id=\"MySQL支持的数据类型\"><a href=\"#MySQL支持的数据类型\" class=\"headerlink\" title=\"MySQL支持的数据类型\"></a>MySQL支持的数据类型</h3><h3 id=\"大致可以分为三类\"><a href=\"#大致可以分为三类\" class=\"headerlink\" title=\"大致可以分为三类\"></a>大致可以分为三类</h3><h4 id=\"1-数值类型\"><a href=\"#1-数值类型\" class=\"headerlink\" title=\"1.数值类型\"></a>1.数值类型</h4><p> <img src=\"/uploads/MySQL/sql_01.jpg\" alt=\"\"></p>\r\n<h4 id=\"2-字符串类型\"><a href=\"#2-字符串类型\" class=\"headerlink\" title=\"2.字符串类型\"></a>2.字符串类型</h4><p> <img src=\"/uploads/MySQL/sql_02.jpg\" alt=\"\"></p>\r\n<h4 id=\"3-日期和时间类型\"><a href=\"#3-日期和时间类型\" class=\"headerlink\" title=\"3.日期和时间类型\"></a>3.日期和时间类型</h4><p> <img src=\"/uploads/MySQL/sql_03.jpg\" alt=\"\">  </p>\r\n<h2 id=\"sql功能分类\"><a href=\"#sql功能分类\" class=\"headerlink\" title=\"sql功能分类\"></a>sql功能分类</h2><h3 id=\"1-DDL-数据定义语言\"><a href=\"#1-DDL-数据定义语言\" class=\"headerlink\" title=\"1.DDL: 数据定义语言\"></a>1.DDL: 数据定义语言</h3><pre><code>DDL是用来定义数据库对象：创建库，表，列等。\r\n\r\n创建数据库 create database 数据库名  character set utf8;\r\n修改数据库 alter database 数据库名 charactor set gbk;\r\n查看表的字段信息  DESC 表名;    \r\n查看表的创建细节   SHOW CREATE TABLE 表名;\r\n修改表的字符集为gbk  ALTER TABLE 表名 CHARACTER SET 字符集名称;\r\n\r\n创建表 create table 表名(列名1 列的类型[约束]，列名2 列的类型[约束]....); \r\n修改表名    RENAME TABLE 原始表名 TO  要修改的表名;\r\n修改一个表的字段类型  ALTER TABLE 表名 MODIFY 字段名 数据类型\r\n修改表的列名   ALTER TABLE 表名 CHANGE 原始列名 新列名 数据类型; \r\n删除表   DROP TABLE 表名;        \r\n添加一列   ALTER TABLE 表名 ADD 列名 数据类型;\r\n删除一列   ALTER TABLE 表名 DROP 字段名;\r\n</code></pre><h3 id=\"2-DML：数据操作语言\"><a href=\"#2-DML：数据操作语言\" class=\"headerlink\" title=\"2.DML：数据操作语言\"></a>2.DML：数据操作语言</h3><pre><code>DML用来操作数据库表中的记录，即就是对数据库的数据进行增删改查的操作\r\n\r\n①查询操作\r\n查询表中的所有数据 SELECT * FROM 表名;\r\n查询表中的指定数据 SELECT * FROM 表名 where 条件;\r\n\r\n②插入操作\r\n单个数据插入 INSERT INTO 表名（列名1，列名2 ...）VALUE (列值1，列值2...);\r\n批量数据插入 INSERT INTO 表名（列名1，列名2 ...）VALUES (列值1，列值2...)，(列值1，列值2...);\r\n\r\n③更新操作\r\n更新记录 UPDATE 表名 SET 列名1=列值1，列名2=列值2 .... WHERE 列名=值;\r\n\r\n④删除操作\r\n删除记录 DELETE FROM 表名 【WHERE 列名=值】; (DELETE 删除表中的数据，表结构还在;删除后的数据可以找回)\r\n删除所有记录 TRUNCATE TABLE 表名; (删除是把表直接DROP掉，然后再创建一个同样的新表。删除的数据不能找回)\r\n</code></pre><h3 id=\"3-DQL：数据查询语言\"><a href=\"#3-DQL：数据查询语言\" class=\"headerlink\" title=\"3.DQL：数据查询语言\"></a>3.DQL：数据查询语言</h3><pre><code>DQL用来查询数据。数据库执行DQL语句不会对数据进行改变，而是让数据库发送结果集给客户端。  \r\n结果集：通过查询语句查询出来的数据以表的形式展示我们称这个表为虚拟结果集，并存放在内存中。查询返回  \r\n       的结果集是一张虚拟表。  \r\nDQL包含模糊查询、条件查询、字段控制查询、排序、以及聚合函数的应用\r\n</code></pre><h3 id=\"4-DCL：数据控制语言\"><a href=\"#4-DCL：数据控制语言\" class=\"headerlink\" title=\"4.DCL：数据控制语言\"></a>4.DCL：数据控制语言</h3><pre><code>DCL用来定义访问权限和安全级别。即对数据库事务（trasaction）的控制，包括事务的提交（commit），事务的回滚（rollback），以及权限的管理等。\r\n</code></pre>\r\n      \r\n    </div>', 10, '2020-01-05 17:28:13.000000', 3);
INSERT INTO `tb_blog` VALUES (4, 'SpringMvc学习', '<div class=\"post-body\" itemprop=\"articleBody\" style=\"opacity: 1; display: block; transform: translateY(0px);\">\r\n\r\n      \r\n      \r\n\r\n      \r\n        <h2 id=\"表现层框架SpringMVC\"><a href=\"#表现层框架SpringMVC\" class=\"headerlink\" title=\"表现层框架SpringMVC\"></a>表现层框架SpringMVC</h2><p>1.SpringMVC程序开发的基本步骤:<br></p><div class=\"highlight-wrap\"><button class=\"copy-btn\">复制</button><figure class=\"highlight plain\"><table><tbody><tr><td class=\"gutter\"><pre><span class=\"line\">1</span><br><span class=\"line\">2</span><br><span class=\"line\">3</span><br><span class=\"line\">4</span><br><span class=\"line\">5</span><br><span class=\"line\">6</span><br><span class=\"line\">7</span><br><span class=\"line\">8</span><br><span class=\"line\">9</span><br><span class=\"line\">10</span><br><span class=\"line\">11</span><br><span class=\"line\">12</span><br><span class=\"line\">13</span><br><span class=\"line\">14</span><br><span class=\"line\">15</span><br><span class=\"line\">16</span><br><span class=\"line\">17</span><br><span class=\"line\">18</span><br><span class=\"line\">19</span><br><span class=\"line\">20</span><br><span class=\"line\">21</span><br><span class=\"line\">22</span><br></pre></td><td class=\"code\"><pre><span class=\"line\">1.准备好SpringMVC开发的jar包(8个)</span><br><span class=\"line\">        spring-aop.jar	  spring-beans.jar   spring-context.jar	     </span><br><span class=\"line\">        spring-core.jar	  spring-expression.jar	 commons-logging.jar</span><br><span class=\"line\"> spring-web.jar	    在Web应用开发过程中，用到Spring框架时所需的核心类库  </span><br><span class=\"line\"> spring-webmvc.jar    Spring MVC框架相关的所有类。如国际化、标签、Theme、FreeMarker等相关类</span><br><span class=\"line\"></span><br><span class=\"line\">2.在web.xml中配置前置控制器DispatcherServlet，用于拦截与&lt;url-pattern&gt;相匹配的请求  </span><br><span class=\"line\"></span><br><span class=\"line\">3.开发前端请求页面(index.jsp)  </span><br><span class=\"line\"></span><br><span class=\"line\">4.开发请求处理类(controller）：含注解@Controller、@RequestMapping()等</span><br><span class=\"line\"></span><br><span class=\"line\">5.在src目录下创建SpringMVC的配置文件：springmvc.xml</span><br><span class=\"line\">        &lt;!-- 配置需要扫描的包 --&gt;</span><br><span class=\"line\">            &lt;context:component-scan base-package=\"com.YYcoder.controller\"&gt; &lt;/context:component-scan&gt;</span><br><span class=\"line\">        &lt;!-- 配置视图解析器：把请求处理类的返回值，加工成最终的视图路径--&gt;</span><br><span class=\"line\">            &lt;bean class=\"org.springframework.web.servlet.view.InternalResourceViewResolver\"&gt;</span><br><span class=\"line\">                &lt;property name=\"prefix\" value=\"/views/\"&gt;&lt;/property&gt;&lt;!--前缀--&gt;</span><br><span class=\"line\">                &lt;property name=\"suffix\" value=\".jsp\"&gt;&lt;/property&gt;&lt;!--后缀--&gt;</span><br><span class=\"line\">            &lt;/bean&gt;</span><br><span class=\"line\"></span><br><span class=\"line\">6.开发前端结果显示页面：result.jsp</span><br></pre></td></tr></tbody></table></figure></div><p></p>\r\n<p>2.SpringMVC的学习内容(主要是学会如何使用注解来实现操作)</p>\r\n<pre><code>①常见注解的使用(可以参考springMVC的文档学习)\r\n    @RequestMapping  用来给方法绑定一个请求映射\r\n    @PathVariable    获取动态参数  \r\n    @RequestParam    获取请求参数\r\n    @RequestHeader   获取请求中的“头信息”\r\n    @CookieValue     可以给处理方法入参绑定某个Cookie值  \r\n\r\n②处理模型数据：用户从视图页面(v)发起一个请求到控制器(c)，控制器调用Service/Dao等处理数据，  \r\n                  并从数据库中返回数据(M)。之后控制器拿到数据后加以处理，并返回到视图页面。\r\n    实现方法：\r\n        （1）ModelAndView：含Model和View两部分，数据将被放入request作用域\r\n        （2）ModelMap、Map及Model：不含view部分，可以方法的参数操作数据放入request作用域。\r\n        （3）@SessionAttribute：把数据放到session作用域\r\n        （4）@ModelAttribute：会在请求处理类中的每一个方法执行前都执行一次(谨用)\r\n\r\n③视图、视图解析器(ViewResolver),以及对静态资源的处理\r\n\r\n④类型转换：将前端传来的数据类型转为请求处理方法参数中的所对应的类型\r\n\r\n⑤数据格式化、数据校验:让前端传入的数据按照一定格式、要求，否则报错。\r\n\r\n⑥文件上传、拦截器的使用。在springmvc.xml文件中配置：\r\n            &lt;mvc:interceptors&gt;\r\n                &lt;!-- 配置自定义的拦截器  --&gt;\r\n                &lt;bean class=\"org.lanqiao.interceptor.FirstInterceptor\"&gt;&lt;/bean&gt;\r\n            &lt;/mvc:interceptors&gt;\r\n\r\n⑦异常处理：使用@ExceptionHandler注解用来捕获指定类型的异常。\r\n\r\n\r\n⑧SSM整合:Spring + springmvc + Mybatis\r\n    Spring - Mybatis\r\n        SqlSessionFactory - &gt; SqlSession -&gt; StduentMapper -&gt;CRUD\r\n        整合： 将SqlSessionFactory在spring中配置\r\n              Spring - SpringMvc：spring springmvc各自配置一遍\r\n\r\n    步骤：\r\n        1.jar包\r\n        2.Student 类 --Student表\r\n        3.(省略)--MyBatis配置SqlMapConfig.xml(数据源、 mapper.xml)\r\n            在spring配置文件中 applicationContext.xml\r\n        4.通过mapper.xml将 类、表建立映射关系\r\n        5.web配置spring springmvc\r\n        6.spring 整合mybatis 扫描器\r\n        7.spring整合springmvc(视图解析器 标准配置)\r\n\r\n    ui层：前端（jsp）---&gt;通过注解调用  后端：SpringMvc（或Servlet）\r\n    (controller控制器依赖于Service,即给controller注入service)\r\n\r\n    Service层：StudentService.java   StduentServiceImpl.java(依赖dao层，即给service注入mapper)             \r\n        &lt;!-- 配置DAO层:为StudentDaoImpl注入SqlSessionFactory对象 --&gt;\r\n        &lt;bean id=\"studentService\" class=\"org.lanqiao.service.impl.StudentServiceImpl\"&gt;\r\n            &lt;property name=\"studentDao\" ref=\"studentMapper\"&gt;&lt;/property&gt;\r\n        &lt;/bean&gt;\r\n        &lt;bean id=\"studentController\" class=\"org.lanqiao.controller.stduentController\"&gt;\r\n                &lt;property name=\"studentService\" ref=\"studentService\"&gt;&lt;/property&gt;\r\n        &lt;/bean&gt;\r\n\r\n    dao层：studentMapper.java() StudentMapper.xml ---&gt;操作DB数据库\r\n\r\n\r\n\r\n    控制器 testController.java\r\n    业务逻辑层接口 testService.java\r\n    业务逻辑层实现类 testServiceImpl.java\r\n\r\n     Web.xml中配置使用Spring和SpringMVC\r\n    SpringMVC.xml配置扫描包、视图解析器和控制器Controller\r\n    applicationContext.xml:配置数据库连接池、sqlSessionFactory、dao、service\r\n    编写test测试：jsp页面测试 \r\n</code></pre>\r\n      \r\n    </div>', 25, '2020-01-05 17:28:10.000000', 1);
INSERT INTO `tb_blog` VALUES (23, '第一篇博客', '<p><span style=\"background-color: rgb(255, 255, 0);\">我是博主，这是我的第一篇博客</span></p>', 1, '2020-01-06 04:11:14.843000', 1);

-- ----------------------------
-- Table structure for tb_blogger
-- ----------------------------
DROP TABLE IF EXISTS `tb_blogger`;
CREATE TABLE `tb_blogger`  (
  `blogger_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '博主id',
  `blogger_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '博主账号名',
  `blogger_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录密码',
  `blogger_introuductin` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个性签名',
  `blogger_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博主邮箱',
  `blogger_nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '博主姓名',
  `blogger_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`blogger_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blogger
-- ----------------------------
INSERT INTO `tb_blogger` VALUES (1, 'root', '123456', '不断学习，不断进步', '2082878884@qq.com', 'YYcoder', '10086');

-- ----------------------------
-- Table structure for tb_blogtag
-- ----------------------------
DROP TABLE IF EXISTS `tb_blogtag`;
CREATE TABLE `tb_blogtag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `blog_id` int(11) NOT NULL COMMENT '博客id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `blog_tag_time` datetime(6) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_tag_fk2`(`tag_id`) USING BTREE,
  INDEX `blog_tag_fk1`(`blog_id`) USING BTREE,
  CONSTRAINT `blog_tag_fk1` FOREIGN KEY (`blog_id`) REFERENCES `tb_blog` (`blog_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `blog_tag_fk2` FOREIGN KEY (`tag_id`) REFERENCES `tb_tag` (`tag_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blogtag
-- ----------------------------
INSERT INTO `tb_blogtag` VALUES (1, 1, 1, '2020-01-04 20:01:23.000000');
INSERT INTO `tb_blogtag` VALUES (2, 1, 2, '2020-01-04 20:04:07.000000');
INSERT INTO `tb_blogtag` VALUES (3, 1, 3, '2020-01-04 20:04:22.000000');
INSERT INTO `tb_blogtag` VALUES (4, 4, 5, '2020-01-05 05:03:14.000000');
INSERT INTO `tb_blogtag` VALUES (5, 3, 3, '2020-01-05 21:02:30.000000');
INSERT INTO `tb_blogtag` VALUES (6, 2, 3, '2020-01-05 21:02:44.000000');
INSERT INTO `tb_blogtag` VALUES (7, 2, 1, '2020-01-05 21:29:58.000000');
INSERT INTO `tb_blogtag` VALUES (8, 2, 4, '2020-01-05 21:30:08.000000');
INSERT INTO `tb_blogtag` VALUES (9, 23, 5, '2020-01-06 12:36:52.000000');

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `category_state` int(20) NOT NULL DEFAULT 1 COMMENT '状态',
  `category_time` datetime(6) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (1, '数据库', 1, '2020-01-04 20:03:31.000000');
INSERT INTO `tb_category` VALUES (2, '后台', 1, '2020-01-04 20:03:43.000000');
INSERT INTO `tb_category` VALUES (3, '技术', 1, '2020-01-04 17:38:23.000000');
INSERT INTO `tb_category` VALUES (4, 'spring', 1, '2020-01-04 17:43:04.000000');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `blog_id` int(11) NOT NULL COMMENT '博客id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `comment_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `comment_time` datetime(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '评论时间',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `comment_user_fk`(`user_id`) USING BTREE,
  INDEX `comment_blog_fk`(`blog_id`) USING BTREE,
  CONSTRAINT `comment_blog_fk` FOREIGN KEY (`blog_id`) REFERENCES `tb_blog` (`blog_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `comment_user_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES (1, 1, 1, '我是张三', '2020-01-04 20:02:44.000000');
INSERT INTO `tb_comment` VALUES (2, 1, 2, '我是李四', '2020-01-04 20:02:59.000000');
INSERT INTO `tb_comment` VALUES (3, 1, 1, '给博主点赞', '2020-01-05 21:14:46.000000');
INSERT INTO `tb_comment` VALUES (4, 3, 1, '可以的', '2020-01-05 12:19:17.000000');
INSERT INTO `tb_comment` VALUES (5, 3, 3, '写的挺好的', '2020-01-05 12:19:49.000000');
INSERT INTO `tb_comment` VALUES (6, 3, 2, '不错啊', '2020-01-05 12:19:57.000000');
INSERT INTO `tb_comment` VALUES (7, 2, 1, '写的很明白啊', '2020-01-05 12:33:47.000000');
INSERT INTO `tb_comment` VALUES (8, 4, 4, '这篇文章写的挺好的', '2020-01-05 13:06:10.000000');
INSERT INTO `tb_comment` VALUES (9, 4, 1, '同意楼上', '2020-01-05 13:06:26.000000');
INSERT INTO `tb_comment` VALUES (11, 3, 1, '我想发表一下看法', '2020-01-06 03:28:55.740000');

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名称',
  `tag_state` int(20) NOT NULL DEFAULT 1 COMMENT '标签状态',
  `tag_time` datetime(6) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES (1, '前端', 1, '2020-01-04 20:01:39.000000');
INSERT INTO `tb_tag` VALUES (2, 'spring', 1, '2020-01-04 20:01:51.000000');
INSERT INTO `tb_tag` VALUES (3, '数据库', 1, '2020-01-04 20:02:04.000000');
INSERT INTO `tb_tag` VALUES (4, '后台技术', 1, '2020-01-04 18:23:26.000000');
INSERT INTO `tb_tag` VALUES (5, '学习', 1, '2020-01-06 04:37:50.493000');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名字',
  `user_pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `user_email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '张三', '123456', '9626652@qq.com', '14756135931');
INSERT INTO `tb_user` VALUES (2, '李四', '123456', '205416531@qq.com', '13695621354');
INSERT INTO `tb_user` VALUES (3, '王五', '123456', '205896516@qq.com', '15521466477');
INSERT INTO `tb_user` VALUES (4, '陈某', '123456', '208246514@qq.com', '15246821389');

SET FOREIGN_KEY_CHECKS = 1;
