<#macro html title="个人博客" css=["index"]>
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
    <link href="${ctx!}/css/jcohy/front/base.css" rel="stylesheet" />
    <#list css as x>
            <link href="${ctx!}/css/jcohy/front/${x}.css" rel="stylesheet" />
    </#list>

</head>
<body>
<header>
    <div id="logo"><a href="/"></a></div>
    <nav class="topnav" id="topnav">
        <a href="/"><span>首页</span></a>
        <@menuList>
            <#list list as x>
                <a href="${ctx!}/${(x.url)!}"><span>&nbsp;${(x.name)!}</span></a>
            </#list>
        </@menuList>
    </nav>
</header>

<#nested >
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
<script src="${ctx}/js/jcohy/front/silder.js"></script>
</body>
</html>
</#macro>

