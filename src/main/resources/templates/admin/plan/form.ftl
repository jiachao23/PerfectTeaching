<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 课程计划</title>
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
                        <input type="hidden" name="id"  value="${(plan.id)!}" >
                    </div>
                    <div class="layui-form-item">
                        <input type="hidden" name="teacher"  value="${(Session.user.id?c)!}" >
                    </div>
                    <div class="layui-form-item" style="margin-top: 10px">
                        <label class="layui-form-label">课程/实验编号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="num" lay-verify="number"  placeholder="请输入课程编号" value="${plan.lab.num}"
                                   autocomplete="off" class="layui-input ">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">请选择院系专业</label>
                        <div class="layui-input-inline">
                            <select name="dept" lay-filter="depts">
                                <option value="">请选择院系</option>
                                <#list depts as x>
                                    <option value="${x.id}"
                                        <#if (plan.dept.name == x.name)> selected="selected" </#if>
                                    >${x.name}</option>
                                </#list>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select name="major" lay-filter="majors">
                                <option value="">请选择专业</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">计划内容</label>
                        <div class="layui-input-block">
                            <textarea name="content" placeholder="请输入内容" class="layui-textarea">${plan.content}</textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">开始时间</label>
                        <div class="layui-input-inline">
                            <input type="text" name="start" value="${(plan.start)!}" class="layui-input" id="start" lay-verify="required">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">结束时间</label>
                        <div class="layui-input-inline">
                            <input type="text" name="end" value="${(plan.end)!}" class="layui-input" id="end" lay-verify="required">
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
    }).use('admin/plan/form');
</script>
</body>

</html>
