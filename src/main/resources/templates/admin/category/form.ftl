<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title> - 分类信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        .layui-form-item{
            margin: 50px 0 0 200px
        }

    </style>
</head>

<body>

<fieldset id="dataList" class="layui-elem-field layui-field-title sys-list-field">
    <legend style="text-align:center;">分类添加</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
            <input type="hidden" name="id"  value="${(category.id)!}" >
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="name" placeholder="请输入分类名称" value="${(category.name)!}"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <#--<input type="hidden" name="count" value="${(category.count)}">-->
    <#--<input type="hidden" name="status" value="${(category.status)}">-->
    <#--<input type="hidden" name="keyword" value="${(category.keyword)}">-->
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-inline">
            <select name="type" lay-filter="type">
                <option value="">请选择类型</option>
            <#list types as x>
                <option value="${(x.id)!}"
                    <#if (x.name == category.type.name)> selected="selected" </#if>
                >${(x.name)!}</option>
            </#list>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
    </div>
</form>

<script src="${ctx!}/js/plugins/layui/layui.js"></script>
<script src="${ctx!}/js/jcohy/common.js"></script>
<!-- layui规范化用法 -->
<script type="text/javascript">
    layui.config({
        base: '${ctx}/js/jcohy/'
    }).use('category/form');
</script>
</body>

</html>
