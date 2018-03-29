<#include "/front/layout/_titleNav.ftl">
<@html>
<div class="top">
    <section class="box">
        <ul class="texts">
            <p>越是错综复杂的问题。</p>
            <p>就越要根据简单的原理和朴素的思想进行判断和行动。</p>
            <p>我想这是拨开云雾见南山，直接洞悉事物本质和解决问题的最佳方法。</p>
            <p>                                         ——稻盛和夫 《活法》。</p>
        </ul>
        <div class="avatar"><a href="#"><span>Jcohy</span></a> </div>
    </section>
</div>
<!-- 主体 -->
<div class="blog-body">

    <div class="blog-container">
        <div class="blog-main">

            <!-- 公告部分 start -->
            <div class="home-tips shadow">
                <i style="float:left;line-height:17px;" class="fa fa-volume-up"></i>
                <div class="home-tips-container">
                    <@noticeList>
                        <#list list as x>
                            <#if x.url != null>
                                <span style="color: red">${(x.content)!}<a href="${x.url}" target="_blank" style="color:#01AAED">&nbsp;&nbsp;点我前往</a></span>
                            <#else >
                                <span style="color: #009688">${(x.content)!}</span>
                            </#if>
                        </#list>
                    </@noticeList>
                </div>
            </div>
            <!-- 公告部分 end -->

            <!-- banner start-->
            <div class="blog-main-left">
                <div class="layui-carousel" id="banner">
                    <div carousel-item="">
                        <div><img src="${ctx!}/static/images/blog/banner1.jpg" class="banner"></div>
                        <div><img src="${ctx!}/static/images/blog/banner2.jpg" class="banner"></div>
                        <div><img src="${ctx!}/static/images/blog/banner3.jpg" class="banner"></div>
                    </div>
                </div>
            </div>
            <!--banner end-->

            <!--profile info start -->
            <div class="blog-main-right">
                <div class="blogerinfo shadow">
                    <div class="blogerinfo-figure">
                        <img src="${ctx!}/images/ico/jcohy.png" alt="Jcohy" title="Jcohy" style="width: 100px;height: 100px;border-radius: 50px"/>
                    </div>
                    <p class="blogerinfo-nickname">Jcohy</p>
                    <p class="blogerinfo-introduce">一枚90后程序员，Java开发工程师</p>
                    <p class="blogerinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;陕西 - 西安</p>
                    <hr />
                    <div class="blogerinfo-contact">
                        <a target="_blank" title="QQ交流" href="javascript:layer.msg('启动QQ会话窗口')"><i class="fa fa-qq fa-2x"></i></a>
                        <a target="_blank" title="给我写信" href="javascript:layer.msg('启动邮我窗口')"><i class="fa fa-envelope fa-2x"></i></a>
                        <a target="_blank" title="新浪微博" href="javascript:layer.msg('转到你的微博主页')"><i class="fa fa-weibo fa-2x"></i></a>
                        <a target="_blank" title="码云" href="javascript:layer.msg('转到你的github主页')"><i class="fa fa-git fa-2x"></i></a>
                    </div>
                </div>
            </div>
            <!--profile Info end-->

            <!--article start-->
            <div class="blog-main-center">
                <div class="blog-module shadow" style="position: relative">
                    <div class="blog-module-title" style="line-height: 34px;font-size: 16px">
                        <h4>热文排行
                            <a class="moreitem" href="">
                                更多&nbsp;&nbsp;
                            <#--<i class="layui-icon">&#xe65b;-->
                            </a>
                        </h4>

                    </div>

                    <div class="layui-tab">
                        <ul class="layui-tab-title">
                            <li class="layui-this">阅读排行</li>
                            <li>分享排行</li>
                        <#--<li>其他</li>-->
                        </ul>
                        <div class="layui-tab-content">
                            <div class="layui-tab-item layui-show">
                                <ul class="fa-ul blog-module-ul" style="margin-left: 0">
                                    <@blogList type="readNum">
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
                                </ul>
                            </div>
                            <div class="layui-tab-item">
                                <ul class="fa-ul blog-module-ul" style="margin-left: 0">
                                    <@blogList type="shareNum">
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
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- article end -->
        </div>
    </div>

</div>


</@html>