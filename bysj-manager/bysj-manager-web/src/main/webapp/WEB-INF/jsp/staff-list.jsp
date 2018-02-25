<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="staff_toolbar">
    <div style="padding: 10px; background-color: #fff;">
        <label>员工名：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_staff_name">
        <label>所属部门：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_staff_dname">
        <button onclick="staffListSearchForm()" type="button" class="easyui-linkbutton">搜索</button>
    </div>
    <div>
        <button onclick="staffListAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</button>
        <button onclick="staffListEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</button>
        <button onclick="staffListRemove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</button>
    </div>
</div>
<table id="staff_dg"></table>
<script>
    //区域名称的模糊查询
    function staffListSearchForm(){
        $('#staff_dg').datagrid('load',{
            name:$('#search_staff_name').val(),
            dname:$('#search_staff_dname').val()
        });
    }

    function staffListAdd() {
        bysj.addTabs('新增员工', 'staff-add');
    }

    function staffListEdit() {
        bysj.closeTabs('编辑员工');
        var selections = $('#staff_dg').datagrid('getSelections');
        if (selections.length != 1) {
            //客户没有选择记录
            $.messager.alert('提示', '只能选中一条记录！');
            return;
        }
        //至少选中了一条记录
        $.messager.confirm('确认', '您确认想要编辑记录吗？', function (r) {
            if (r) {
                var sid = selections[0].sid;
                bysj.addTabs("编辑员工","staff/update/"+sid);
                //action方法
            }
        });
    }

    function staffListRemove() {
        var selections = $('#staff_dg').datagrid('getSelections');
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
                    ids.push(selections[i].sid);
                }
                //把ids异步提交到后台
                $.post(
                    'staff/batch',
                    {'ids[]': ids},
                    function (data) {
                        $('#staff_dg').datagrid('reload');
                    },
                    'json'
                );
            }
        });
    }


    //初始化数据表格
    $('#staff_dg').datagrid({
        //允许多列排序
        //multiSort: true,
        //将工具栏添加到数据表格中
        toolbar: '#staff_toolbar',
        //请求远程服务器上的URL http://localhost:8080/bysj/...
        url: 'staff/query',
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
            {field: 'sid', title: '员工编号', width: 100, sortable: true},
            {field: 'did', title: '部门编号', width: 100, sortable: true},
            {field: 'dname', title: '所属部门', width: 100, sortable: true},
            {field: 'name', title: '员工名', width: 100, sortable: true},
            {field: 'gender', title: '性别', width: 100 , sortable: true,formatter: function (value, row, index) {
                switch (value) {
                    case 0 :
                        return "女";
                        break;
                    case 1:
                        return "男";
                        break;
                    default:
                        return "未知";
                        break;
                }
            }},
            {field: 'brithday', title: '出生日期', width: 100 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LL');
            }},
            {field: 'telephone', title: '手机号码', width: 100, sortable: false},
            {field: 'email', title: '电子邮箱', width: 100, sortable: false},
            {field: 'education', title: '学历', width: 100, sortable: false},
            {field: 'school', title: '毕业院校', width: 100, sortable: false},
            {field: 'nativeplace', title: '籍贯', width: 100, sortable: false},
            {field: 'address', title: '住址', width: 100, sortable: false},
            {field: 'position', title: '职称', width: 100, sortable: false},
            {field: 'pay', title: '工资/元', width: 100, sortable: false},
            {field: 'begin', title: '手机号码', width: 100, sortable: false},
            {field: 'begin', title: '入职日期', width: 100 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LL');
            }},
            {field: 'end', title: '合同到期日期', width: 100 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LL');
            }},
            {field: 'contract', title: '合同编号', width: 100, sortable: false},
            {field: 'other', title: '其他信息', width: 100, sortable: false}
        ]]
    });

</script>

