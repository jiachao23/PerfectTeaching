<#include "/front/layout/_titleNav.ftl">
<@html  css="article">
    <div class="blog-body">
        <div class="blog-container">
        <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow">
            <a href="home.html" title="网站首页">网站首页</a>
            <a><cite>文章专栏</cite></a>
        </blockquote>
        <div class="blog-main">
            <div class="blog-main-left">
                <div class="shadow" style="text-align:center;font-size:16px;padding:40px 15px;background:#fff;margin-bottom:15px;">
                    未搜索到与【<span style="color: #FF5722;">keywords</span>】有关的文章，随便看看吧！
                </div>
                <@blogList type="all">
                    <#list list as x>
                        <div class="article shadow">
                            <div class="article-left">
                                <img src="${ctx!}/${(x.coverURL)!}" alt="${(x.coverURL)!}" />
                            </div>
                            <div class="article-right">
                                <div class="article-title">
                                    <a href="${ctx!}/article/view/${x.id}">${(x.title)!}</a>
                                </div>
                                <div class="article-abstract">
                                    ${(x.summary)!}
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="article-footer">
                                <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;${(x.createDate)!}</span>
                                <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;${(x.author.nickName)!}</span>
                                <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#">${(x.tags)!}</a></span>
                                <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;${(x.readNum)!}</span>
                                <span class="article-viewinfo"><i class="fa fa-star"></i>&nbsp;${(x.heartNum)!}</span>
                                <span class="article-viewinfo"><i class="fa fa-share-square-o"></i>&nbsp;${(x.shareNum)!}</span>
                            </div>
                        </div>
                    </#list>
                </@blogList>
            </div>


            <div class="blog-main-right">
                <div class="blog-search">
                    <form class="layui-form" action="">
                        <div class="layui-form-item">
                            <div class="search-keywords  shadow">
                                <input type="text" name="keywords" lay-verify="required" placeholder="搜索功能暂不可用" autocomplete="off" class="layui-input ">
                            </div>
                            <div class="search-submit  shadow">
                                <a class="search-btn" lay-submit="formSearch" lay-filter="formSearch"><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="article-category shadow">
                    <div class="article-category-title">分类导航</div>
                    <@tagList>
                        <#list list as x>
                            <a href="javascript:layer.msg(&#39;切换到相应分类&#39;)">${(x.name)!}</a>
                        </#list>
                    </@tagList>
                    <div class="clear"></div>
                </div>

                <div class="blog-module shadow">
                    <div class="blog-module-title">阅读排行</div>
                    <ul class="fa-ul blog-module-ul">
                        <@blogList type="readNum">
                            <#list list as x>
                                <li><i class="fa-li fa fa-hand-o-right"></i><a href="${ctx!}/article/view/${x.id}">${(x.title)!}</a></li>
                            </#list>
                        </@blogList>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">分享排行</div>
                    <ul class="fa-ul blog-module-ul">
                    <@blogList type="shareNum">
                        <#list list as x>
                            <li><i class="fa-li fa fa-hand-o-right"></i><a href="${ctx!}/article/view/${x.id}">${(x.title)!}</a></li>
                        </#list>
                    </@blogList>
                    </ul>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    </div>
</@html>