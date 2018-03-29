
<#--<!-- 侧边栏结束&ndash;&gt;-->
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
<div></div><!--占位-->
<div class="blog-module shadow">
    <div class="blog-module-title">热文排行</div>
    <ul class="fa-ul blog-module-ul">
	<@blogList type="readNum">
		<#list list as x>
            <li><i class="fa-li fa fa-hand-o-right"></i><a href="${ctx!}/article/${x.id}">${x.title}</a></li>
		</#list>
	</@blogList>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">分享排行</div>
    <ul class="fa-ul blog-module-ul">
	<@blogList type="shareNum">
		<#list list as x>
            <li><i class="fa-li fa fa-hand-o-right"></i><a href="${ctx!}/article/${x.id}">${x.title}</a>
                <#--<span></span>-->
            </li>
		</#list>
	</@blogList>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">最近分享</div>
    <ul class="fa-ul blog-module-ul">
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="http://pan.baidu.com/s/1c1BJ6Qc" target="_blank">Canvas</a></li>
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="http://pan.baidu.com/s/1kVK8UhT" target="_blank">pagesize.js</a></li>
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/1mit2aiW" target="_blank">时光轴</a></li>
        <li><i class="fa-li fa fa-hand-o-right"></i><a href="https://pan.baidu.com/s/1nuAKF81" target="_blank">图片轮播</a></li>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">标签分类</div>
    <ul class="blogroll">
	<@tagList>
		<#list list as x>
            <#if x.id%3 ==1>
                <li><a href="${x.url}" target="_blank"><span class="layui-badge layui-bg-green">${x.name}</span></a></li>
            <#elseif x.id%3==2>
                <li><a href="${x.url}" target="_blank"><span class="layui-badge layui-bg-orange">${x.name}</span></a></li>
            <#else >
                <li><a href="${x.url}" target="_blank"><span class="layui-badge layui-bg-blue">${x.name}</span></a></li>
            </#if >
		</#list>
	</@tagList>
    </ul>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">时光轴</div>
    <dl class="footprint">
    <@timeLineList>
        <#list list as x>
            <dt>${x.displayDate}</dt>
            <dd>${x.displayName}</dd>
        </#list>
    </@timeLineList>
    </dl>
</div>

<div class="blog-module shadow">
    <div class="blog-module-title">友情链接</div>
    <ul class="blogroll">
		<@linkList>
			<#list list as x>
				<li><a href="${x.url}" target="_blank">${x.title}</a></li>
			</#list>
		</@linkList>
    </ul>
</div>