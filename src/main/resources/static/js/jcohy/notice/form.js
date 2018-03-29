layui.define(['element', 'layer', 'form','laydate'], function (exports) {
    var form = layui.form,
        laydate = layui.laydate,
        $ = layui.jquery;
    //自定义验证
    form.verify({
        content: function (value) {
            if (value.length <= 0 || value.length > 200) {
                return "内容必须1到200位"
            }
        }

    });

    laydate.render({
        elem: '#start' //指定元素
        ,type:'datetime'
    });
    laydate.render({
        elem: '#end' //指定元素
        ,type:'datetime'
    });
    //监听登陆提交
    form.on('submit(add)', function (data) {
        // console.log(data.elem);//被执行事件的元素DOM对象，一般为button对象
        // console.log(data.form);//被执行提交的form对象，一般在存在form标签时才会返回
        // console.log(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/admin/notice/save",
            data: data.field,
            success: function(ret){
                console.log(ret);
                if(ret.isOk){
                    layer.msg("操作成功", {time: 2000},function(){
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index);
                        window.parent.location.href="/admin/notice/index";
                    });
                }else{
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        });
        return false;
    });

    exports('notice/form', {});
});

