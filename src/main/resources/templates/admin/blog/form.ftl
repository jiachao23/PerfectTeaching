<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- layui.css -->
    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${ctx!}/css/bootstrap.min.css?v=v3.3.7" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx!}/css/iconfont.css?v=1.0.1" media="all">
    <style type="text/css">
        .layui-form-label {
            width: 150px;
        }
        p{
            margin: 0;
            padding: 0;
        }
        .layui-input-block {
            margin-left: 150px;
        }
        .tag,
        .tag-defined {
            display: inline-block;
            position: relative;
            padding: 0 20px;
            border: 1px solid #DDD;
            border-radius: 2px;
            cursor: pointer;
            line-height: 36px;
            margin: 0 10px 10px 0;
        }

        .tag-selected {
            border: 1px solid #5FB878;
            color: #5FB878;
        }

        .tick-box {
            display: none;
        }

        .tag .tick-bg {
            position: absolute;
            right: 0;
            bottom: 0;
            border: 10px solid;
            border-color: transparent #5FB878 #5FB878 transparent;
        }

        .tag .tick {
            position: absolute;
            right: 0;
            bottom: -12px;
            font-size: 10px;
            color: #FFF;
        }
        .imgbox {
            line-height: 120px;
            height: 120px;
            width: 120px;
        }

    </style>
</head>
<body>

    <div class="container-fluid larry-wrapper">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <section class="panel panel-padding">
                    <form id="form1" class="layui-form "  lay-filter="form">
                        <div class="layui-form-item" style="margin-top: 10px">
                            <label class="layui-form-label">文章标题</label>
                            <div class="layui-input-block">
                                <input type="text" name="title" lay-verify="required"  placeholder="请输入标题" value="${blog.title}"
                                       autocomplete="off" class="layui-input ">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">关键字</label>
                            <div class="layui-input-block">
                                <input type="text" name="keyword" lay-verify="required" placeholder="请输入关键字，多个请用英文逗号隔开" value="${blog.keyword}"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item ">
                            <label class="layui-form-label">描述</label>
                            <div class="layui-input-block">
                                <textarea name="summary" placeholder="请输入描述" lay-verify="required" class="layui-textarea">${blog.summary}</textarea>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">请选择分类</label>
                            <div class="layui-input-inline">
                                <select name="type" lay-filter="type">
                                    <option value="">请选择大分类</option>
                                <#list types as x>
                                    <option value="${x.id}"
                                        <#if (blog.name == x.name)> selected="selected" </#if>
                                    >${x.name}</option>
                                </#list>
                                </select>
                            </div>
                            <div class="layui-input-inline">
                                <select name="category" lay-filter="category">
                                    <option value="">请选择小分类</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item ">
                            <label class="layui-form-label">作者</label>
                            <div class="layui-input-inline">
                                <input type="hidden" name="author" value="${loginUser.id}">
                                <input class="layui-input layui-disabled" type="text" placeholder="请输入作者" value="${loginUser.name}"
                                       lay-verify="required" autocomplete="off">
                            </div>
                        </div>

                        <div class="layui-form-item ">
                            <label class="layui-form-label">来源</label>
                            <div class="layui-input-block">
                                <input type="text" name="url" placeholder="请输入文章来源" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item" pane>
                            <label class="layui-form-label">推荐</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="isCommend" title="否" value="0" checked/>
                                <input type="radio" name="isCommend" title="是" value="1" />
                            </div>
                        </div>

                        <div class="layui-form-item" pane>
                            <label class="layui-form-label">置顶</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="isTop" title="否" value="0" checked />
                                <input type="radio" name="isTop" title="是" value="1"  />
                            </div>
                        </div>

                        <div class="layui-form-item" pane>
                            <label class="layui-form-label">公开</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="privacy" title="否" value="0" checked />
                                <input type="radio" name="privacy" title="是" value="1"  />
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">tag标签</label>
                            <div class="layui-input-block">
                                <#list tags as x>
                                <div class="tag" data-id="${x.id}">
                                    <p class="text">${x.name}</p>
                                    <p class="tick-box">
                                        <span class="tick-bg"></span>
                                        <i class="layui-icon tick">&#xe618;</i>
                                    </p>
                                </div>
                                </#list>

                                <div class="tag-defined">自定义标签</div>

                                <input type="hidden" name="tags" value="" data-count="5">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">上传图片</label>
                            <div class="layui-input-block">
                                <button type="button" class="layui-btn" id="upload">
                                    <i class="layui-icon">&#xe67c;</i>上传图片
                                </button>
                                <input type="hidden" name="coverURL">
                            </div>

                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">内容</label>
                            <div class="layui-input-block">
                                <script id="content" name="content" type="text/plain"></script>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="add">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </section>
        </div>
    </div>
</div>
<!-- layui.js -->
<script src="${ctx!}/js/plugins/layui/layui.js"></script>
<!-- layui规范化用法 -->
<script type="text/javascript" charset="utf-8" src="${ctx!}/js/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx!}/js/plugins/ueditor/ueditor.all.min.js"> </script>

<script type="text/javascript">
    //实例化编辑器
    var ue = UE.getEditor('content');
    layui.config({
        base: '${ctx}/js/jcohy/'
    }).use('blog/form');
</script>
</body>

</html>