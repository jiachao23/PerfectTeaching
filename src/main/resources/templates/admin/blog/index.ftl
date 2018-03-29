﻿<!DOCTYPE html>
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
    <#--<fieldset id="dataConsole" class="layui-elem-field layui-field-title">-->
       <#---->
    <#--</fieldset>-->

    <fieldset id="dataList" class="layui-elem-field layui-field-title sys-list-field">

        <legend>文章管理</legend>
        <div class="layui-field-box">
            <div id="articleIndexTop">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item" style="margin:0;margin-top:15px;">
                        <div class="layui-inline">
                            <label class="layui-form-label">分类</label>

                            <div class="layui-input-inline">
                                <select name="city">
                                    <option value="0"></option>
                                    <option value="1">类别1</option>
                                    <option value="2">类别2</option>
                                    <option value="3">类别3</option>
                                </select>
                            </div>

                            <label class="layui-form-label">关键词</label>
                            <div class="layui-input-inline">
                                <input type="text" name="keywords" autocomplete="off" class="layui-input">
                            </div>
                            <div class="layui-input-inline" style="width:auto">
                                <button class="layui-btn" lay-submit lay-filter="formSearch">搜索</button>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-input-inline" style="width:auto">
                                <a id="addArticle" class="layui-btn layui-btn-normal">发表文章</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <legend style="text-align:center;">文章列表</legend>
        <div class="layui-field-box">
            <div id="dataContent" class="">
                <table class="layui-hide" id="blog" lay-filter="table"></table>
                <script type="text/html" id="operator">
                    <a class="layui-btn" lay-event="edit">编辑</a>
                    <a class="layui-btn layui-btn-danger " lay-event="del">删除</a>
                </script>

                <script type="text/html" id="choicesTpl">
                    <form class="layui-form" action="">
                        <div class="layui-form-item" style="margin:0;">
                            {{#  if(d.isTop == 1){ }}
                            <input type="checkbox" name="isTop" title="置顶" value="{{d.id}}" lay-filter="isTop" checked />
                            {{#  } else { }}
                            <input type="checkbox" name="isTop" title="置顶" value="{{d.id}}" lay-filter="isTop" />
                            {{#  } }}
                            {{#  if(d.isCommend == 1){ }}
                            <input type="checkbox" name="isCommend" title="推荐" value="{{d.id}}" lay-filter="isCommend" checked />
                            {{#  } else { }}
                            <input type="checkbox" name="isCommend" title="推荐" value="{{d.id}}" lay-filter="isCommend" />
                            {{#  } }}
                            {{#  if(d.privacy == 1){ }}
                            <input type="checkbox" name="privacy" title="公开" value="{{d.id}}" lay-filter="privacy"  checked  />
                            {{#  } else { }}
                            <input type="checkbox" name="privacy" title="公开" value="{{d.id}}" lay-filter="privacy" />
                            {{#  } }}

                        </div>
                    </form>
                    <#--<button class="layui-btn layui-btn-small layui-btn-normal" onclick="layui.datalist.editData({{d.id}})"><i class="layui-icon">&#xe642;</i></button>-->
                </script>
            </div>
        </div>
    </fieldset>
    <!-- layui.js -->
    <script src="${ctx!}/js/plugins/layui/layui.js"></script>

    <!-- layui规范化用法 -->
    <script type="text/javascript">
        layui.config({
            base: '${ctx}/js/jcohy/'
        }).use('blog/index');
    </script>
</body>
</html>