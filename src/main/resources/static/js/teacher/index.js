﻿layui.define(['laypage', 'layer', 'table','form','laytpl','common','util'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        form = layui.form,
        util = layui.util,
        laytpl = layui.laytpl,
        table = layui.table,
        common = layui.common;
    var laypageId = 'pageNav';

    table.render({
        elem: '#labs'
        ,height: 'full-200'
        ,method:'GET'
        ,url: '/admin/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {type: 'checkbox', align:'center',unresize:true}
            ,{field: 'num', align:'center', title: '实验编号',unresize:true}
            ,{field: 'name', align:'center', title: '实验名',unresize:true}
            ,{field: 'content', align:'center', title: '实验内容',unresize:true}
            ,{field: 'teacher', align:'center', title: '指导老师',unresize:true,templet: '<div>{{d.teacher.name}}</div>'}
            ,{field: 'start', title: '开始时间',unresize:true}
            ,{field: 'end', title: '结束时间',unresize:true}
            ,{title: 'end',templet: '#choicesTpl',unresize:true}
            ,{fixed: 'right',  title:'操作',align:'center', toolbar: '#operator',unresize:true}
        ]]
    });

    table.on('tool(table)', function(obj){
        var data = obj.data;
        // if(obj.event === 'detail'){
        //     com.jcohy.perfectteaching.common.frame_show('分类添加','/category/form','720','430');
        //     // layer.msg('ID：'+ data.id + ' 的查看操作');
        // } else
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('文章编辑','/admin/blog/form?id='+data.id,$(window).width(),$(window).height());
        }
    });

    //监听置顶CheckBox
    form.on('checkbox(isTop)', function (data) {
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"isTop"},
            url: "/admin/blog/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/admin/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });


    //监听推荐CheckBox
    form.on('checkbox(isRecommend)', function (data) {
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"isRecommend"},
            url: "/admin/blog/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/admin/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });

//监听推荐CheckBox
    form.on('checkbox(isCommend)', function (data) {
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"isCommend"},
            url: "/admin/blog/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/admin/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });

    //监听私密CheckBox
    form.on('checkbox(privacy)', function (data) {
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {"type":"privacy"},
            url: "/admin/blog/" + data.value + "/change",
            success: function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    });

    //添加数据
    $('#addArticle').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('文章添加','/admin/blog/form',$(window).width(),$(window).height());
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
                // layer.msg('删除Id为【' + id + '】的数据');
            }, function () {

            });
        },
        editData: function (id) {
            common.frame_show('文章编辑','/admin/blog/form?id='+id,$(window).width(),$(window).height());
            // layer.msg('编辑Id为【' + id + '】的数据');
        }
    };

    function del(id) {
        $.ajax({
            method:"DELETE",
            dataType:"JSON",
            url:"/admin/blog/"+id+"/del",
            success:function (ret) {
                if (ret.isOk) {
                    layer.msg("操作成功", {time: 2000}, function () {
                        layer.close(index);
                        window.location.href = "/admin/blog/index";
                    });
                } else {
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        })
    }

    exports('lab/index', datalist);
});