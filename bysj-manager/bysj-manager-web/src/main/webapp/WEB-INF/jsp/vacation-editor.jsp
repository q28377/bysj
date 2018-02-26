<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="编辑请假记录" data-options="fit:true">
    <form class="vacationForm" id="vacationEditorForm" name="vacationEditorForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">请假记录编号：</td>
                <td>
                    <input class="easyui-textbox" id="vid" name="vid" data-options="required:true"
                           style="width:200px" value="${vacation.vid}" readonly="readonly">
                </td>
            </tr>
            <tr>
                <td class="label">员工编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="sid" name="sid"
                           data-options="required:false" style="width:200px"
                           value="${vacation.sid}" >
                </td>
            </tr>
            <tr>
                <td class="label">开始时间：</td>
                <td>
                    <input type="text" id="start" name="start"
                           onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',
                            minDate:'1990-01-01 00:00:00',maxDate:'2100-01-01 00:00:00'})"
                           style="width:200px"
                           value="<fmt:formatDate value='${vacation.begin}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
                </td>
            </tr>
            <tr>
                <td class="label">结束时间：</td>
                <td>
                    <input type="text" id="finish" name="finish"
                           onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm:ss',
                            minDate:'1990-01-01 00:00:00',maxDate:'2100-01-01 00:00:00'})"
                           style="width:200px"
                           value="<fmt:formatDate value='${vacation.end}' pattern='yyyy-MM-dd HH:mm:ss'/>"/>
                </td>
            </tr>
            <tr>
                <td class="label">请假原因：</td>
                <td>
                    <textarea  id="reason" name="reason"
                               style="width:200px">${vacation.reason}</textarea>
                </td>
            </tr>
            <tr>
                <td class="label">审核人：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="approver" name="approver"
                           data-options="required:false" style="width:200px"
                           value="${vacation.approver}">
                </td>
            </tr>
            <tr>
                <td class="label">是否同意：</td>
                <td>
                    <select  type="text" id="agree" name="agree" style="width:200px">
                        <option value="9">审核中</option>
                        <option value="1">同意</option>
                        <option value="0">不同意</option>
                    </select>
                </td>
                <td>
                    <input class="easyui-textbox" type="hidden" id="status" name="status"
                           data-options="required:false" style="width:200px"
                           value="${vacation.status}"  >
                </td>
            </tr>


            <tr>
                <td colspan="2">
                    <button onclick="vacationEditorSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="vacationEditorClearForm()" class="easyui-linkbutton" type="button"
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
    //选中性别
    var sel = document.getElementById('agree');
    for(var i=0;i<sel.options.length;i++){
        if(sel.options[i].value==${vacation.agree}){
            sel.options[i].selected=true;
            break;
        }
    }

    //加载所属部门的下拉框
    $('#did').combotree({
        url: 'department/all',
        required: true
    });

    //重置
    function vacationEditorClearForm() {
        bysj.refreshTab('编辑请假记录');
    }

    //提交表单
    function vacationEditorSubmitForm(){
        $('#vacationEditorForm').form('submit',{
            url: 'vacation/update',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','编辑请假记录成功！');
                    //关闭页
                    bysj.closeTabs('编辑请假记录');
                    //重置页
                    if($('#tab').tabs('exists','查询请假记录')) {
                        bysj.refreshTab('查询请假记录');
                    }
                }else{
                    $.messager.alert('警告','编辑请假记录失败！请输入为数字的员工编号');
                }
            }
        });
    }

</script>
