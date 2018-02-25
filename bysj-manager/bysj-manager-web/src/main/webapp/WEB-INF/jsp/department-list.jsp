<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="department_toolbar">
    <div style="padding: 10px; background-color: #fff;">
        <label>部门名：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_department_name">
        <button onclick="departmentListSearchForm()" type="button" class="easyui-linkbutton">搜索</button>
    </div>
    <div>
        <button onclick="departmentListAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</button>
        <button onclick="departmentListEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</button>
        <button onclick="departmentListRemove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</button>
    </div>
</div>
<table id="department_dg"></table>
<script>
    //区域名称的模糊查询
    function departmentListSearchForm(){
        $('#department_dg').datagrid('load',{
            dname:$('#search_department_name').val()
        });
    }

    function departmentListAdd() {
        bysj.addTabs('新增部门', 'department-add');
    }

    function departmentListEdit() {
            bysj.closeTabs('编辑部门');
            var selections = $('#department_dg').datagrid('getSelections');
            if (selections.length != 1) {
                //客户没有选择记录
                $.messager.alert('提示', '只能选中一条记录！');
                return;
            }
            //至少选中了一条记录
            $.messager.confirm('确认', '您确认想要编辑记录吗？', function (r) {
                if (r) {
                    var did = selections[0].did;
                    bysj.addTabs("编辑部门","department/update/"+did);
                    //action方法
                }
            });
    }

    function departmentListRemove() {
        var selections = $('#department_dg').datagrid('getSelections');
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
                    ids.push(selections[i].did);
                }
                //把ids异步提交到后台
                $.post(
                    'department/batch',
                    {'ids[]': ids},
                    function (data) {
                        $('#department_dg').datagrid('reload');
                    },
                    'json'
                );
            }
        });
    }


    //初始化数据表格
    $('#department_dg').datagrid({
        //允许多列排序
        //multiSort: true,
        //将工具栏添加到数据表格中
        toolbar: '#department_toolbar',
        //请求远程服务器上的URL http://localhost:8080/bysj/...
        url: 'department/query',
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
            {field: 'did', title: '部门编号', width: 100, sortable: true},
            {field: 'dname', title: '部门名', width: 100, sortable: true},
            {field: 'number', title: '部门人数', width: 100, sortable: false},
            {field: 'createtime', title: '部门创建日期', width: 100 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LL');
            }},
            {field: 'description', title: '部门介绍', width: 100, sortable: false}
        ]]
    });

</script>

