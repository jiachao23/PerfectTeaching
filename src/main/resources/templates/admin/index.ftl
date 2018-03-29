<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Jcohy后台管理系统</title>
    <link rel="shortcut icon" href="${ctx!}/images/ico/jcohy.png" type="image/x-icon">
    <!-- layui.css -->
    <link href="${ctx!}/js/plugins/layui/css/layui.css" rel="stylesheet" />
    <!-- 本页样式 -->
    <link href="${ctx!}/css/jcohy/index.css" rel="stylesheet" />
</head>
<body>
    <div class="mask"></div>
    <div class="main">
        <h1><span style="font-size: 84px;">J</span><span style="font-size:30px;">cohy</span></h1>
        <p id="time"></p>
        <div class="enter">
            Please&nbsp;&nbsp;Click&nbsp;&nbsp;Enter
        </div>
    </div>
    <!-- layui.js -->
    <script src="${ctx!}/js/plugins/layui/layui.js"></script>
    <!-- layui规范化用法 -->
    <script type="text/javascript">
        layui.config({
            base: '${ctx!}/js/jcohy/'
        }).use('index');
    </script>
</body>
</html>