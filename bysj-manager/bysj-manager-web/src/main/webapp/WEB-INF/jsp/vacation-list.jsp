<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div id="vacation_toolbar">
    <div style="padding: 10px; background-color: #fff;">
        <label>员工编号：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_vacation_id">
        <label>员工姓名：</label>
        <input class="easyui-textbox" style="font-size: 9pt" type="text" id="search_vacation_name">
        <button onclick="vacationListSearchForm()" type="button" class="easyui-linkbutton">搜索</button>
    </div>
    <div>
        <button onclick="vacationListAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</button>
        <button onclick="vacationListEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">编辑</button>
        <button onclick="vacationListRemove()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</button>
    </div>
</div>
<table id="vacation_dg"></table>
<script>
    //名称的模糊查询
    function vacationListSearchForm(){
        $('#vacation_dg').datagrid('load',{
            id:$('#search_vacation_id').val(),
            name:$('#search_vacation_name').val()
        });
    }

    function vacationListAdd() {
        bysj.addTabs('新增请假记录', 'vacation-add');
    }

    function vacationListEdit() {
        bysj.closeTabs('编辑请假记录');
        var selections = $('#vacation_dg').datagrid('getSelections');
        if (selections.length != 1) {
            //客户没有选择记录
            $.messager.alert('提示', '只能选中一条记录！');
            return;
        }
        //至少选中了一条记录
        $.messager.confirm('确认', '您确认想要编辑记录吗？', function (r) {
            if (r) {
                var vid = selections[0].vid;
                bysj.addTabs("编辑请假记录","vacation/update/"+vid);
                //action方法
            }
        });
    }

    function vacationListRemove() {
        var selections = $('#vacation_dg').datagrid('getSelections');
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
                    ids.push(selections[i].vid);
                }
                //把ids异步提交到后台
                $.post(
                    'vacation/batch',
                    {'ids[]': ids},
                    function (data) {
                        $('#vacation_dg').datagrid('reload');
                    },
                    'json'
                );
            }
        });
    }

    //初始化数据表格
    $('#vacation_dg').datagrid({
        //允许多列排序
        //multiSort: true,
        //将工具栏添加到数据表格中
        toolbar: '#vacation_toolbar',
        //请求远程服务器上的URL http://localhost:8080/bysj/...
        url: 'vacation/query',
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
            {field: 'vid', title: '请假记录编号', width: 100, sortable: true},
            {field: 'sid', title: '员工编号', width: 100, sortable: true},
            {field: 'name', title: '员工姓名', width: 100, sortable: true},
            {field: 'begin', title: '开始时间', width: 200 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LLL');
            }},
            {field: 'end', title: '结束时间', width: 200 , sortable: true,formatter: function (value, row, index) {
                return moment(value).format('LLL');
            }},
            {field: 'reason', title: '请假原因', width: 100, sortable: true},
            {field: 'approver', title: '审批人', width: 100, sortable: true},
            {field: 'agree', title: '是否同意', width: 100 , sortable: true,formatter: function (value, row, index) {
                switch (value) {
                    case 0 :
                        return "不同意";
                        break;
                    case 1:
                        return "同意";
                        break;
                    case 9:
                        return "待审核";
                        break;
                    default:
                        return "未知";
                        break;
                }
            }}
        ]]
    });

</script>

