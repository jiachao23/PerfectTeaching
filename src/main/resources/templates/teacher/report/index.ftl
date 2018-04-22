<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <title>数据列表页面</title>
    <!-- layui.css -->
    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <style>
        tr td:not(:nth-child(0)),
        tr th:not(:nth-child(0)) {
            text-align: center;
        }
        /*可选*/
        .layui-laypage > * {
            float: left;
        }
        .layui-field-title .layui-field-box{
            padding: 10px 20px 10px 30px;
        }
        .layui-table-cell{
            padding-top: 4px;
            height: 45px;
        }
    </style>
</head>
<body>

<fieldset id="dataList" class="layui-elem-field layui-field-title sys-list-field">
    <legend style="text-align:center;">成绩报告管理</legend>
    <button class="layui-btn" style="position: relative;float: right;right: 100px;" onclick="javascript:location.replace(location.href)">
        <i class="layui-icon">&#x1002;</i>
    </button>
    <div style="padding: 40px 0px 0px 80px;">
        <div class="layui-inline">
            <div class="layui-input-inline" style="width:auto">
                <#--<a id="addProject" class="layui-btn layui-btn-normal">添加</a>-->
            </div>
        </div>
    </div>


    <div class="layui-field-box">
        <div id="dataContent" class="">

            <table class="layui-hide" id="report" lay-filter="table"></table>
            <script type="text/html" id="operator">
                <a class="layui-btn" lay-event="autoCheck">自动批改</a>
                <a class="layui-btn" lay-event="edit">添加批语</a>
                <a class="layui-btn layui-btn-danger " lay-event="del">删除</a>
            </script>
        </div>
    </div>
</fieldset>

<!-- layui.js -->
<script src="${ctx!}/js/plugins/layui/layui.js"></script>
<!-- layui规范化用法 -->
<script type="text/javascript">
    layui.config({
        base: '${ctx}/js/'
    }).use('teacher/report/index');
</script>
</body>
</html>