<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="user_toolbar">
    <div style="padding: 10px; background-color: #fff;">
        <label>用户名：</label>
        <input class="easyui-textbox2" style="font-size: 9pt" type="text" id="search_user_name">
        <button onclick="userListSearchForm()" type="button" class="easyui-linkbutton">搜索</button>
    </div>

</div>
<table id="user_dg"></table>
<script>
    //区域名称的模糊查询
    function userListSearchForm(){
        $('#user_dg').datagrid('load',{
            username:$('#search_user_name').val()
        });
    }

    //初始化数据表格
    $('#user_dg').datagrid({
        //允许多列排序
        //multiSort: true,
        //将工具栏添加到数据表格中
        toolbar: '#user_toolbar',
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

