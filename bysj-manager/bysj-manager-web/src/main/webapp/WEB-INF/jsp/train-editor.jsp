<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="编辑培训记录" data-options="fit:true">
    <form class="trainForm" id="trainEditorForm" name="trainEditorForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">培训记录编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="tid" name="tid" readonly="readonly"
                           data-options="required:true" style="width:200px" value="${train.tid}">
                </td>
            </tr>
            <tr>
                <td class="label">培训记录名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="tname" name="tname"
                           data-options="required:true" style="width:200px" value="${train.tname}">
                </td>
            </tr>
            <tr>
                <td class="label">培训目的：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="purpose" name="purpose"
                           data-options="required:false" style="width:200px" value="${train.purpose}">
                </td>
            </tr>
            <tr>
                <td class="label">培训开始日期：</td>
                <td>
                    <input type="text" id="start" name="start" data-options="required:false" style="width:200px"
                           value="<fmt:formatDate value='${train.begain}' pattern='yyyy-MM-dd'/>"
                           onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td class="label">培训结束日期：</td>
                <td>
                    <input type="text" id="finish" name="finish" data-options="required:false" style="width:200px"
                           value="<fmt:formatDate value='${train.end}' pattern='yyyy-MM-dd'/>"
                           onClick="WdatePicker()"/>
                </td>
            </tr>
            <tr>
                <td class="label">培训负责人：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="head" name="head"
                           data-options="required:false" style="width:200px" value="${train.head}">
                </td>
            </tr>
            <tr>
                <td class="label">培训人数：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="number" name="number"
                           data-options="required:true" style="width:200px" value="${train.number}">
                </td>
            </tr>
            <tr>
                <td class="label">培训记录：</td>
                <td>
                    <textarea  id="description" name="description"
                               style="width:200px">${train.description}</textarea>
                </td>
                <td>
                    <input class="easyui-textbox" type="hidden" id="status" name="status"
                           value="${train.status}" >
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="trainEditorSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="trainEditorClearForm()" class="easyui-linkbutton" type="button"
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
    function trainEditorClearForm() {
        bysj.refreshTab('编辑培训记录');
    }

    //提交表单
    function trainEditorSubmitForm(){
        $('#trainEditorForm').form('submit',{
            url: 'train/update',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','编辑培训记录成功！');
                    //关闭页
                    bysj.closeTabs('编辑培训记录');
                    //重置页
                    if($('#tab').tabs('exists','查询培训记录')) {
                        bysj.refreshTab('查询培训记录');
                    }
                }else{
                    $.messager.alert('警告','编辑培训记录失败！');
                }
            }
        });
    }

</script>
