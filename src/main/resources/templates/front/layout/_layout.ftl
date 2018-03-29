<#macro html title>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>${title!}</title>
    <link rel="shortcut icon" href="../images/Logo_40.png" type="image/x-icon">
    <!-- layui.css -->
    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <!--font-awesome-->
    <link href="${ctx!}/css/font-awesome.min.css" rel="stylesheet" />
    <!--全局样式表-->
    <link href="${ctx!}/css/jcohy/front/global.css" rel="stylesheet" />
    <!-- 本页样式表 -->
    <link href="${ctx!}/css/jcohy/front/home.css" rel="stylesheet" />
</head>
<body>
<!-- 导航 -->
<nav class="blog-nav layui-header">
    <div class="blog-container">
        <!-- QQ互联登陆 -->
        <a href="javascript:;" class="blog-user">
            <i class="fa fa-qq"></i>
        </a>
        <a href="javascript:;" class="blog-user layui-hide">
            <img src="${ctx!}/images/ico/jcohy.png" alt="Jcohy" title="Jcohy" />
        </a>
        <!-- Jcohy -->
        <a class="blog-logo" href="${ctx!}">Jcohy</a>
        <!-- 导航菜单 -->
        <ul class="layui-nav" lay-filter="nav">
            <li class="layui-nav-item layui-this">
                <a href="${ctx!}/"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
            </li>
            <@menuList>
                <#list list as x>
                    <li class="layui-nav-item">
                        <a href="${ctx!}/${(x.url)!}"><i class="fa fa-file-text fa-fw"></i>&nbsp;${(x.name)!}</a>
                    </li>
                </#list>
            </@menuList>
        </ul>

        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
<!-- 主体 -->
<div class="blog-body">
    <!-- canvas -->
    <canvas id="canvas-banner" style="background: #393D49;"></canvas>
    <!--为了及时效果需要立即设置canvas宽高，否则就在home.js中设置-->
    <script type="text/javascript">
        var canvas = document.getElementById('canvas-banner');
        canvas.width = window.document.body.clientWidth - 10;//减去滚动条的宽度
        if (screen.width >= 992) {
            canvas.height = window.innerHeight * 1 / 3;
        } else {
            canvas.height = window.innerHeight * 2 / 7;
        }
    </script>
    <!-- 网站的主体内容 -->
    <div class="blog-container">
        <div class="blog-main">
            <!-- 网站公告提示 -->
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

                    <#--<span style="color: red">网站新增留言回复啦！使用QQ登陆即可回复，人人都可以回复！</span>-->

                    <#--<span style="color: #009688">Jcohy &nbsp;—— &nbsp;一个.NET程序员的个人博客，新版网站采用Layui为前端框架，目前正在建设中！</span>-->
                </div>
            </div>
            <!--左边文章列表-->
            <div class="blog-main-left">
				<#nested>
            </div>
            <!--右边小栏目-->
            <div class="blog-main-right">
                <#include "/front/layout/_sidebar.ftl" />
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<!-- 底部 -->
<footer class="blog-footer">
    <p><span>Copyright</span><span>&copy;</span><span>2017</span><a href="http://www.jcohy.com">Jcohy</a><span>All Rights Reserved</span></p>
    <p><img src="${ctx!}/images/ico/gongan.png" alt="" /><a href="http://www.miitbeian.gov.cn" target="_blank">京ICP备17050179号-1</a></p>
</footer>

<!--分享窗体-->
<div class="blog-share layui-hide">
    <div class="blog-share-body">
        <div style="width: 200px;height:100%;">
            <div class="bdsharebuttonbox">
                <a class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                <a class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
            </div>
        </div>
    </div>
</div>
<!--遮罩-->
<div class="blog-mask animated layui-hide"></div>
<!-- layui.js -->
<script src="${ctx!}/js/plugins/layui/layui.js"></script>
<!-- 全局脚本 -->
<script src="${ctx}/js/jcohy/front/global.js"></script>
<!-- 本页脚本 -->
<script src="${ctx}/js/jcohy/front/home.js"></script>
</body>
</html>
</#macro>