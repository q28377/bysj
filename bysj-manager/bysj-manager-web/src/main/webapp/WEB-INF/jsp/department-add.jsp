<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="新增部门" data-options="fit:true">
    <form class="departmentForm" id="departmentAddForm" name="departmentAddForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">部门名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="dname" name="dname"
                           data-options="required:true" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">部门人数：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="number" name="number"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>
            <tr>
                <td class="label">部门创建日期：</td>
                <td>
                    <input type="text" id="time" name="time" onClick="WdatePicker()"
                           style="width:200px"/>
                </td>
            </tr>
            <tr>
                <td class="label">部门介绍：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="description" name="description"
                           data-options="required:false" style="width:200px">
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="departmentAddSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="departmentAddClearForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-undo'">重置
                    </button>
                </td>
            </tr>

        </table>
        <!--<input name="paramData" id="paramData" style="display:none;">-->
    </form>
</div>
<script src="js/My97DatePicker/WdatePicker.js"></script>
<script>
    //加载权限的下拉框
    /*$('#role').combotree({
        url: 'citiesCats',
        required: true
    });*/

    //重置
    function departmentAddClearForm() {
        bysj.refreshTab('新增部门');
    }

    //提交表单
    function departmentAddSubmitForm(){
        $('#departmentAddForm').form('submit',{
            //提交表单到item进行处理
            url: 'department/add',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','恭喜！新增部门！');
                    //关闭添加页
                    bysj.closeTabs('新增部门');
                    //重置会受到影响的选项卡
                    if($('#tab').tabs('exists','查询部门')) {
                        bysj.refreshTab('查询部门');
                    }
                }else{
                    $.messager.alert('警告','部门名重复或人数输入有误，新增部门失败！');
                }
            }
        });
    }
</script>