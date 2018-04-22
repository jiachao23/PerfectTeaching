layui.define([ 'layer',  'table','common'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        table  = layui.table ;
    table.render({
        elem: '#report'
        ,height: 'full-200'
        ,method:'GET'
        ,url: '/report/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'labNum', align:'center', title: '实验/课程编号',unresize:true,templet: '<div>{{d.lab.num}}</div>'}
            ,{field: 'labName', align:'center', title: '实验/课程主题',unresize:true,templet: '<div>{{d.lab.name}}</div>'}
            ,{field: 'studentNum', align:'center', title: '学生学号',unresize:true,templet: '<div>{{d.student.num}}</div>'}
            ,{field: 'studentName', align:'center', title: '学生姓名',unresize:true,templet: '<div>{{d.student.name}}</div>'}
            ,{field: 'option', align:'center', title: '学生选项',unresize:true}
            ,{field: 'grade', align:'center', title: '分数',unresize:true}
            ,{field: 'remark', align:'center', title: '评语',unresize:true}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true,width:300}
        ]]
    });

    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'autoCheck'){
           autoCheck(data.id);
        }else if(obj.event === 'edit'){
            edit(data.id);
        }
    });
    function edit(id) {
        layer.prompt('请输入意见',function(val, index){
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/report/change/" + id + "?advise="+val,
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/teacher/report/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }

    function autoCheck(id) {
        var index = layer.load(0, {shade: false});
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/report/autoCheck/"+id,
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/teacher/report/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
    }

    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/teacher/report/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/teacher/report/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }


    exports('teacher/report/index');
});