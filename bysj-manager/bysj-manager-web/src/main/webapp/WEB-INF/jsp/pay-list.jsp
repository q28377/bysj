<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="pay_toolbar">
    <div style="padding: 10px; background-color: #fff;">
        <label>员工编号：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_pay_sid">
        <label>员工姓名：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_pay_name">
        <button onclick="payListSearchForm()" type="button" class="easyui-linkbutton">搜索</button>
    </div>
    <div>
        <button onclick="payListAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</button>
        <button onclick="payListEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</button>
        <button onclick="payListRemove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</button>
    </div>
</div>
<table id="pay_dg"></table>
<script>
    //名称的模糊查询
    function payListSearchForm(){
        $('#pay_dg').datagrid('load',{
            sid:$('#search_pay_sid').val(),
            name:$('#search_pay_name').val()
        });
    }

    function payListAdd() {
        bysj.addTabs('新增工资记录', 'pay-add');
    }

    function payListEdit() {
        bysj.closeTabs('编辑工资记录');
        var selections = $('#pay_dg').datagrid('getSelections');
        if (selections.length != 1) {
            //客户没有选择记录
            $.messager.alert('提示', '只能选中一条记录！');
            return;
        }
        //至少选中了一条记录
        $.messager.confirm('确认', '您确认想要编辑记录吗？', function (r) {
            if (r) {
                var pid = selections[0].pid;
                bysj.addTabs("编辑工资记录","pay/update/"+pid);
                //action方法
            }
        });
    }

    function payListRemove() {
        var selections = $('#pay_dg').datagrid('getSelections');
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
                    ids.push(selections[i].pid);
                }
                //把ids异步提交到后台
                $.post(
                    'pay/batch',
                    {'ids[]': ids},
                    function (data) {
                        $('#pay_dg').datagrid('reload');
                    },
                    'json'
                );
            }
        });
    }

    //初始化数据表格
    $('#pay_dg').datagrid({
        //允许多列排序
        //multiSort: true,
        //将工具栏添加到数据表格中
        toolbar: '#pay_toolbar',
        //请求远程服务器上的URL http://localhost:8080/bysj/...
        //url: 'staff/query',
        url: 'pay/query',
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
            {field: 'pid', title: '工资记录编号', width: 100, sortable: true},
            {field: 'sid', title: '员工编号', width: 100, sortable: true},
            {field: 'name', title: '员工姓名', width: 100, sortable: true},
            {field: 'basic', title: '基本工资/元', width: 100, sortable: true},
            {field: 'eat', title: '饭补/元', width: 100, sortable: true},
            {field: 'house', title: '房补/元', width: 100, sortable: true},
            {field: 'other', title: '其他补助金/元', width: 100, sortable: true},
            {field: 'bonus', title: '奖金/元', width: 100, sortable: true},
            {field: 'penalty', title: '罚金/元', width: 100, sortable: true},
            {field: 'totalMoney', title: '总计/元', width: 100, sortable: true}
        ]]
    });

</script>

