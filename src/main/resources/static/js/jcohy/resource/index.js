layui.define(['laypage', 'layer',  'table','common','form','util'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        util = layui.util,
        laypage = layui.laypage,
        common = layui.common,
        table  = layui.table ;
    table.render({
        elem: '#resource'
        ,height: 'full-200'
        ,method:'GET'
        ,url: '/admin/resource/list' //数据接口
        ,page: true //开启分页
        ,initSort: {
            field: 'type' //排序字段，对应 cols 设定的各字段名
            ,type: 'desc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
        }
        ,cols: [[ //表头
            {type: 'checkbox', align:'center',unresize:true}
            ,{field: 'type', align:'center', title: '类型',unresize:true,templet: '<div>{{ d.category.type.name }}</div>'}
            ,{field: 'category', align:'center', title: '分类',unresize:true,templet: '<div>{{ d.category.name }}</div>'}
            ,{field: 'name', align:'center', title: '名称',unresize:true}
            ,{field: 'description', align:'center', title: '描述',sort: true,unresize:true}
            ,{field: 'downloadUrl', align:'center', title: '下载地址',unresize:true}
            ,{field: 'visible', title: '状态', templet: '#choicesTpl'}
            ,{field: 'createDate', title: '创建日期',unresize:true,templet: '<div>{{# if(d.createDate!=null){ }}{{ layui.util.toDateString(d.createDate) }}{{# } }}</div>'}
            ,{fixed: 'right',  align:'center', toolbar: '#operator',unresize:true}
        ]]
    });
    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        // if(obj.event === 'detail'){
        //     common.frame_show('分类添加','/resource/form');
        //     // layer.msg('ID：'+ data.id + ' 的查看操作');
        // } else
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('分类编辑','/admin/resource/form?id='+data.id);
        }
    });
    //分页
    laypage.render({
        elem: 'pageDemo' //分页容器的id
        ,count: 100 //总页数
        ,skin: '#1E9FFF' //自定义选中色值
        //,skip: true //开启跳页
        ,jump: function(obj, first){
            if(!first){
                layer.msg('第'+ obj.curr +'页');
            }
        }
    });
    form.on('checkbox(status)', function(data){
        // console.log(data.elem); //得到checkbox原始DOM对象
        // console.log(data.elem.checked); //开关是否开启，true或者false
        // console.log(data.value); //开关value值，也可以通过data.elem.value得到
        // console.log(data.othis); //得到美化后的DOM对象
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"status"},
            url: "/admin/resource/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/admin/resource/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });

    //添加数据
    $('#addResource').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('分类添加','/admin/resource/form');
            // layer.msg('打开添加窗口');
        }, 500);
    });

    //批量删除数据
    $('#deleteAll').click(function () {
        var index = layer.load(1);

    });

    //输出接口，主要是两个函数，一个删除一个编辑
    var datalist = {
        deleteData: function (id) {
            layer.confirm('确定删除？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                del(id);
            }, function () {

            });
        },
        editData: function (id) {
            common.frame_show('分类编辑','/admin/resource/form?id='+id);
        }
    };
    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/admin/resource/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/admin/resource/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }
    exports('resource/index', datalist);
});