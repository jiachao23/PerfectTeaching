<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 资料信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        .layui-form-item{
            margin: 20px 0 0 200px
        }

    </style>
</head>

<body>

<fieldset id="dataList" class="layui-elem-field layui-field-title sys-list-field">
    <legend style="text-align:center;">添加</legend>
</fieldset>
<div class="container-fluid larry-wrapper">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <section class="panel panel-padding">
                <form id="form1" class="layui-form "  lay-filter="form">

                    <div class="layui-form-item">
                        <input type="hidden" name="teacher"  value="${(Session.user.id?c)!}" >
                    </div>



                    <div class="layui-form-item" style="margin-top: 10px">
                        <label class="layui-form-label">课程/实验编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="num" lay-verify="number"  placeholder="请输入课程/实验编号" value="${book.lab.num}"
                                   autocomplete="off" class="layui-input ">
                        </div>
                    </div>



                    <#--<div class="layui-form-item">-->
                        <#--<label class="layui-form-label">上传目录</label>-->
                        <#--<div class="layui-input-inline">-->
                            <#--<select name="teacher" lay-filter="teacher" lay-verify="required">-->
                                <#--<option value="">请选择上传目录</option>-->
                            <#--<#list books as x>-->
                                <#--<option value="${x.id}"-->
                                    <#--<#if (book.uploadUrl == x.uploadUrl)> selected="selected" </#if>-->
                                <#-->${x.uploadUrl}</option>-->
                            <#--</#list>-->
                            <#--</select>-->
                        <#--</div>-->
                    <#--</div>-->


                    <div class="layui-form-item">
                        <label class="layui-form-label">上传</label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" id="upload">
                                <i class="layui-icon">&#xe67c;</i>上传课程资料
                            </button>
                            <input type="hidden" name="id" value="${book.id}">
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
                    </div>

                </form>
            </section>
        </div>
    </div>
</div>

<script src="${ctx!}/js/plugins/layui/layui.js"></script>
<script src="${ctx!}/js/common.js"></script>
<!-- layui规范化用法 -->
<script type="text/javascript">
    layui.config({
        base: '${ctx}/js/'
    }).use('teacher/resource/form');
</script>
</body>

</html>
