<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="user_toolbar2">
    <div style="padding: 10px; background-color: #fff;">
        <label>用户名：</label>
        <input class="easyui-textbox2" style="font-size: 9pt" type="text" id="search_user_name2">
        <button onclick="userListSearchForm()" type="button" class="easyui-linkbutton">搜索</button>
    </div>
    <div>
        <button onclick="userListAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</button>
        <button onclick="userListEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</button>
        <button onclick="userListRemove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</button>
    </div>
</div>
<table id="user_dg2"></table>
<script>
    //区域名称的模糊查询
    function userListSearchForm(){
        $('#user_dg2').datagrid('load',{
            username:$('#search_user_name2').val()
        });
    }

    function userListAdd() {
        ajhouse.addTabs('新增用户', 'user-add');
    }

    function userListEdit() {
        //console.log('edit');
        ajhouse.closeTabs('编辑区域');
        var selections = $('#user_dg2').datagrid('getSelections');
        if (selections.length != 1) {
            //客户没有选择记录
            $.messager.alert('提示', '请选中一条记录！');
            return;
        }
        //至少选中了一条记录
        $.messager.confirm('确认', '您确认想要编辑记录吗？', function (r) {
            if (r) {
                var id = selections[0].id;
                ajhouse.addTabs("编辑区域","users/"+id);
                //action方法
            }
        });
    }

    function userListRemove() {
        //console.log('remove');

        var selections = $('#user_dg2').datagrid('getSelections');
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
                    ids.push(selections[i].id);
                }
                //把ids异步提交到后台
                $.post(
                    'user/batch',
                    {'ids[]': ids},
                    function (data) {
                        $('#user_dg2').datagrid('reload');
                    },
                    'json'
                );
            }
        });
    }


    //初始化数据表格
    $('#user_dg2').datagrid({
        //允许多列排序
        //multiSort: true,
        //将工具栏添加到数据表格中
        toolbar: '#user_toolbar2',
        //请求远程服务器上的URL http://localhost:8080/bysj/...
        url: 'user/query',
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
            {field: 'uid', title: '编号', width: 100, sortable: true},
            {field: 'username', title: '用户名', width: 100, sortable: true},
            {field: 'password', title: '密码', width: 100, sortable: false},
            {field: 'createTime', title: '创建日期', width: 100 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LL');
            }},
            {field: 'role', title: '权限', width: 100 , sortable: true,formatter: function (value, row, index) {
                switch (value) {
                    case 0 :
                        return "普通用户";
                        break;
                    case 1:
                        return "管理员";
                        break;
                    default:
                        return "未知";
                        break;
                }
            }}
        ]]
    });

</script>

