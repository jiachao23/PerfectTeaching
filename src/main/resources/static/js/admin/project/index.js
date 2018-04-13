layui.define([ 'layer',  'table','common'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,
        table  = layui.table ;
    table.render({
        elem: '#project'
        ,height: 'full-200'
        ,method:'GET'
        ,url: '/project/all' //数据接口
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
        }else if(obj.event === 'pass'){
            changeStatus(data.id);
        }else if(obj.event === 'recall'){
            changeStatus(data.id);
        }else if(obj.event === 'detail'){
            if($("#detail-view-"+data.id).length > 0){
                $("#detail-view-"+data.id).hide();
                $("#detail-view-"+data.id).remove();
            }else{
                createHtml(obj);
                $("#detail-view-"+data.id).show();
            }
        }
    });

    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/admin/project/" + id + "/del",
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/admin/project/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }

    function changeStatus(id) {
        layer.prompt('请输入意见',function(val, index){
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/project/change/" + id + "?advise="+val,
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/admin/project/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }

    function createHtml(obj) {
        var data = obj.data;
        var detailHtml = '';
        detailHtml += '<tr class="detail-view" style="display: none" id="detail-view-'+data.id+'">';
        detailHtml += '<td colspan="8"><blockquote class="layui-elem-quote" style="line-height: 30px;text-align:left;padding-left: 30px;">';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">指导老师电话:</div>'+data.teacher.phone+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">指导老师地址:</div>'+data.teacher.address+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">指导老师简历:</div>'+data.teacher.resume+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">专家电话:</div>'+data.expert.phone+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">专家地址:</div>'+data.expert.address+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">专家简历:</div>'+data.expert.resume+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">专家意见:</div>'+data.ereason+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">管理员员意见:</div>'+data.areason+'</br>';
        detailHtml += '<div class="layui-inline layui-word-aux" style="width: 150px">创意说明书下载地址:</div><a href="'+data.book.downloadUrl+'">'+data.book.downloadUrl+'</a></br>';
        detailHtml += '</blockquote></td></tr>';
        obj.tr.after(detailHtml);
    }

    exports('admin/project/index');
});