<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx!}/css/login.css" rel="stylesheet">
    <script src="${ctx!}/js/plugins/layui/layui.js" charset="utf-8" type="text/javascript"></script>
    <script src="${ctx!}/js/common.js" charset="utf-8" type="text/javascript"></script>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body>
    <div class="layui-carousel video_mask" id="login_carousel" >
        <div carousel-item>
            <div class="carousel_div1"></div>
            <div class="carousel_div2"></div>
            <div class="carousel_div3"></div>
        </div>
        <div class="login layui-anim layui-anim-up">
            <h1>应用后台管理平台V1.0</h1>
            <form class="layui-form" action="${ctx!}/login" method="post">
                <div class="layui-form-item">
                    <input type="text" name="name" lay-verify="required" placeholder="请输入账号" autocomplete="off"  value="" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" value="" class="layui-input">
                </div>

                <div class="layui-input-block" style="margin-left: 0">
                    <input type="checkbox" name="keepLogin" title="记住登录" checked>
                </div>

                <button class="layui-btn login_btn" lay-submit="" lay-filter="login">登陆系统</button>
            </form>

        </div>

    </div>

</body>

</html>
<script>
    layui.config({
        base : "${ctx!}/js/"
    }).use(['form','layer','jquery','common','carousel', 'element'], function () {
        var $ = layui.jquery,
                form = layui.form,
                common = layui.common,
                carousel = layui.carousel,
                layer = layui.layer;

        /**背景图片轮播*/
        carousel.render({
            elem: '#login_carousel',
            width: '100%',
            height: '100%',
            interval:3000,
            arrow: 'none',
            anim: 'fade',
            indicator:'none'
        });

//            /**重新生成验证码*/
//            function reqCaptcha() {
//                var url = "/captcha.do?nocache=" + new Date().getTime()
//                $('.code img').attr("src",url)
//            }
//            /**点击验证码重新生成*/
//            $('.code img').on('click', function () {
//                reqCaptcha();
//            });

        /**监听登陆提交*/
        <#--form.on('submit(login)', function (data) {-->
            <#--//弹出loading-->
            <#--var loginLoading = top.layer.msg('登陆中，请稍候', {icon: 16, time: false, shade: 0.8});-->
            <#--//记录ajax请求返回值-->
            <#--var ajaxReturnData;-->

            <#--//登陆验证-->
            <#--$.ajax({-->
                <#--url: '${ctx!}/login',-->
                <#--type: 'post',-->
                <#--async: false,-->
                <#--data: data.field,-->
                <#--success: function (data) {-->
                    <#--ajaxReturnData = data;-->
                <#--}-->
            <#--});-->

            <#--//登陆成功-->
            <#--if (ajaxReturnData.isOk) {-->
                <#--window.location.href="/index";-->
                <#--top.layer.close(loginLoading);-->
                <#--return false;-->
            <#--} else {-->
                <#--top.layer.close(loginLoading);-->
                <#--common.cmsLayErrorMsg(ajaxReturnData.msg);-->
<#--//                reqCaptcha();-->
                <#--return false;-->
            <#--}-->
        <#--});-->
        //监听登陆提交
        form.on('submit(login)', function (data) {
            // console.log(data.elem);//被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form);//被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/login",
                data: data.field,
                success: function(ret){
                    // console.log(ret);
                    if(ret.isOk){
                        layer.msg("操作成功", {time: 2000},function(){

                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index);
                            window.location.href="/index";
                        });
                    }else{
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
            return false;
        });
    });
</script>