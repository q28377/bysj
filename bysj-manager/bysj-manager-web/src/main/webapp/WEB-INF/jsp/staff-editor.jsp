<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="编辑员工" data-options="fit:true">
    <form class="staffForm" id="staffEditorForm" name="staffEditorForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">员工编号：</td>
                <td>
                    <input class="easyui-textbox" id="sid" name="sid" data-options="required:true" style="width:200px"
                           value="${staff.sid}" readonly="readonly">
                </td>
            </tr>
            <tr>
                <td class="label">所属部门：</td>
                <td>
                    <input id="did" name="did" data-options="required:true" style="width:200px"
                           value="${staff.did}">
                </td>
            </tr>
            <tr>
                <td class="label">员工姓名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="name" name="name"
                           data-options="required:true" style="width:200px"
                           value="${staff.name}">
                </td>
            </tr>
            <tr>
                <td class="label">员工性别：</td>
                <td>
                    <select  id="gender" name="gender" style="width:200px">
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">员工出生日期：</td>
                <td>
                    <input type="text" id="brith" name="brith" onClick="WdatePicker()" style="width:200px"
                           value="<fmt:formatDate value='${staff.brithday}' pattern='yyyy-MM-dd'/>"/>
                </td>
            </tr>
            <tr>
                <td class="label">手机号码：</td>
                <td>
                    <input type="text" id="telephone" name="telephone"
                           style="width:200px" onblur="telCheck()"
                           value="${staff.telephone}">
                    <span id="tel" style="color: red"></span>
                </td>
            </tr>
            <tr>
                <td class="label">电子邮箱：</td>
                <td>
                    <input type="text" id="email" name="email"
                           style="width:200px" onblur="emailCheck()"
                           value="${staff.email}">
                    <span id="em" style="color: red"></span>
                </td>
            </tr>
            <tr>
                <td class="label">学历：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="education" name="education"
                           data-options="required:false" style="width:200px"
                           value="${staff.education}">
                </td>
            </tr>
            <tr>
                <td class="label">毕业学校：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="school" name="school"
                           data-options="required:false" style="width:200px"
                           value="${staff.school}">
                </td>
            </tr>
            <tr>
                <td class="label">籍贯：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="nativeplace" name="nativeplace"
                           data-options="required:false" style="width:200px"
                           value="${staff.nativeplace}">
                </td>
            </tr>
            <tr>
                <td class="label">住址：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="address" name="address"
                           data-options="required:false" style="width:200px"
                           value="${staff.address}">
                </td>
            </tr>
            <tr>
                <td class="label">职称：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="position" name="position"
                           data-options="required:false" style="width:200px"
                           value="${staff.position}">
                </td>
            </tr>
            <%--<tr>
                <td class="label">总工资/元：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="pay" name="pay"
                           data-options="required:false" style="width:200px"
                           value="${staff.pay}">
                </td>
            </tr>--%>
            <tr>
                <td class="label">入职日期：</td>
                <td>
                    <input type="text" id="join" name="join" onClick="WdatePicker()"
                           style="width:200px"
                           value="<fmt:formatDate value='${staff.begin}' pattern='yyyy-MM-dd'/>"/>
                </td>
            </tr>
            <tr>
                <td class="label">合同到期日期：</td>
                <td>
                    <input type="text" id="exit" name="exit" onClick="WdatePicker()"
                           style="width:200px"
                           value="<fmt:formatDate value='${staff.end}' pattern='yyyy-MM-dd'/>"/>
                </td>
            </tr>
            <tr>
                <td class="label">合同编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="contract" name="contract"
                           data-options="required:false" style="width:200px"
                           value="${staff.contract}">
                </td>
            </tr>
            <tr>
                <td class="label">其他信息：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="other" name="other"
                           data-options="required:false" style="width:200px"
                           value="${staff.other}">
                </td>
                <td>
                    <input class="easyui-textbox" type="hidden" id="status" name="status"
                           data-options="required:false" style="width:200px"
                           value="${staff.status}"  >
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="staffEditorSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="staffEditorClearForm()" class="easyui-linkbutton" type="button"
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
    var sel = document.getElementById('gender');
    for(var i=0;i<sel.options.length;i++){
        if(sel.options[i].value==${staff.gender}){
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
    function staffEditorClearForm() {
        bysj.refreshTab('编辑员工');
    }

    //提交表单
    function staffEditorSubmitForm(){
        $('#staffEditorForm').form('submit',{
            url: 'staff/update',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','编辑员工成功！');
                    //关闭页
                    bysj.closeTabs('编辑员工');
                    //重置页
                    if($('#tab').tabs('exists','查询员工')) {
                        bysj.refreshTab('查询员工');
                    }
                }else{
                    $.messager.alert('警告','编辑员工失败！');
                }
            }
        });
    }

</script>
