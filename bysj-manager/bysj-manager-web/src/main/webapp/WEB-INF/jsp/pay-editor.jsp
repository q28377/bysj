<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="编辑工资记录" data-options="fit:true">
    <form class="payForm" id="payEditorForm" name="payEditorForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">工资记录编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="pid" name="pid"
                           data-options="required:true" style="width:200px" readonly="readonly"
                           value="${pay.pid}">
                </td>
            </tr>
            <tr>
                <td class="label">员工编号：</td>
                <td>
                    <input class="easyui-textbox" id="sid" name="sid" data-options="required:true"
                           style="width:200px" value="${pay.sid}" readonly="readonly" >
                </td>
            </tr>

            <tr>
                <td class="label">基本工资/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="basic" name="basic"
                           data-options="required:true" style="width:200px"
                           value="${pay.basic}">
                </td>
            </tr>
            <tr>
                <td class="label">饭补/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="eat" name="eat"
                           data-options="required:false" style="width:200px"
                           value="${pay.eat}">
                </td>
            </tr>
            <tr>
                <td class="label">房补/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="house" name="house"
                           data-options="required:false" style="width:200px"
                           value="${pay.house}">
                </td>
            </tr>
            <tr>
                <td class="label">其他补助金/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="other" name="other"
                           data-options="required:false" style="width:200px"
                           value="${pay.other}">
                </td>
            </tr>
            <tr>
                <td class="label">奖金/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="bonus" name="bonus"
                           data-options="required:false" style="width:200px"
                           value="${pay.bonus}">
                </td>
            </tr>
            <tr>
                <td class="label">罚金/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="penalty" name="penalty"
                           data-options="required:false" style="width:200px"
                           value="${pay.penalty}">
                </td>
                <td>
                    <input class="easyui-textbox" type="hidden" id="status" name="status"
                           data-options="required:false" style="width:200px"
                           value="${pay.status}"  >
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="payEditorSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="payEditorClearForm()" class="easyui-linkbutton" type="button"
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
    function payEditorClearForm() {
        bysj.refreshTab('编辑工资记录');
    }

    //提交表单
    function payEditorSubmitForm(){
        $('#payEditorForm').form('submit',{
            url: 'pay/update',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','编辑工资记录成功！');
                    //关闭页
                    bysj.closeTabs('编辑工资记录');
                    //重置页
                    if($('#tab').tabs('exists','查询工资记录')) {
                        bysj.refreshTab('查询工资记录');
                    }
                }else{
                    $.messager.alert('警告','请输入正确的数字格式！');
                }
            }
        });
    }

</script>
