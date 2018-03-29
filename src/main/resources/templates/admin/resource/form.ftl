<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 资源信息</title>
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
    <legend style="text-align:center;">资源添加</legend>
</fieldset>

<form class="layui-form layui-form-pane" action="" lay-filter="form">
    <div class="layui-form-item">
            <input type="hidden" name="id"  value="${(resource.id)!}" >
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 170px">资源名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="name" placeholder="请输入名称" value="${(resource.name)!}"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-upload">
            <button type="button" class="layui-btn layui-btn-normal" id="choose">选择文件</button>
            <div class="layui-upload-list" style="margin-right: 200px">
                <table class="layui-table">
                    <thead>
                    <tr><th>文件名</th>
                        <th>大小</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr></thead>
                    <tbody id="FileInfo"></tbody>
                </table>
            </div>
            <button type="button" class="layui-btn" id="upload">开始上传</button>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">请选择分类</label>
        <div class="layui-input-inline">
            <select name="type" lay-filter="type">
                <option value="">请选择大分类</option>
                <#list types as x>
                    <option value="${(x.id)!}"
                        <#if (x.name == resource.category.type.name)> selected="selected" </#if>
                    >${(x.name)!}</option>
                </#list>
            </select>
        </div>
        <div class="layui-input-inline">
            <select name="category" lay-filter="category">
                <option value="">请选择小分类</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <div style="margin-right: 200px">
            <label class="layui-form-label">描述</label>
            <div class="layui-input-block">
            <textarea placeholder="请输入内容,2-100" class="layui-textarea" name="description" lay-verify="description"
                      value="${(resource.description)!}"></textarea>
            </div>
        </div>

    </div>
    <#--<div class="layui-form-item">-->
        <#--<label class="layui-form-label"  style="width: 170px">资源描述</label>-->
        <#--<div class="layui-input-inline">-->
            <#--<input type="text" name="description" lay-verify="description" placeholder="请输入公告名称" -->
                   <#--autocomplete="off" class="layui-input">-->
        <#--</div>-->
    <#--</div>-->

    <#if resource.id == null>
        <div class="layui-form-item">
            <label class="layui-form-label"  style="width: 170px">是否可见</label>
            <div class="layui-input-block">
                <input type="checkbox" name="visible" lay-skin="switch" lay-text="ON|OFF" value="1" checked>
            </div>
        </div>
    </#if>


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
    }).use('resource/form');
</script>
</body>

</html>
