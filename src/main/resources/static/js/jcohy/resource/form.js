layui.define(['element', 'layer', 'form','upload'], function (exports) {
    var form = layui.form,
        upload = layui.upload,
        $ = layui.jquery;
    //自定义验证
    form.verify({
        name: function (value) {
            if (value.length <= 0 || value.length > 20) {
                return "名称必须1到00位"
            }
        },
        description:function (value) {
            if (value.length <= 1 || value.length > 100) {
                return "描述必须2到00位"
            }
        }

    });
    //监听登陆提交
    form.on('submit(add)', function (data) {
        // console.log(data.elem);//被执行事件的元素DOM对象，一般为button对象
        // console.log(data.form);//被执行提交的form对象，一般在存在form标签时才会返回
        // console.log(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "/admin/resource/save",
            data: data.field,
            success: function(ret){
                if(ret.isOk){
                    layer.msg("操作成功", {time: 2000},function(){
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index);
                        window.parent.location.href="/admin/resource/index";
                    });
                }else{
                    layer.msg(ret.msg, {time: 2000});
                }
            }
        });
        return false;
    });


    form.on('select(type)', function(data){
        // console.log(data.elem); //得到select原始DOM对象
        // console.log(data.value); //得到被选中的值
        // console.log(data.othis); //得到美化后的DOM对象
        var select = $("[name='category']");
        $.ajax({
            type:"GET",
            data:{"id":data.value},
            url:"/admin/category/type",
            async: false,
            success:function (ret) {
                $("[name='category'] option:gt(0)").remove();

                var option='';
                var data = ret.categories;
                for(var i=0;i<data.length;i++){
                    if(data[i].status == 1){
                        // option+='<option value='+data[i].id+'>'+data[i].name+'</option>';
                        option+='<option value="'+data[i].id+'">'+data[i].name+'</option></br>';
                    }else{
                        option+='<option value="'+data[i].id+'" disabled="">'+data[i].name+'</option></br>';
                    }
                }
                select.append(option);
            }
        });

        form.render('select','form');
    });

    //选完文件后不自动上传
    var Fileinfo = $('#FileInfo')
        ,uploadListIns = upload.render({
        elem: '#choose'
        ,url: '/upload/'
        ,auto: false
        //,multiple: true
        ,accept: 'file'
        ,bindAction: '#upload'
        ,choose: function(obj){
            var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
            //读取本地文件
            obj.preview(function(index, file, result){
                var tr = $(['<tr id="upload-'+ index +'">'
                    ,'<td>'+ file.name +'</td>'
                    ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
                    ,'<td>等待上传</td>'
                    ,'<td>'
                    ,'<button class="layui-btn layui-btn-mini reload layui-hide">重传</button>'
                    ,'<button class="layui-btn layui-btn-mini layui-btn-danger delete">删除</button>'
                    ,'</td>'
                    ,'</tr>'].join(''));

                //单个重传
                tr.find('.reload').on('click', function(){
                    obj.upload(index, file);
                });

                //删除
                tr.find('.delete').on('click', function(){
                    delete files[index]; //删除对应的文件
                    tr.remove();
                    uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                });

                Fileinfo.append(tr);
            });
        }
        ,done: function(res, index, upload){
            if(res.code == 0){ //上传成功
                var tr = Fileinfo.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                tds.eq(3).html(''); //清空操作
                return delete this.files[index]; //删除文件队列已经上传成功的文件
            }
            this.error(index, upload);
        }
        ,error: function(index, upload){
            var tr = Fileinfo.find('tr#upload-'+ index)
                ,tds = tr.children();
            tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
            tds.eq(3).find('.reload').removeClass('layui-hide'); //显示重传
        }
    });
    exports('resource/form', {});
});

