<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="train_toolbar">
    <div style="padding: 10px; background-color: #fff;">
        <label>培训名称：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_train_name">
        <button onclick="trainListSearchForm()" type="button" class="easyui-linkbutton">搜索</button>
    </div>
    <div>
        <button onclick="trainListAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</button>
        <button onclick="trainListEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</button>
        <button onclick="trainListRemove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</button>
    </div>
</div>
<table id="train_dg"></table>
<script>
    //区域名称的模糊查询
    function trainListSearchForm(){
        $('#train_dg').datagrid('load',{
            tname:$('#search_train_name').val()
        });
    }

    function trainListAdd() {
        bysj.addTabs('新增培训记录', 'train-add');
    }

    function trainListEdit() {
        bysj.closeTabs('编辑培训记录');
        var selections = $('#train_dg').datagrid('getSelections');
        if (selections.length != 1) {
            //客户没有选择记录
            $.messager.alert('提示', '只能选中一条记录！');
            return;
        }
        //至少选中了一条记录
        $.messager.confirm('确认', '您确认想要编辑记录吗？', function (r) {
            if (r) {
                var tid = selections[0].tid;
                bysj.addTabs("编辑培训记录","train/update/"+tid);
                //action方法
            }
        });
    }

    function trainListRemove() {
        var selections = $('#train_dg').datagrid('getSelections');
        //console.log(selections);
        if (selections.length == 0) {
            //客户没有选择记录
            $.messager.alert('提示', '请至少选中一条记录！');
            return;
        }
        //至少选中了一条记录
        $.messager.confirm('确认', '您确认想要删除记录吗？', function (r) {
            if (r) {
                //为了存放id的集合
                var ids = [];
                //遍历选中的记录，将记录的id存放到js数组中
                for (var i = 0; i < selections.length; i++) {
                    ids.push(selections[i].tid);
                }
                //把ids异步提交到后台
                $.post(
                    'train/batch',
                    {'ids[]': ids},
                    function (data) {
                        $('#train_dg').datagrid('reload');
                    },
                    'json'
                );
            }
        });
    }


    //初始化数据表格
    $('#train_dg').datagrid({
        //允许多列排序
        //multiSort: true,
        //将工具栏添加到数据表格中
        toolbar: '#train_toolbar',
        //请求远程服务器上的URL http://localhost:8080/bysj/...
        url: 'train/query',
        //隔行变色，斑马线效果
        striped: true,
        //添加分页工具栏
        pagination: true,
        //每行的前面显示行号
        rownumbers: true,
        //使得数据表格自适应填充父容器
        fit: true,
        //默认显示10条，改为显示5条
        pageSize: 5,
        //分页列表
        pageList: [2,5,10,20, 50, 100],
        //列属性
        columns: [[
            {field: 'ck', checkbox: true},
            {field: 'tid', title: '培训编号', width: 100, sortable: true},
            {field: 'tname', title: '培训名称', width: 100, sortable: true},
            {field: 'purpose', title: '培训目的', width: 100, sortable: false},
            {field: 'begain', title: '培训开始时间', width: 100 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LL');
            }},
            {field: 'end', title: '培训结束时间', width: 100 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LL');
            }},
            {field: 'number', title: '培训人数', width: 100, sortable: false},
            {field: 'description', title: '培训记录', width: 100, sortable: false}
        ]]
    });

</script>

