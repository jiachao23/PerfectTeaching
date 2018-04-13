layui.define([ 'layer',  'table','common'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        table  = layui.table ;
    table.render({
        elem: '#teacher'
        ,height: 'full-200'
        ,method:'GET'
        ,url: '/teacher/project/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {type: 'checkbox', align:'center',unresize:true}
            ,{field: 'name', align:'center', title: '项目名',unresize:true}
            ,{field: 'proResource', align:'center', title: '项目来源',unresize:true}
            ,{field: 'moneyResource', align:'center', title: '经费来源',unresize:true}
            ,{field: 'desc', align:'center', title: '项目描述',unresize:true}
            ,{field: 'teacher', title: '指导老师',unresize:true,templet: '<div>{{d.teacher.name}}</div>'}
            ,{title: '项目状态',templet: '#status',unresize:true}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true}
        ]]
    });

    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('编辑','/teacher/form?id='+data.id);
        }
    });

    //添加数据
    $('#addProject').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('添加','/teacher/form');
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
            common.frame_show('编辑','/teacher/form?id='+id);
        }
    };
    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/teacher/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/teacher/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }
    exports('teacher/index', datalist);
});