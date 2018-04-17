layui.define([ 'layer',  'table','common','util'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        util = layui.util,
        table  = layui.table ;
    table.render({
        elem: '#lab'
        ,height: 'full-200'
        ,method:'GET'
        ,url: '/teacher/lab/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'num', align:'center', title: '实验编号',unresize:true}
            ,{field: 'name', align:'center', title: '实验主题',unresize:true}
            ,{field: 'content', align:'center', title: '实验内容',unresize:true}
            ,{field: 'start', align:'center', title: '开始时间',unresize:true,templet: '<div>{{# if(d.start!=null){ }}{{ layui.util.toDateString(d.start) }}{{# } }}</div>'}
            ,{field: 'end', align:'center', title: '结束时间',unresize:true,templet: '<div>{{# if(d.end!=null){ }}{{ layui.util.toDateString(d.end) }}{{# } }}</div>'}
            ,{field: 'teacher', title: '指导老师',unresize:true,templet: '<div>{{d.teacher.name}}</div>'}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true}
        ]]
    });

    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('编辑','/teacher/lab/form?id='+data.id);
        }
    });

    //添加数据
    $('#addProject').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('添加','/teacher/lab/form');
            // layer.msg('打开添加窗口');
        }, 500);
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
            common.frame_show('编辑','/teacher/lab/form?id='+id);
        }
    };
    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/teacher/lab/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/teacher/lab/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }
    exports('teacher/lab/index', datalist);
});