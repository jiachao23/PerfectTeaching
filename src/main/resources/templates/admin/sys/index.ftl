<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>jQadmin后台模板</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- bootstrap css -->
    <link rel="stylesheet" type="text/css" href="${ctx!}/css/bootstrap.min.css" media="all">
    <!-- layui.css -->
    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <!-- font-awesome.css -->
    <link href="${ctx!}/css/font-awesome.css" rel="stylesheet" />
    <!-- animate.css -->
    <link href="${ctx!}/css/animate.min.css" rel="stylesheet" />

</head>

<body>
    <div class="container-fluid larry-wrapper">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <section class="panel panel-padding">
                    <form id="form" class="layui-form layui-form-pane" >
                        <div class="layui-tab" lay-filter="check">
                            <ul class="layui-tab-title">
                                <li class="layui-this" lay-id="1">网站信息</li>
                                <li lay-id="2">博主信息</li>
                                <li lay-id="3">安全设置</li>
                                <#--<li lay-id="3">邮箱设置</li>-->
                                <li lay-id="4">其它设置</li>
                            </ul>
                            <div class="layui-tab-content">
                                <div class="layui-tab-item layui-show">
                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                        <legend>网站信息</legend>
                                    </fieldset>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">网站标题</label>
                                        <div class="layui-input-block">
                                            <input name="title" autocomplete="off" value="${title}"
                                                   placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>


                                    <div class="layui-form-item">
                                        <label class="layui-form-label">网址/域名</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${domain_name}"
                                                   placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">网站关键词</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${keyword}"
                                                   placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>



                                    <div class="layui-form-item layui-form-text">
                                        <label class="layui-form-label">网站描述</label>
                                        <div class="layui-input-block">
                                            <textarea name="" autocomplete="off"
                                                      placeholder="请输入内容" class="layui-textarea">${description}</textarea>
                                        </div>
                                    </div>


                                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                        <legend>网站负责人信息</legend>
                                    </fieldset>


                                    <div class="layui-form-item">
                                        <label class="layui-form-label">联系电话</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${phone}"
                                                   placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">电子邮件</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${email}"
                                                   placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>


                                    <div class="layui-form-item">
                                        <label class="layui-form-label">联系手机</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${phone}"
                                                   placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">联系QQ1</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${qq1}" placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">联系QQ2</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${qq2}" placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>


                                    <div class="layui-form-item">
                                        <label class="layui-form-label">备案号</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${record_number}" placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">备案地公安机关</label>
                                        <div class="layui-input-block">
                                            <input name="" autocomplete="off" value="${record_address}" placeholder="任意字符，控制在255个字符内" class="layui-input" type="text">
                                        </div>
                                    </div>

                                </div>
                                <div class="layui-tab-item">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">姓名</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required placeholder="请输入博主姓名" autocomplete="off" class="layui-input ">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">年龄</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required  placeholder="请输入博主年龄" autocomplete="off" class="layui-input ">
                                        </div>
                                    </div>
                                    <div class="layui-form-item ">
                                        <label class="layui-form-label">职位</label>
                                        <div class="layui-input-block">
                                            <textarea name="desc" placeholder="请输入描述" class="layui-textarea"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-tab-item">
                                    <div class="layui-form-item ">
                                        <label class="layui-form-label">受限IP列表</label>
                                        <div class="layui-input-block">
                                            <textarea name="desc" placeholder="受限IP列表" class="layui-textarea"></textarea>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">登录次数</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="name" required  placeholder="最大登录失败次数" autocomplete="off" class="layui-input ">
                                        </div>
                                    </div>
                                </div>
                                <#--<div class="layui-tab-item">-->
                                    <#--<div class="layui-form-item">-->
                                        <#--<label class="layui-form-label">发送模式</label>-->
                                        <#--<div class="layui-input-block">-->
                                            <#--<input type="text" name="name" required  placeholder="最大登录失败次数" autocomplete="off" class="layui-input ">-->
                                        <#--</div>-->
                                    <#--</div>-->
                                    <#--<div class="layui-form-item">-->
                                        <#--<label class="layui-form-label">SPTM</label>-->
                                        <#--<div class="layui-input-block">-->
                                            <#--<input type="text" name="name" required  placeholder="SPTM服务器地址" autocomplete="off" class="layui-input ">-->
                                        <#--</div>-->
                                    <#--</div>-->
                                    <#--<div class="layui-form-item">-->
                                        <#--<label class="layui-form-label">SMTP端口</label>-->
                                        <#--<div class="layui-input-block">-->
                                            <#--<input type="text" name="name" required  placeholder="SMTP端口" autocomplete="off" class="layui-input ">-->
                                        <#--</div>-->
                                    <#--</div>-->

                                    <#--<div class="layui-form-item">-->
                                        <#--<label class="layui-form-label">发件邮箱</label>-->
                                        <#--<div class="layui-input-block">-->
                                            <#--<input type="text" name="name" required  placeholder="发件邮箱帐号" autocomplete="off" class="layui-input ">-->
                                        <#--</div>-->
                                    <#--</div>-->

                                    <#--<div class="layui-form-item">-->
                                        <#--<label class="layui-form-label">邮箱密码</label>-->
                                        <#--<div class="layui-input-block">-->
                                            <#--<input type="text" name="name" required  placeholder="发件邮箱密码" autocomplete="off" class="layui-input ">-->
                                        <#--</div>-->
                                    <#--</div>-->

                                    <#--<div class="layui-form-item">-->
                                        <#--<label class="layui-form-label">收件邮箱</label>-->
                                        <#--<div class="layui-input-block">-->
                                            <#--<input type="text" name="name" required  placeholder="收件邮箱" autocomplete="off" class="layui-input ">-->
                                        <#--</div>-->
                                    <#--</div>-->

                                <#--</div>-->
                                <div class="layui-tab-item">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">允许评论</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" name="checkbox" value="1" title="是">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">网站关闭</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" name="checkbox" value="1" title="是">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">开放注册</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" name="checkbox" value="1" title="是">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">开启缓存</label>
                                        <div class="layui-input-block">
                                            <input type="checkbox" name="checkbox" value="1" title="是">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
</body>

<!-- layui.js -->
<script src="${ctx!}/js/plugins/layui/layui.js"></script>
<!-- layui规范化用法 -->
<script type="text/javascript">
    layui.config({
        base: '${ctx!}/js/jcohy/'
    }).use('sys/index');
</script>
</html>