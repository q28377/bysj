<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="easyui-panel" title="编辑用户" data-options="fit:true">
    <form class="userForm" id="userEditorForm" name="userEditorForm" method="post">
        <table style="width:100%;">
            <tr>
                <td class="label">用户编号：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="userId" name="uid" readonly="readonly"
                           data-options="required:true" style="width:200px" value="${user.uid}">
                </td>
            </tr>
            <tr>
                <td class="label">用户名：</td>
                <td>
                    <input class="easyui-textbox" type="text" id="userName2" name="username" readonly="readonly"
                           data-options="required:true" style="width:200px" value="${user.username}">
                </td>
            </tr>
            <tr>
                <td class="label">密码：</td>
                <td>
                    <%--<input class="easyui-textbox" type="text" id="password" name="password"
                           data-options="required:true" style="width:200px" value="${user.password}">--%>
                    <input class="easyui-textbox" type="password" id="password" name="password"
                           data-options="required:true" style="width:200px" value="${user.password}">
                </td>
                <td>
                    <input class="easyui-textbox" id="status" name="status"
                           value="${user.status}" type="hidden">
                </td>
            </tr>
            <tr>
                <td class="label">用户权限：</td>
                <td>
                    <select name="role" id="role">
                        <option value="0">普通用户</option>
                        <option value="1">管理员</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button onclick="userEditorSubmitForm()" class="easyui-linkbutton" type="button"
                            data-options="iconCls:'icon-ok'">保存
                    </button>
                    <button onclick="userEditorClearForm()" class="easyui-linkbutton" type="button"
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

    //选中权限
    var sel = document.getElementById('role');
    for(var i=0;i<sel.options.length;i++){
        if(sel.options[i].value==${user.role}){
            sel.options[i].selected=true;
            break;
        }
    }

    //重置
    function userEditorClearForm() {
        bysj.refreshTab('编辑用户');
    }

    //提交表单
    function userEditorSubmitForm(){
        $('#userEditorForm').form('submit',{
            url: 'user/update',
            //在表单提交之前触发
            onSubmit:function () {
                //如果有任意一个字段没有校验通过，返回false，不会提交表单
                return $(this).form('validate');
            },
            //后台处理成功之后的回调函数
            success:function(data){
                if(data > 0) {
                    $.messager.alert('温馨提示','编辑用户成功！');
                    //关闭页
                    bysj.closeTabs('编辑用户');
                    //重置页
                    if($('#tab').tabs('exists','查询用户')) {
                        bysj.refreshTab('查询用户');
                    }
                }else{
                    $.messager.alert('警告','编辑用户失败！');
                }
            }
        });
    }

</script>
