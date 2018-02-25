<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="编辑部门" data-options="fit:true">
    <form class="departmentForm" id="departmentEditorForm" name="departmentEditorForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">部门编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="departmentId" name="did" readonly="readonly"
                           data-options="required:true" style="width:200px" value="${department.did}">
                </td>
            </tr>
            <tr>
                <td class="label">部门名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="departmentName" name="dname"
                           data-options="required:true" style="width:200px" value="${department.dname}">
                </td>
            </tr>
            <tr>
                <td class="label">部门人数：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="number" name="number" readonly="readonly"
                           data-options="required:true" style="width:200px" value="${department.number}">
                </td>
            </tr>
            <tr>
                <td class="label">部门创建日期：</td>
                <td>
                    <input type="text" id="time" name="time" data-options="required:false" style="width:200px"
                           value="<fmt:formatDate value='${department.createtime}' pattern='yyyy-MM-dd'/>"
                            onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td class="label">部门描述：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="description" name="description"
                           data-options="required:false" style="width:200px" value="${department.description}">
                </td>
                <td>
                    <input class="easyui-textbox" type="hidden" id="status" name="status"
                           value="${department.status}" >
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="departmentEditorSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="departmentEditorClearForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-undo'">重置
                    </button>
                </td>
            </tr>

        </table>
        <!--<input name="paramData" id="paramData" style="display:none;">-->
    </form>
</div>

<script>

    //重置
    function departmentEditorClearForm() {
        bysj.refreshTab('编辑部门');
    }

    //提交表单
    function departmentEditorSubmitForm(){
        $('#departmentEditorForm').form('submit',{
            url: 'department/update',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','编辑部门成功！');
                    //关闭页
                    bysj.closeTabs('编辑部门');
                    //重置页
                    if($('#tab').tabs('exists','查询部门')) {
                        bysj.refreshTab('查询部门');
                    }
                }else{
                    $.messager.alert('警告','编辑部门失败！');
                }
            }
        });
    }

</script>
